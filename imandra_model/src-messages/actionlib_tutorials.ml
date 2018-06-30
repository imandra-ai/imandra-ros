open Basic_types;;

type fibonacciGoal = {
   order : int32 ;
}

type fibonacciFeedback = {
   fibonacciFeedback_sequence : int32 list ;
}

type averagingGoal = {
   samples : int32 ;
}

type averagingFeedback = {
   averagingFeedback_sample : int32 ;
   averagingFeedback_data : float32 ;
   averagingFeedback_mean : float32 ;
   averagingFeedback_std_dev : float32 ;
}

type fibonacciActionFeedback = {
   fibonacciActionFeedback_header : Std_msgs.header ;
   fibonacciActionFeedback_status : Actionlib_msgs.goalStatus ;
   fibonacciActionFeedback_feedback : fibonacciFeedback ;
}

type fibonacciResult = {
   fibonacciResult_sequence : int32 list ;
}

type averagingResult = {
   averagingResult_mean : float32 ;
   averagingResult_std_dev : float32 ;
}

type fibonacciActionGoal = {
   fibonacciActionGoal_header : Std_msgs.header ;
   fibonacciActionGoal_goal_id : Actionlib_msgs.goalID ;
   fibonacciActionGoal_goal : fibonacciGoal ;
}

type fibonacciActionResult = {
   fibonacciActionResult_header : Std_msgs.header ;
   fibonacciActionResult_status : Actionlib_msgs.goalStatus ;
   fibonacciActionResult_result : fibonacciResult ;
}

type averagingActionGoal = {
   averagingActionGoal_header : Std_msgs.header ;
   averagingActionGoal_goal_id : Actionlib_msgs.goalID ;
   averagingActionGoal_goal : averagingGoal ;
}

type averagingActionFeedback = {
   averagingActionFeedback_header : Std_msgs.header ;
   averagingActionFeedback_status : Actionlib_msgs.goalStatus ;
   averagingActionFeedback_feedback : averagingFeedback ;
}

type averagingActionResult = {
   averagingActionResult_header : Std_msgs.header ;
   averagingActionResult_status : Actionlib_msgs.goalStatus ;
   averagingActionResult_result : averagingResult ;
}

type fibonacciAction = {
   fibonacciAction_action_goal : fibonacciActionGoal ;
   fibonacciAction_action_result : fibonacciActionResult ;
   fibonacciAction_action_feedback : fibonacciActionFeedback ;
}

type averagingAction = {
   averagingAction_action_goal : averagingActionGoal ;
   averagingAction_action_result : averagingActionResult ;
   averagingAction_action_feedback : averagingActionFeedback ;
}

