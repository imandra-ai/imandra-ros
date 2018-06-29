open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Trajectory_msgs;;

let multiDOFJointTrajectoryPoint_to_json x = [
    ( "multiDOFJointTrajectoryPoint_transforms" , x.multiDOFJointTrajectoryPoint_transforms |> (mklist Geometry_msgs_to_json.transform_to_json) );
    ( "multiDOFJointTrajectoryPoint_velocities" , x.multiDOFJointTrajectoryPoint_velocities |> (mklist Geometry_msgs_to_json.twist_to_json) );
    ( "multiDOFJointTrajectoryPoint_accelerations" , x.multiDOFJointTrajectoryPoint_accelerations |> (mklist Geometry_msgs_to_json.twist_to_json) );
    ( "multiDOFJointTrajectoryPoint_time_from_start" , x.multiDOFJointTrajectoryPoint_time_from_start |> duration_to_json );
    ] |> assoc_filter_nulls

let multiDOFJointTrajectory_to_json x = [
    ( "multiDOFJointTrajectory_joint_names" , x.multiDOFJointTrajectory_joint_names |> (mklist string_to_json) );
    ( "multiDOFJointTrajectory_points" , x.multiDOFJointTrajectory_points |> (mklist multiDOFJointTrajectoryPoint_to_json) );
    ] |> assoc_filter_nulls

let jointTrajectoryPoint_to_json x = [
    ( "jointTrajectoryPoint_positions" , x.jointTrajectoryPoint_positions |> (mklist float64_to_json) );
    ( "jointTrajectoryPoint_velocities" , x.jointTrajectoryPoint_velocities |> (mklist float64_to_json) );
    ( "jointTrajectoryPoint_accelerations" , x.jointTrajectoryPoint_accelerations |> (mklist float64_to_json) );
    ( "jointTrajectoryPoint_effort" , x.jointTrajectoryPoint_effort |> (mklist float64_to_json) );
    ( "jointTrajectoryPoint_time_from_start" , x.jointTrajectoryPoint_time_from_start |> duration_to_json );
    ] |> assoc_filter_nulls

let jointTrajectory_to_json x = [
    ( "jointTrajectory_joint_names" , x.jointTrajectory_joint_names |> (mklist string_to_json) );
    ( "jointTrajectory_points" , x.jointTrajectory_points |> (mklist jointTrajectoryPoint_to_json) );
    ] |> assoc_filter_nulls

