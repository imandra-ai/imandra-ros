open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Nav_msgs;;

let json_to_getMapGoal_opt json : getMapGoal option = Some ()

let json_to_odometry_opt json = 
    jreq json "child_frame_id" json_to_string_opt @@ fun child_frame_id ->
    jreq json "pose" Geometry_msgs_of_json.json_to_poseWithCovariance_opt @@ fun pose ->
    jreq json "twist" Geometry_msgs_of_json.json_to_twistWithCovariance_opt @@ fun twist ->
    Some {
    child_frame_id;
    pose;
    twist;
    }

let json_to_mapMetaData_opt json = 
    jreq json "map_load_time" json_to_time_opt @@ fun map_load_time ->
    jreq json "resolution" json_to_float32_opt @@ fun resolution ->
    jreq json "width" json_to_uint32_opt @@ fun width ->
    jreq json "height" json_to_uint32_opt @@ fun height ->
    jreq json "origin" Geometry_msgs_of_json.json_to_pose_opt @@ fun origin ->
    Some {
    map_load_time;
    resolution;
    width;
    height;
    origin;
    }

let json_to_getMapFeedback_opt json : getMapFeedback option = Some ()

let json_to_gridCells_opt json = 
    jreq json "cell_width" json_to_float32_opt @@ fun cell_width ->
    jreq json "cell_height" json_to_float32_opt @@ fun cell_height ->
    jreq json "cells" (jlist Geometry_msgs_of_json.json_to_point_opt) @@ fun cells ->
    Some {
    cell_width;
    cell_height;
    cells;
    }

let json_to_path_opt json = 
    jreq json "poses" (jlist Geometry_msgs_of_json.json_to_poseStamped_opt) @@ fun poses ->
    Some {
    poses;
    }

let json_to_getMapActionGoal_opt json = 
    jreq json "goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun goal_id ->
    jreq json "goal" json_to_getMapGoal_opt @@ fun goal ->
    Some {
    goal_id;
    goal;
    }

let json_to_occupancyGrid_opt json = 
    jreq json "info" json_to_mapMetaData_opt @@ fun info ->
    jreq json "data" (jlist json_to_int8_opt) @@ fun data ->
    Some {
    info;
    data;
    }

let json_to_getMapActionFeedback_opt json = 
    jreq json "getMapActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun getMapActionFeedback_status ->
    jreq json "getMapActionFeedback_feedback" json_to_getMapFeedback_opt @@ fun getMapActionFeedback_feedback ->
    Some {
    getMapActionFeedback_status;
    getMapActionFeedback_feedback;
    }

let json_to_getMapResult_opt json = 
    jreq json "map" json_to_occupancyGrid_opt @@ fun map ->
    Some {
    map;
    }

let json_to_getMapActionResult_opt json = 
    jreq json "getMapActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun getMapActionResult_status ->
    jreq json "getMapActionResult_result" json_to_getMapResult_opt @@ fun getMapActionResult_result ->
    Some {
    getMapActionResult_status;
    getMapActionResult_result;
    }

let json_to_getMapAction_opt json = 
    jreq json "action_goal" json_to_getMapActionGoal_opt @@ fun action_goal ->
    jreq json "action_result" json_to_getMapActionResult_opt @@ fun action_result ->
    jreq json "action_feedback" json_to_getMapActionFeedback_opt @@ fun action_feedback ->
    Some {
    action_goal;
    action_result;
    action_feedback;
    }

