# 增添内容
### **part1**
内容：
1. 做了apriltag里面图片的修正，解决了贴图不能正常显示的问题。
2. 创建tag_to_marker node，通过订阅apriltag_ros发布的tag_detection话题，把tag和marker桥接起来，实现发现tag时，可以在rviz中创建一个marker。
3. 对于marker显示非常不准的问题，加入多帧滤波，并按照经验加入少量偏移。

痛点：
从可能会漏tag调参到都能正常的发现，但是识别位置不是非常精准，后续可能会修改算法。


### part2
内容：
想要star-searcher像fuel一样，不只在gazebo地图下飞行，也能在仅rviz点云图中探索飞行，以对比两种算法的性能（作为论文里的一部分）。

痛点：
map和uav可以正常显示，但是cloud/depth信息就是跑不通不显示。无人机在接收trigger后直接finish exploration。找问题从感知层找到建图层，改remap，主要找odom和pcl_render_node/depth的各种信息，最后发现通信都是通的。再找到pcl_render_node的源码，好像都没问题，经过了三个半下午终究一无所获。
准备以fuel框架重新写一个star-seacher的探索逻辑了，这样也许能更简单一点。

