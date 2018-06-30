open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Geometry_msgs;;

let point_to_json x = [
    ( "point_x" , x.point_x |> float64_to_json );
    ( "point_y" , x.point_y |> float64_to_json );
    ( "point_z" , x.point_z |> float64_to_json );
    ] |> assoc_filter_nulls

let vector3_to_json x = [
    ( "vector3_x" , x.vector3_x |> float64_to_json );
    ( "vector3_y" , x.vector3_y |> float64_to_json );
    ( "vector3_z" , x.vector3_z |> float64_to_json );
    ] |> assoc_filter_nulls

let quaternion_to_json x = [
    ( "quaternion_x" , x.quaternion_x |> float64_to_json );
    ( "quaternion_y" , x.quaternion_y |> float64_to_json );
    ( "quaternion_z" , x.quaternion_z |> float64_to_json );
    ( "quaternion_w" , x.quaternion_w |> float64_to_json );
    ] |> assoc_filter_nulls

let inertia_to_json x = [
    ( "m" , x.m |> float64_to_json );
    ( "com" , x.com |> vector3_to_json );
    ( "ixx" , x.ixx |> float64_to_json );
    ( "ixy" , x.ixy |> float64_to_json );
    ( "ixz" , x.ixz |> float64_to_json );
    ( "iyy" , x.iyy |> float64_to_json );
    ( "iyz" , x.iyz |> float64_to_json );
    ( "izz" , x.izz |> float64_to_json );
    ] |> assoc_filter_nulls

let pose2D_to_json x = [
    ( "pose2D_x" , x.pose2D_x |> float64_to_json );
    ( "pose2D_y" , x.pose2D_y |> float64_to_json );
    ( "pose2D_theta" , x.pose2D_theta |> float64_to_json );
    ] |> assoc_filter_nulls

let pointStamped_to_json x = [
    ( "pointStamped_header" , x.pointStamped_header |> Std_msgs_to_json.header_to_json );
    ( "pointStamped_point" , x.pointStamped_point |> point_to_json );
    ] |> assoc_filter_nulls

let point32_to_json x = [
    ( "point32_x" , x.point32_x |> float32_to_json );
    ( "point32_y" , x.point32_y |> float32_to_json );
    ( "point32_z" , x.point32_z |> float32_to_json );
    ] |> assoc_filter_nulls

let quaternionStamped_to_json x = [
    ( "quaternionStamped_header" , x.quaternionStamped_header |> Std_msgs_to_json.header_to_json );
    ( "quaternionStamped_quaternion" , x.quaternionStamped_quaternion |> quaternion_to_json );
    ] |> assoc_filter_nulls

let transform_to_json x = [
    ( "translation" , x.translation |> vector3_to_json );
    ( "rotation" , x.rotation |> quaternion_to_json );
    ] |> assoc_filter_nulls

let accel_to_json x = [
    ( "accel_linear" , x.accel_linear |> vector3_to_json );
    ( "accel_angular" , x.accel_angular |> vector3_to_json );
    ] |> assoc_filter_nulls

