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
   point : point ;
}

type point32 = {
   point32_x : float32 ;
   point32_y : float32 ;
   point32_z : float32 ;
}

type quaternionStamped = {
   quaternion : quaternion ;
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
   wrench : wrench ;
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
   vector : vector3 ;
}

type inertiaStamped = {
   inertia : inertia ;
}

type twistStamped = {
   twistStamped_twist : twist ;
}

type transformStamped = {
   child_frame_id : string ;
   transform : transform ;
}

type poseStamped = {
   poseStamped_pose : pose ;
}

type polygon = {
   points : point32 list ;
}

type accelStamped = {
   accelStamped_accel : accel ;
}

type accelWithCovarianceStamped = {
   accelWithCovarianceStamped_accel : accelWithCovariance ;
}

type poseWithCovariance = {
   poseWithCovariance_pose : pose ;
   poseWithCovariance_covariance : float64 list ;
}

type poseArray = {
   poses : pose list ;
}

type polygonStamped = {
   polygon : polygon ;
}

type twistWithCovariance = {
   twistWithCovariance_twist : twist ;
   twistWithCovariance_covariance : float64 list ;
}

type poseWithCovarianceStamped = {
   poseWithCovarianceStamped_pose : poseWithCovariance ;
}

type twistWithCovarianceStamped = {
   twistWithCovarianceStamped_twist : twistWithCovariance ;
}

