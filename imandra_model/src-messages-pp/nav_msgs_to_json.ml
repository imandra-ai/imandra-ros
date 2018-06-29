open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Nav_msgs;;

let getMapGoal_to_json x = `Assoc []

let odometry_to_json x = [
    ( "child_frame_id" , x.child_frame_id |> string_to_json );
    ( "pose" , x.pose |> Geometry_msgs_to_json.poseWithCovariance_to_json );
    ( "twist" , x.twist |> Geometry_msgs_to_json.twistWithCovariance_to_json );
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
    ( "cell_width" , x.cell_width |> float32_to_json );
    ( "cell_height" , x.cell_height |> float32_to_json );
    ( "cells" , x.cells |> (mklist Geometry_msgs_to_json.point_to_json) );
    ] |> assoc_filter_nulls

let path_to_json x = [
    ( "poses" , x.poses |> (mklist Geometry_msgs_to_json.poseStamped_to_json) );
    ] |> assoc_filter_nulls

let getMapActionGoal_to_json x = [
    ( "goal_id" , x.goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "goal" , x.goal |> getMapGoal_to_json );
    ] |> assoc_filter_nulls

let occupancyGrid_to_json x = [
    ( "info" , x.info |> mapMetaData_to_json );
    ( "data" , x.data |> (mklist int8_to_json) );
    ] |> assoc_filter_nulls

let getMapActionFeedback_to_json x = [
    ( "getMapActionFeedback_status" , x.getMapActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "getMapActionFeedback_feedback" , x.getMapActionFeedback_feedback |> getMapFeedback_to_json );
    ] |> assoc_filter_nulls

let getMapResult_to_json x = [
    ( "map" , x.map |> occupancyGrid_to_json );
    ] |> assoc_filter_nulls

let getMapActionResult_to_json x = [
    ( "getMapActionResult_status" , x.getMapActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "getMapActionResult_result" , x.getMapActionResult_result |> getMapResult_to_json );
    ] |> assoc_filter_nulls

let getMapAction_to_json x = [
    ( "action_goal" , x.action_goal |> getMapActionGoal_to_json );
    ( "action_result" , x.action_result |> getMapActionResult_to_json );
    ( "action_feedback" , x.action_feedback |> getMapActionFeedback_to_json );
    ] |> assoc_filter_nulls