let accelWithCovariance_to_json x = [
    ( "accelWithCovariance_accel" , x.accelWithCovariance_accel |> accel_to_json );
    ( "accelWithCovariance_covariance" , x.accelWithCovariance_covariance |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let wrench_to_json x = [
    ( "force" , x.force |> vector3_to_json );
    ( "torque" , x.torque |> vector3_to_json );
    ] |> assoc_filter_nulls

let wrenchStamped_to_json x = [
    ( "wrenchStamped_header" , x.wrenchStamped_header |> Std_msgs_to_json.header_to_json );
    ( "wrenchStamped_wrench" , x.wrenchStamped_wrench |> wrench_to_json );
    ] |> assoc_filter_nulls

let pose_to_json x = [
    ( "position" , x.position |> point_to_json );
    ( "orientation" , x.orientation |> quaternion_to_json );
    ] |> assoc_filter_nulls

let twist_to_json x = [
    ( "twist_linear" , x.twist_linear |> vector3_to_json );
    ( "twist_angular" , x.twist_angular |> vector3_to_json );
    ] |> assoc_filter_nulls

let vector3Stamped_to_json x = [
    ( "vector3Stamped_header" , x.vector3Stamped_header |> Std_msgs_to_json.header_to_json );
    ( "vector3Stamped_vector" , x.vector3Stamped_vector |> vector3_to_json );
    ] |> assoc_filter_nulls

let inertiaStamped_to_json x = [
    ( "inertiaStamped_header" , x.inertiaStamped_header |> Std_msgs_to_json.header_to_json );
    ( "inertiaStamped_inertia" , x.inertiaStamped_inertia |> inertia_to_json );
    ] |> assoc_filter_nulls

let twistStamped_to_json x = [
    ( "twistStamped_header" , x.twistStamped_header |> Std_msgs_to_json.header_to_json );
    ( "twistStamped_twist" , x.twistStamped_twist |> twist_to_json );
    ] |> assoc_filter_nulls

let transformStamped_to_json x = [
    ( "transformStamped_header" , x.transformStamped_header |> Std_msgs_to_json.header_to_json );
    ( "transformStamped_child_frame_id" , x.transformStamped_child_frame_id |> string_to_json );
    ( "transformStamped_transform" , x.transformStamped_transform |> transform_to_json );
    ] |> assoc_filter_nulls

let poseStamped_to_json x = [
    ( "poseStamped_header" , x.poseStamped_header |> Std_msgs_to_json.header_to_json );
    ( "poseStamped_pose" , x.poseStamped_pose |> pose_to_json );
    ] |> assoc_filter_nulls

let polygon_to_json x = [
    ( "points" , x.points |> (mklist point32_to_json) );
    ] |> assoc_filter_nulls

let accelStamped_to_json x = [
    ( "accelStamped_header" , x.accelStamped_header |> Std_msgs_to_json.header_to_json );
    ( "accelStamped_accel" , x.accelStamped_accel |> accel_to_json );
    ] |> assoc_filter_nulls

let accelWithCovarianceStamped_to_json x = [
    ( "accelWithCovarianceStamped_header" , x.accelWithCovarianceStamped_header |> Std_msgs_to_json.header_to_json );
    ( "accelWithCovarianceStamped_accel" , x.accelWithCovarianceStamped_accel |> accelWithCovariance_to_json );
    ] |> assoc_filter_nulls

let poseWithCovariance_to_json x = [
    ( "poseWithCovariance_pose" , x.poseWithCovariance_pose |> pose_to_json );
    ( "poseWithCovariance_covariance" , x.poseWithCovariance_covariance |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let poseArray_to_json x = [
    ( "poseArray_header" , x.poseArray_header |> Std_msgs_to_json.header_to_json );
    ( "poseArray_poses" , x.poseArray_poses |> (mklist pose_to_json) );
    ] |> assoc_filter_nulls

let polygonStamped_to_json x = [
    ( "polygonStamped_header" , x.polygonStamped_header |> Std_msgs_to_json.header_to_json );
    ( "polygonStamped_polygon" , x.polygonStamped_polygon |> polygon_to_json );
    ] |> assoc_filter_nulls

let twistWithCovariance_to_json x = [
    ( "twistWithCovariance_twist" , x.twistWithCovariance_twist |> twist_to_json );
    ( "twistWithCovariance_covariance" , x.twistWithCovariance_covariance |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let poseWithCovarianceStamped_to_json x = [
    ( "poseWithCovarianceStamped_header" , x.poseWithCovarianceStamped_header |> Std_msgs_to_json.header_to_json );
    ( "poseWithCovarianceStamped_pose" , x.poseWithCovarianceStamped_pose |> poseWithCovariance_to_json );
    ] |> assoc_filter_nulls

let twistWithCovarianceStamped_to_json x = [
    ( "twistWithCovarianceStamped_header" , x.twistWithCovarianceStamped_header |> Std_msgs_to_json.header_to_json );
    ( "twistWithCovarianceStamped_twist" , x.twistWithCovarianceStamped_twist |> twistWithCovariance_to_json );
    ] |> assoc_filter_nulls

