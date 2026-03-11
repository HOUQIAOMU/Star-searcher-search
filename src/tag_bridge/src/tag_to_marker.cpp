#include <ros/ros.h>
#include <apriltag_ros/AprilTagDetectionArray.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <cmath>
#include <set>
#include <map>
#include <deque>

class TagBridge {
private:
    ros::NodeHandle nh;
    ros::Subscriber sub;
    ros::Publisher marker_pub;
    tf2_ros::Buffer tf_buffer;
    tf2_ros::TransformListener tf_listener;
    std::set<int> detected_ids;

    // --- 滤波相关参数 ---
    struct TagPos { double x, y, z; };
    std::map<int, std::deque<TagPos>> pos_buffer; // 存储每个ID的历史位置
    const size_t WINDOW_SIZE = 5;                 // 平均滤波窗口大小

public:
    TagBridge() : tf_listener(tf_buffer) {
        sub = nh.subscribe("/tag_detections", 10, &TagBridge::callback, this);
        marker_pub = nh.advertise<visualization_msgs::MarkerArray>("/detected_tag_markers", 10);
    }

    void callback(const apriltag_ros::AprilTagDetectionArray::ConstPtr& msg) {
        visualization_msgs::MarkerArray marker_array;
        
        for (const auto& detection : msg->detections) {
            int id = detection.id[0];
            // 如果已经确认过的Tag不想重复处理，可以保留这行，
            // 但如果想实时跟踪，建议注释掉下面这行
            // if (detected_ids.count(id)) continue; 

            // 1. 距离过滤：判断 Tag 离相机的相对距离（使用原始消息中的位姿）
            double rel_x = detection.pose.pose.pose.position.x;
            double rel_y = detection.pose.pose.pose.position.y;
            double rel_z = detection.pose.pose.pose.position.z;
            double rel_dist = sqrt(rel_x*rel_x + rel_y*rel_y + rel_z*rel_z);

            if (rel_dist > 8.0) { // 如果离相机超过6米，跳过
                ROS_DEBUG("Tag %d too far from camera (%.2f m)", id, rel_dist);
                continue;
            }

            try {
                // 2. TF 坐标同步转换
                geometry_msgs::TransformStamped transform = tf_buffer.lookupTransform(
                    "world", 
                    detection.pose.header.frame_id, 
                    detection.pose.header.stamp, 
                    ros::Duration(0.1));

                geometry_msgs::PoseStamped source_pose;
                source_pose.header = detection.pose.header;
                source_pose.pose = detection.pose.pose.pose;
    
                geometry_msgs::PoseStamped target_pose;
                tf2::doTransform(source_pose, target_pose, transform);

                // 3. 多帧平均滤波逻辑
                TagPos current_p = {target_pose.pose.position.x, target_pose.pose.position.y, target_pose.pose.position.z};
                pos_buffer[id].push_back(current_p);

                if (pos_buffer[id].size() > WINDOW_SIZE) {
                    pos_buffer[id].pop_front();
                }

                // 只有采样达到窗口大小时才发布 Marker，确保数据稳定
                if (pos_buffer[id].size() == WINDOW_SIZE) {
                    TagPos avg_p = {0, 0, 0};
                    for (const auto& p : pos_buffer[id]) {
                        avg_p.x += p.x; avg_p.y += p.y; avg_p.z += p.z;
                    }
                    avg_p.x /= WINDOW_SIZE; avg_p.y /= WINDOW_SIZE; avg_p.z /= WINDOW_SIZE;

                    // --- 创建 Marker (柱子) ---
                    visualization_msgs::Marker marker;
                    marker.header.frame_id = "world";
                    marker.header.stamp = ros::Time::now();
                    marker.ns = "tag_pillars";
                    marker.id = id;
                    marker.type = visualization_msgs::Marker::CYLINDER;
                    marker.action = visualization_msgs::Marker::ADD;
                    
                    double x_offset = 1.3; // 可以根据需要调整偏移
                    marker.pose.position.x = avg_p.x + x_offset;
                    marker.pose.position.y = avg_p.y;
                    marker.pose.position.z = avg_p.z + 0.5; // 柱子底座在中心，往上提半个高度
                    
                    marker.scale.x = 0.2; marker.scale.y = 0.2; marker.scale.z = 1.0;
                    marker.color.r = 0.0; marker.color.g = 1.0; marker.color.b = 0.0; marker.color.a = 0.8;

                    // --- 创建 ID 文本 Marker (方便辨认) ---
                    visualization_msgs::Marker text_marker;
                    text_marker.header = marker.header;
                    text_marker.ns = "tag_labels";
                    text_marker.id = id + 1000;
                    text_marker.type = visualization_msgs::Marker::TEXT_VIEW_FACING;
                    text_marker.pose.position = marker.pose.position;
                    text_marker.pose.position.z += 0.8; // 飘在柱子上方
                    text_marker.scale.z = 0.4; // 字体大小
                    text_marker.color.r = 0.0; text_marker.color.g = 0.0; text_marker.color.b = 1.0; text_marker.color.a = 1.0;
                    text_marker.text = "ID: " + std::to_string(id);

                    marker_array.markers.push_back(marker);
                    marker_array.markers.push_back(text_marker);
                    
                    detected_ids.insert(id); // 记录已标记
                    ROS_INFO("Detected Tag ID: %d", id);
                }
                
            } catch (tf2::TransformException &ex) {
                ROS_WARN("TF error: %s", ex.what());
            }
        }
        if (!marker_array.markers.empty()) {
            marker_pub.publish(marker_array);
        }
    }
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "tag_to_marker_bridge");
    TagBridge bridge;
    ros::spin();
    return 0;
}