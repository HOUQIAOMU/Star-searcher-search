#include <ros/ros.h>
#include <apriltag_ros/AprilTagDetectionArray.h>
#include <visualization_msgs/MarkerArray.h>
#include <tf2_ros/transform_listener.h>
#include <tf2_geometry_msgs/tf2_geometry_msgs.h>
#include <cmath>
#include <set>

class TagBridge {
private:
    ros::NodeHandle nh;
    ros::Subscriber sub;
    ros::Publisher marker_pub;
    tf2_ros::Buffer tf_buffer;
    tf2_ros::TransformListener tf_listener;
    std::set<int> detected_ids;

public:
    TagBridge() : tf_listener(tf_buffer) {
        sub = nh.subscribe("/tag_detections", 10, &TagBridge::callback, this);
        marker_pub = nh.advertise<visualization_msgs::MarkerArray>("/detected_tag_markers", 10);
    }

    void callback(const apriltag_ros::AprilTagDetectionArray::ConstPtr& msg) {
        visualization_msgs::MarkerArray marker_array;
        
        for (const auto& detection : msg->detections) {
            int id = detection.id[0];
            if (detected_ids.count(id)) continue;

            try {
                // // TF 坐标转换
                // geometry_msgs::PoseStamped source_pose;
                // source_pose.header = detection.pose.header;
                // source_pose.pose = detection.pose.pose.pose;

                // // 使用当前时间戳进行转换，避免过期数据问题
                // geometry_msgs::PoseStamped target_pose;
                // tf_buffer.transform(source_pose, target_pose, "world", ros::Duration(0.1));
                // //tf_buffer.transform(source_pose, target_pose, "world", source_pose.header.stamp);
                geometry_msgs::TransformStamped transform = tf_buffer.lookupTransform(
                    "world", 
                    detection.pose.header.frame_id, 
                    detection.pose.header.stamp, // 使用 image timestamp
                    ros::Duration(0.1));         // 给 100ms 等待缓冲区数据

                // 2. 将检测到的位姿（pose）进行转换
                 geometry_msgs::PoseStamped source_pose;
                 source_pose.header = detection.pose.header;
                 source_pose.pose = detection.pose.pose.pose;
    
                 geometry_msgs::PoseStamped target_pose;
                 tf2::doTransform(source_pose, target_pose, transform);

                 // 现在 target_pose 就是极其精确的 World 坐标了
                

                // 距离确认，如果距离过远则不显示marker
                double distance = sqrt(pow(target_pose.pose.position.x, 2) + 
                                       pow(target_pose.pose.position.y, 2) + 
                                       pow(target_pose.pose.position.z, 2));
                if (distance > 5.0) {
                    ROS_WARN("Tag %d is too far (%.2f m), skipping marker.", id, distance);
                    continue;
                }

                // 创建 Marker
                visualization_msgs::Marker marker;
                marker.header.frame_id = "world"; //rostopic echo /ardrone/ground_truth/odometry显示的world坐标系
                marker.header.stamp = ros::Time::now();
                marker.ns = "tags";
                marker.id = id;
                marker.type = visualization_msgs::Marker::SPHERE;
                marker.action = visualization_msgs::Marker::ADD;
                marker.pose = target_pose.pose;
                marker.pose.position.z += 0.25; // 抬高一点
                
                //让我的marker更明显一些
                // marker.scale.x = 0.3; marker.scale.y = 0.3; marker.scale.z = 0.5;
                // marker.color.r = 1.0; marker.color.g = 0.0; marker.color.b = 0.0; marker.color.a = 1.0;
                // 增大尺寸
                marker.scale.x = 0.4; marker.scale.y = 0.4; marker.scale.z = 0.4;

                // 使用荧光绿 + 半透明边缘效果
                marker.color.r = 0.0; marker.color.g = 1.0; marker.color.b = 0.0; marker.color.a = 1.0;


                marker_array.markers.push_back(marker);
                detected_ids.insert(id);
                ROS_INFO("Detected Tag %d in C++!", id);
            } catch (tf2::TransformException &ex) {
                ROS_WARN("TF error: %s", ex.what());
            }
        }
        marker_pub.publish(marker_array);
    }
};


int main(int argc, char** argv) {
    ros::init(argc, argv, "tag_to_marker_bridge");
    TagBridge bridge;
    ros::spin();
    return 0;
}