open Basic_types;;

type testRequestResult = {
   testRequestResult_the_result : int32 ;
   testRequestResult_is_simple_server : bool ;
}

type testResult = {
   testResult_result : int32 ;
}

type twoIntsFeedback = ()

type testFeedback = {
   testFeedback_feedback : int32 ;
}

type twoIntsActionFeedback = {
   twoIntsActionFeedback_status : Actionlib_msgs.goalStatus ;
   twoIntsActionFeedback_feedback : twoIntsFeedback ;
}

type testActionResult = {
   testActionResult_status : Actionlib_msgs.goalStatus ;
   testActionResult_result : testResult ;
}

type testGoal = {
   testGoal_goal : int32 ;
}

type twoIntsResult = {
   sum : int64 ;
}

type testRequestActionResult = {
   testRequestActionResult_status : Actionlib_msgs.goalStatus ;
   testRequestActionResult_result : testRequestResult ;
}

type twoIntsGoal = {
   a : int64 ;
   b : int64 ;
}

type testRequestFeedback = ()

type testRequestGoal = {
   testRequestGoal_terminate_status : int32 ;
   testRequestGoal_ignore_cancel : bool ;
   testRequestGoal_result_text : string ;
   testRequestGoal_the_result : int32 ;
   testRequestGoal_is_simple_client : bool ;
   testRequestGoal_delay_accept : duration ;
   testRequestGoal_delay_terminate : duration ;
   testRequestGoal_pause_status : duration ;
}

type testRequestActionGoal = {
   testRequestActionGoal_goal_id : Actionlib_msgs.goalID ;
   testRequestActionGoal_goal : testRequestGoal ;
}

type testActionFeedback = {
   testActionFeedback_status : Actionlib_msgs.goalStatus ;
   testActionFeedback_feedback : testFeedback ;
}

type twoIntsActionGoal = {
   twoIntsActionGoal_goal_id : Actionlib_msgs.goalID ;
   twoIntsActionGoal_goal : twoIntsGoal ;
}

type testActionGoal = {
   testActionGoal_goal_id : Actionlib_msgs.goalID ;
   testActionGoal_goal : testGoal ;
}

type twoIntsActionResult = {
   twoIntsActionResult_status : Actionlib_msgs.goalStatus ;
   twoIntsActionResult_result : twoIntsResult ;
}

type twoIntsAction = {
   twoIntsAction_action_goal : twoIntsActionGoal ;
   twoIntsAction_action_result : twoIntsActionResult ;
   twoIntsAction_action_feedback : twoIntsActionFeedback ;
}

type testRequestActionFeedback = {
   testRequestActionFeedback_status : Actionlib_msgs.goalStatus ;
   testRequestActionFeedback_feedback : testRequestFeedback ;
}

type testRequestAction = {
   testRequestAction_action_goal : testRequestActionGoal ;
   testRequestAction_action_result : testRequestActionResult ;
   testRequestAction_action_feedback : testRequestActionFeedback ;
}

type testAction = {
   testAction_action_goal : testActionGoal ;
   testAction_action_result : testActionResult ;
   testAction_action_feedback : testActionFeedback ;
}

