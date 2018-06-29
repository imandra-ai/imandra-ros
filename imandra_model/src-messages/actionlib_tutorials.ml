open Basic_types;;

type fibonacciGoal = {
   order : int32 ;
}

type fibonacciFeedback = {
   sequence : int32 list ;
}

type averagingGoal = {
   samples : int32 ;
}

type averagingFeedback = {
   sample : int32 ;
   data : float32 ;
   mean : float32 ;
   std_dev : float32 ;
}

type fibonacciActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : fibonacciFeedback ;
}

type fibonacciResult = {
   sequence : int32 list ;
}

type averagingResult = {
   mean : float32 ;
   std_dev : float32 ;
}

type fibonacciActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : fibonacciGoal ;
}

type fibonacciActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : fibonacciResult ;
}

type averagingActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : averagingGoal ;
}

type averagingActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : averagingFeedback ;
}

type averagingActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : averagingResult ;
}

type fibonacciAction = {
   action_goal : fibonacciActionGoal ;
   action_result : fibonacciActionResult ;
   action_feedback : fibonacciActionFeedback ;
}

type averagingAction = {
   action_goal : averagingActionGoal ;
   action_result : averagingActionResult ;
   action_feedback : averagingActionFeedback ;
}

