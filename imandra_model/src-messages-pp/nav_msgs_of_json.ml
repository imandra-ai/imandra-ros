open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Nav_msgs;;

let json_to_getMapGoal_opt json : getMapGoal option = Some ()

let json_to_odometry_opt json = 
    jreq json "odometry_header" Std_msgs_of_json.json_to_header_opt @@ fun odometry_header ->
    jreq json "odometry_child_frame_id" json_to_string_opt @@ fun odometry_child_frame_id ->
    jreq json "odometry_pose" Geometry_msgs_of_json.json_to_poseWithCovariance_opt @@ fun odometry_pose ->
    jreq json "odometry_twist" Geometry_msgs_of_json.json_to_twistWithCovariance_opt @@ fun odometry_twist ->
    Some {
    odometry_header;
    odometry_child_frame_id;
    odometry_pose;
    odometry_twist;
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
    jreq json "gridCells_header" Std_msgs_of_json.json_to_header_opt @@ fun gridCells_header ->
    jreq json "gridCells_cell_width" json_to_float32_opt @@ fun gridCells_cell_width ->
    jreq json "gridCells_cell_height" json_to_float32_opt @@ fun gridCells_cell_height ->
    jreq json "gridCells_cells" (jlist Geometry_msgs_of_json.json_to_point_opt) @@ fun gridCells_cells ->
    Some {
    gridCells_header;
    gridCells_cell_width;
    gridCells_cell_height;
    gridCells_cells;
    }

let json_to_path_opt json = 
    jreq json "path_header" Std_msgs_of_json.json_to_header_opt @@ fun path_header ->
    jreq json "path_poses" (jlist Geometry_msgs_of_json.json_to_poseStamped_opt) @@ fun path_poses ->
    Some {
    path_header;
    path_poses;
    }

let json_to_getMapActionGoal_opt json = 
    jreq json "getMapActionGoal_header" Std_msgs_of_json.json_to_header_opt @@ fun getMapActionGoal_header ->
    jreq json "getMapActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun getMapActionGoal_goal_id ->
    jreq json "getMapActionGoal_goal" json_to_getMapGoal_opt @@ fun getMapActionGoal_goal ->
    Some {
    getMapActionGoal_header;
    getMapActionGoal_goal_id;
    getMapActionGoal_goal;
    }

let json_to_occupancyGrid_opt json = 
    jreq json "occupancyGrid_header" Std_msgs_of_json.json_to_header_opt @@ fun occupancyGrid_header ->
    jreq json "occupancyGrid_info" json_to_mapMetaData_opt @@ fun occupancyGrid_info ->
    jreq json "occupancyGrid_data" (jlist json_to_int8_opt) @@ fun occupancyGrid_data ->
    Some {
    occupancyGrid_header;
    occupancyGrid_info;
    occupancyGrid_data;
    }

let json_to_getMapActionFeedback_opt json = 
    jreq json "getMapActionFeedback_header" Std_msgs_of_json.json_to_header_opt @@ fun getMapActionFeedback_header ->
    jreq json "getMapActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun getMapActionFeedback_status ->
    jreq json "getMapActionFeedback_feedback" json_to_getMapFeedback_opt @@ fun getMapActionFeedback_feedback ->
    Some {
    getMapActionFeedback_header;
    getMapActionFeedback_status;
    getMapActionFeedback_feedback;
    }

let json_to_getMapResult_opt json = 
    jreq json "map" json_to_occupancyGrid_opt @@ fun map ->
    Some {
    map;
    }

let json_to_getMapActionResult_opt json = 
    jreq json "getMapActionResult_header" Std_msgs_of_json.json_to_header_opt @@ fun getMapActionResult_header ->
    jreq json "getMapActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun getMapActionResult_status ->
    jreq json "getMapActionResult_result" json_to_getMapResult_opt @@ fun getMapActionResult_result ->
    Some {
    getMapActionResult_header;
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

