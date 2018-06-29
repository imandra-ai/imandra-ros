open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Actionlib_tutorials;;

let fibonacciGoal_to_json x = [
    ( "order" , x.order |> int32_to_json );
    ] |> assoc_filter_nulls

let fibonacciFeedback_to_json x = [
    ( "fibonacciFeedback_sequence" , x.fibonacciFeedback_sequence |> (mklist int32_to_json) );
    ] |> assoc_filter_nulls

let averagingGoal_to_json x = [
    ( "samples" , x.samples |> int32_to_json );
    ] |> assoc_filter_nulls

let averagingFeedback_to_json x = [
    ( "averagingFeedback_sample" , x.averagingFeedback_sample |> int32_to_json );
    ( "averagingFeedback_data" , x.averagingFeedback_data |> float32_to_json );
    ( "averagingFeedback_mean" , x.averagingFeedback_mean |> float32_to_json );
    ( "averagingFeedback_std_dev" , x.averagingFeedback_std_dev |> float32_to_json );
    ] |> assoc_filter_nulls

let fibonacciActionFeedback_to_json x = [
    ( "fibonacciActionFeedback_status" , x.fibonacciActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "fibonacciActionFeedback_feedback" , x.fibonacciActionFeedback_feedback |> fibonacciFeedback_to_json );
    ] |> assoc_filter_nulls

let fibonacciResult_to_json x = [
    ( "fibonacciResult_sequence" , x.fibonacciResult_sequence |> (mklist int32_to_json) );
    ] |> assoc_filter_nulls

let averagingResult_to_json x = [
    ( "averagingResult_mean" , x.averagingResult_mean |> float32_to_json );
    ( "averagingResult_std_dev" , x.averagingResult_std_dev |> float32_to_json );
    ] |> assoc_filter_nulls

let fibonacciActionGoal_to_json x = [
    ( "fibonacciActionGoal_goal_id" , x.fibonacciActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "fibonacciActionGoal_goal" , x.fibonacciActionGoal_goal |> fibonacciGoal_to_json );
    ] |> assoc_filter_nulls

let fibonacciActionResult_to_json x = [
    ( "fibonacciActionResult_status" , x.fibonacciActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "fibonacciActionResult_result" , x.fibonacciActionResult_result |> fibonacciResult_to_json );
    ] |> assoc_filter_nulls

let averagingActionGoal_to_json x = [
    ( "averagingActionGoal_goal_id" , x.averagingActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "averagingActionGoal_goal" , x.averagingActionGoal_goal |> averagingGoal_to_json );
    ] |> assoc_filter_nulls

let averagingActionFeedback_to_json x = [
    ( "averagingActionFeedback_status" , x.averagingActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "averagingActionFeedback_feedback" , x.averagingActionFeedback_feedback |> averagingFeedback_to_json );
    ] |> assoc_filter_nulls

let averagingActionResult_to_json x = [
    ( "averagingActionResult_status" , x.averagingActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "averagingActionResult_result" , x.averagingActionResult_result |> averagingResult_to_json );
    ] |> assoc_filter_nulls

let fibonacciAction_to_json x = [
    ( "fibonacciAction_action_goal" , x.fibonacciAction_action_goal |> fibonacciActionGoal_to_json );
    ( "fibonacciAction_action_result" , x.fibonacciAction_action_result |> fibonacciActionResult_to_json );
    ( "fibonacciAction_action_feedback" , x.fibonacciAction_action_feedback |> fibonacciActionFeedback_to_json );
    ] |> assoc_filter_nulls

let averagingAction_to_json x = [
    ( "averagingAction_action_goal" , x.averagingAction_action_goal |> averagingActionGoal_to_json );
    ( "averagingAction_action_result" , x.averagingAction_action_result |> averagingActionResult_to_json );
    ( "averagingAction_action_feedback" , x.averagingAction_action_feedback |> averagingActionFeedback_to_json );
    ] |> assoc_filter_nulls

