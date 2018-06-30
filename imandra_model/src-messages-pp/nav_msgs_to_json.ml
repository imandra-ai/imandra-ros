open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Nav_msgs;;

let getMapGoal_to_json x = `Assoc []

let odometry_to_json x = [
    ( "odometry_header" , x.odometry_header |> Std_msgs_to_json.header_to_json );
    ( "odometry_child_frame_id" , x.odometry_child_frame_id |> string_to_json );
    ( "odometry_pose" , x.odometry_pose |> Geometry_msgs_to_json.poseWithCovariance_to_json );
    ( "odometry_twist" , x.odometry_twist |> Geometry_msgs_to_json.twistWithCovariance_to_json );
    ] |> assoc_filter_nulls

let mapMetaData_to_json x = [
    ( "map_load_time" , x.map_load_time |> time_to_json );
    ( "resolution" , x.resolution |> float32_to_json );
    ( "width" , x.width |> uint32_to_json );
    ( "height" , x.height |> uint32_to_json );
    ( "origin" , x.origin |> Geometry_msgs_to_json.pose_to_json );
    ] |> assoc_filter_nulls

let getMapFeedback_to_json x = `Assoc []

let gridCells_to_json x = [
    ( "gridCells_header" , x.gridCells_header |> Std_msgs_to_json.header_to_json );
    ( "gridCells_cell_width" , x.gridCells_cell_width |> float32_to_json );
    ( "gridCells_cell_height" , x.gridCells_cell_height |> float32_to_json );
    ( "gridCells_cells" , x.gridCells_cells |> (mklist Geometry_msgs_to_json.point_to_json) );
    ] |> assoc_filter_nulls

let path_to_json x = [
    ( "path_header" , x.path_header |> Std_msgs_to_json.header_to_json );
    ( "path_poses" , x.path_poses |> (mklist Geometry_msgs_to_json.poseStamped_to_json) );
    ] |> assoc_filter_nulls

let getMapActionGoal_to_json x = [
    ( "getMapActionGoal_header" , x.getMapActionGoal_header |> Std_msgs_to_json.header_to_json );
    ( "getMapActionGoal_goal_id" , x.getMapActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "getMapActionGoal_goal" , x.getMapActionGoal_goal |> getMapGoal_to_json );
    ] |> assoc_filter_nulls

let occupancyGrid_to_json x = [
    ( "occupancyGrid_header" , x.occupancyGrid_header |> Std_msgs_to_json.header_to_json );
    ( "occupancyGrid_info" , x.occupancyGrid_info |> mapMetaData_to_json );
    ( "occupancyGrid_data" , x.occupancyGrid_data |> (mklist int8_to_json) );
    ] |> assoc_filter_nulls

let getMapActionFeedback_to_json x = [
    ( "getMapActionFeedback_header" , x.getMapActionFeedback_header |> Std_msgs_to_json.header_to_json );
    ( "getMapActionFeedback_status" , x.getMapActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "getMapActionFeedback_feedback" , x.getMapActionFeedback_feedback |> getMapFeedback_to_json );
    ] |> assoc_filter_nulls

let getMapResult_to_json x = [
    ( "map" , x.map |> occupancyGrid_to_json );
    ] |> assoc_filter_nulls

let getMapActionResult_to_json x = [
    ( "getMapActionResult_header" , x.getMapActionResult_header |> Std_msgs_to_json.header_to_json );
    ( "getMapActionResult_status" , x.getMapActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "getMapActionResult_result" , x.getMapActionResult_result |> getMapResult_to_json );
    ] |> assoc_filter_nulls

let getMapAction_to_json x = [
    ( "action_goal" , x.action_goal |> getMapActionGoal_to_json );
    ( "action_result" , x.action_result |> getMapActionResult_to_json );
    ( "action_feedback" , x.action_feedback |> getMapActionFeedback_to_json );
    ] |> assoc_filter_nulls

