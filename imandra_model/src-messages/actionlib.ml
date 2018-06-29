open Basic_types;;

type testRequestResult = {
   the_result : int32 ;
   is_simple_server : bool ;
}

type testResult = {
   result : int32 ;
}

type twoIntsFeedback = ()

type testFeedback = {
   feedback : int32 ;
}

type twoIntsActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : twoIntsFeedback ;
}

type testActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : testResult ;
}

type testGoal = {
   goal : int32 ;
}

type twoIntsResult = {
   sum : int64 ;
}

type testRequestActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : testRequestResult ;
}

type twoIntsGoal = {
   a : int64 ;
   b : int64 ;
}

type testRequestFeedback = ()

type testRequestGoal = {
   terminate_status : int32 ;
   ignore_cancel : bool ;
   result_text : string ;
   the_result : int32 ;
   is_simple_client : bool ;
   delay_accept : duration ;
   delay_terminate : duration ;
   pause_status : duration ;
}

type testRequestActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : testRequestGoal ;
}

type testActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : testFeedback ;
}

type twoIntsActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : twoIntsGoal ;
}

type testActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : testGoal ;
}

type twoIntsActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : twoIntsResult ;
}

type twoIntsAction = {
   action_goal : twoIntsActionGoal ;
   action_result : twoIntsActionResult ;
   action_feedback : twoIntsActionFeedback ;
}

type testRequestActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : testRequestFeedback ;
}

type testRequestAction = {
   action_goal : testRequestActionGoal ;
   action_result : testRequestActionResult ;
   action_feedback : testRequestActionFeedback ;
}

type testAction = {
   action_goal : testActionGoal ;
   action_result : testActionResult ;
   action_feedback : testActionFeedback ;
}

