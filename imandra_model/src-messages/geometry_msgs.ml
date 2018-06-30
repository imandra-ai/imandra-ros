open Basic_types;;

type point = {
   point_x : float64 ;
   point_y : float64 ;
   point_z : float64 ;
}

type vector3 = {
   vector3_x : float64 ;
   vector3_y : float64 ;
   vector3_z : float64 ;
}

type quaternion = {
   quaternion_x : float64 ;
   quaternion_y : float64 ;
   quaternion_z : float64 ;
   quaternion_w : float64 ;
}

type inertia = {
   m : float64 ;
   com : vector3 ;
   ixx : float64 ;
   ixy : float64 ;
   ixz : float64 ;
   iyy : float64 ;
   iyz : float64 ;
   izz : float64 ;
}

type pose2D = {
   pose2D_x : float64 ;
   pose2D_y : float64 ;
   pose2D_theta : float64 ;
}

type pointStamped = {
   pointStamped_header : Std_msgs.header ;
   pointStamped_point : point ;
}

type point32 = {
   point32_x : float32 ;
   point32_y : float32 ;
   point32_z : float32 ;
}

type quaternionStamped = {
   quaternionStamped_header : Std_msgs.header ;
   quaternionStamped_quaternion : quaternion ;
}

type transform = {
   translation : vector3 ;
   rotation : quaternion ;
}

type accel = {
   accel_linear : vector3 ;
   accel_angular : vector3 ;
}

type accelWithCovariance = {
   accelWithCovariance_accel : accel ;
   accelWithCovariance_covariance : float64 list ;
}

type wrench = {
   force : vector3 ;
   torque : vector3 ;
}

type wrenchStamped = {
   wrenchStamped_header : Std_msgs.header ;
   wrenchStamped_wrench : wrench ;
}

type pose = {
   position : point ;
   orientation : quaternion ;
}

type twist = {
   twist_linear : vector3 ;
   twist_angular : vector3 ;
}

type vector3Stamped = {
   vector3Stamped_header : Std_msgs.header ;
   vector3Stamped_vector : vector3 ;
}

type inertiaStamped = {
   inertiaStamped_header : Std_msgs.header ;
   inertiaStamped_inertia : inertia ;
}

type twistStamped = {
   twistStamped_header : Std_msgs.header ;
   twistStamped_twist : twist ;
}

type transformStamped = {
   transformStamped_header : Std_msgs.header ;
   transformStamped_child_frame_id : string ;
   transformStamped_transform : transform ;
}

type poseStamped = {
   poseStamped_header : Std_msgs.header ;
   poseStamped_pose : pose ;
}

type polygon = {
   points : point32 list ;
}

type accelStamped = {
   accelStamped_header : Std_msgs.header ;
   accelStamped_accel : accel ;
}

type accelWithCovarianceStamped = {
   accelWithCovarianceStamped_header : Std_msgs.header ;
   accelWithCovarianceStamped_accel : accelWithCovariance ;
}

type poseWithCovariance = {
   poseWithCovariance_pose : pose ;
   poseWithCovariance_covariance : float64 list ;
}

type poseArray = {
   poseArray_header : Std_msgs.header ;
   poseArray_poses : pose list ;
}

type polygonStamped = {
   polygonStamped_header : Std_msgs.header ;
   polygonStamped_polygon : polygon ;
}

type twistWithCovariance = {
   twistWithCovariance_twist : twist ;
   twistWithCovariance_covariance : float64 list ;
}

type poseWithCovarianceStamped = {
   poseWithCovarianceStamped_header : Std_msgs.header ;
   poseWithCovarianceStamped_pose : poseWithCovariance ;
}

type twistWithCovarianceStamped = {
   twistWithCovarianceStamped_header : Std_msgs.header ;
   twistWithCovarianceStamped_twist : twistWithCovariance ;
}

