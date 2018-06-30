open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Trajectory_msgs;;

let json_to_multiDOFJointTrajectoryPoint_opt json = 
    jreq json "multiDOFJointTrajectoryPoint_transforms" (jlist Geometry_msgs_of_json.json_to_transform_opt) @@ fun multiDOFJointTrajectoryPoint_transforms ->
    jreq json "multiDOFJointTrajectoryPoint_velocities" (jlist Geometry_msgs_of_json.json_to_twist_opt) @@ fun multiDOFJointTrajectoryPoint_velocities ->
    jreq json "multiDOFJointTrajectoryPoint_accelerations" (jlist Geometry_msgs_of_json.json_to_twist_opt) @@ fun multiDOFJointTrajectoryPoint_accelerations ->
    jreq json "multiDOFJointTrajectoryPoint_time_from_start" json_to_duration_opt @@ fun multiDOFJointTrajectoryPoint_time_from_start ->
    Some {
    multiDOFJointTrajectoryPoint_transforms;
    multiDOFJointTrajectoryPoint_velocities;
    multiDOFJointTrajectoryPoint_accelerations;
    multiDOFJointTrajectoryPoint_time_from_start;
    }

let json_to_multiDOFJointTrajectory_opt json = 
    jreq json "multiDOFJointTrajectory_header" Std_msgs_of_json.json_to_header_opt @@ fun multiDOFJointTrajectory_header ->
    jreq json "multiDOFJointTrajectory_joint_names" (jlist json_to_string_opt) @@ fun multiDOFJointTrajectory_joint_names ->
    jreq json "multiDOFJointTrajectory_points" (jlist json_to_multiDOFJointTrajectoryPoint_opt) @@ fun multiDOFJointTrajectory_points ->
    Some {
    multiDOFJointTrajectory_header;
    multiDOFJointTrajectory_joint_names;
    multiDOFJointTrajectory_points;
    }

let json_to_jointTrajectoryPoint_opt json = 
    jreq json "jointTrajectoryPoint_positions" (jlist json_to_float64_opt) @@ fun jointTrajectoryPoint_positions ->
    jreq json "jointTrajectoryPoint_velocities" (jlist json_to_float64_opt) @@ fun jointTrajectoryPoint_velocities ->
    jreq json "jointTrajectoryPoint_accelerations" (jlist json_to_float64_opt) @@ fun jointTrajectoryPoint_accelerations ->
    jreq json "jointTrajectoryPoint_effort" (jlist json_to_float64_opt) @@ fun jointTrajectoryPoint_effort ->
    jreq json "jointTrajectoryPoint_time_from_start" json_to_duration_opt @@ fun jointTrajectoryPoint_time_from_start ->
    Some {
    jointTrajectoryPoint_positions;
    jointTrajectoryPoint_velocities;
    jointTrajectoryPoint_accelerations;
    jointTrajectoryPoint_effort;
    jointTrajectoryPoint_time_from_start;
    }

let json_to_jointTrajectory_opt json = 
    jreq json "jointTrajectory_header" Std_msgs_of_json.json_to_header_opt @@ fun jointTrajectory_header ->
    jreq json "jointTrajectory_joint_names" (jlist json_to_string_opt) @@ fun jointTrajectory_joint_names ->
    jreq json "jointTrajectory_points" (jlist json_to_jointTrajectoryPoint_opt) @@ fun jointTrajectory_points ->
    Some {
    jointTrajectory_header;
    jointTrajectory_joint_names;
    jointTrajectory_points;
    }

