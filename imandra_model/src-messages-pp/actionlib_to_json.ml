open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Actionlib;;

let testRequestResult_to_json x = [
    ( "testRequestResult_the_result" , x.testRequestResult_the_result |> int32_to_json );
    ( "testRequestResult_is_simple_server" , x.testRequestResult_is_simple_server |> bool_to_json );
    ] |> assoc_filter_nulls

let testResult_to_json x = [
    ( "testResult_result" , x.testResult_result |> int32_to_json );
    ] |> assoc_filter_nulls

let twoIntsFeedback_to_json x = `Assoc []

let testFeedback_to_json x = [
    ( "testFeedback_feedback" , x.testFeedback_feedback |> int32_to_json );
    ] |> assoc_filter_nulls

let twoIntsActionFeedback_to_json x = [
    ( "twoIntsActionFeedback_header" , x.twoIntsActionFeedback_header |> Std_msgs_to_json.header_to_json );
    ( "twoIntsActionFeedback_status" , x.twoIntsActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "twoIntsActionFeedback_feedback" , x.twoIntsActionFeedback_feedback |> twoIntsFeedback_to_json );
    ] |> assoc_filter_nulls

let testActionResult_to_json x = [
    ( "testActionResult_header" , x.testActionResult_header |> Std_msgs_to_json.header_to_json );
    ( "testActionResult_status" , x.testActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "testActionResult_result" , x.testActionResult_result |> testResult_to_json );
    ] |> assoc_filter_nulls

let testGoal_to_json x = [
    ( "testGoal_goal" , x.testGoal_goal |> int32_to_json );
    ] |> assoc_filter_nulls

let twoIntsResult_to_json x = [
    ( "sum" , x.sum |> int64_to_json );
    ] |> assoc_filter_nulls

let testRequestActionResult_to_json x = [
    ( "testRequestActionResult_header" , x.testRequestActionResult_header |> Std_msgs_to_json.header_to_json );
    ( "testRequestActionResult_status" , x.testRequestActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "testRequestActionResult_result" , x.testRequestActionResult_result |> testRequestResult_to_json );
    ] |> assoc_filter_nulls

let twoIntsGoal_to_json x = [
    ( "a" , x.a |> int64_to_json );
    ( "b" , x.b |> int64_to_json );
    ] |> assoc_filter_nulls

let testRequestFeedback_to_json x = `Assoc []

let testRequestGoal_to_json x = [
    ( "testRequestGoal_terminate_status" , x.testRequestGoal_terminate_status |> int32_to_json );
    ( "testRequestGoal_ignore_cancel" , x.testRequestGoal_ignore_cancel |> bool_to_json );
    ( "testRequestGoal_result_text" , x.testRequestGoal_result_text |> string_to_json );
    ( "testRequestGoal_the_result" , x.testRequestGoal_the_result |> int32_to_json );
    ( "testRequestGoal_is_simple_client" , x.testRequestGoal_is_simple_client |> bool_to_json );
    ( "testRequestGoal_delay_accept" , x.testRequestGoal_delay_accept |> duration_to_json );
    ( "testRequestGoal_delay_terminate" , x.testRequestGoal_delay_terminate |> duration_to_json );
    ( "testRequestGoal_pause_status" , x.testRequestGoal_pause_status |> duration_to_json );
    ] |> assoc_filter_nulls

let testRequestActionGoal_to_json x = [
    ( "testRequestActionGoal_header" , x.testRequestActionGoal_header |> Std_msgs_to_json.header_to_json );
    ( "testRequestActionGoal_goal_id" , x.testRequestActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "testRequestActionGoal_goal" , x.testRequestActionGoal_goal |> testRequestGoal_to_json );
    ] |> assoc_filter_nulls

let testActionFeedback_to_json x = [
    ( "testActionFeedback_header" , x.testActionFeedback_header |> Std_msgs_to_json.header_to_json );
    ( "testActionFeedback_status" , x.testActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "testActionFeedback_feedback" , x.testActionFeedback_feedback |> testFeedback_to_json );
    ] |> assoc_filter_nulls

let twoIntsActionGoal_to_json x = [
    ( "twoIntsActionGoal_header" , x.twoIntsActionGoal_header |> Std_msgs_to_json.header_to_json );
    ( "twoIntsActionGoal_goal_id" , x.twoIntsActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "twoIntsActionGoal_goal" , x.twoIntsActionGoal_goal |> twoIntsGoal_to_json );
    ] |> assoc_filter_nulls

let testActionGoal_to_json x = [
    ( "testActionGoal_header" , x.testActionGoal_header |> Std_msgs_to_json.header_to_json );
    ( "testActionGoal_goal_id" , x.testActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "testActionGoal_goal" , x.testActionGoal_goal |> testGoal_to_json );
    ] |> assoc_filter_nulls

let twoIntsActionResult_to_json x = [
    ( "twoIntsActionResult_header" , x.twoIntsActionResult_header |> Std_msgs_to_json.header_to_json );
    ( "twoIntsActionResult_status" , x.twoIntsActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "twoIntsActionResult_result" , x.twoIntsActionResult_result |> twoIntsResult_to_json );
    ] |> assoc_filter_nulls

let twoIntsAction_to_json x = [
    ( "twoIntsAction_action_goal" , x.twoIntsAction_action_goal |> twoIntsActionGoal_to_json );
    ( "twoIntsAction_action_result" , x.twoIntsAction_action_result |> twoIntsActionResult_to_json );
    ( "twoIntsAction_action_feedback" , x.twoIntsAction_action_feedback |> twoIntsActionFeedback_to_json );
    ] |> assoc_filter_nulls

let testRequestActionFeedback_to_json x = [
    ( "testRequestActionFeedback_header" , x.testRequestActionFeedback_header |> Std_msgs_to_json.header_to_json );
    ( "testRequestActionFeedback_status" , x.testRequestActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "testRequestActionFeedback_feedback" , x.testRequestActionFeedback_feedback |> testRequestFeedback_to_json );
    ] |> assoc_filter_nulls

let testRequestAction_to_json x = [
    ( "testRequestAction_action_goal" , x.testRequestAction_action_goal |> testRequestActionGoal_to_json );
    ( "testRequestAction_action_result" , x.testRequestAction_action_result |> testRequestActionResult_to_json );
    ( "testRequestAction_action_feedback" , x.testRequestAction_action_feedback |> testRequestActionFeedback_to_json );
    ] |> assoc_filter_nulls

let testAction_to_json x = [
    ( "testAction_action_goal" , x.testAction_action_goal |> testActionGoal_to_json );
    ( "testAction_action_result" , x.testAction_action_result |> testActionResult_to_json );
    ( "testAction_action_feedback" , x.testAction_action_feedback |> testActionFeedback_to_json );
    ] |> assoc_filter_nulls

