open Basic_types;;

type shapeFeedback = ()

type shapeResult = {
   interior_angle : float32 ;
   apothem : float32 ;
}

type shapeGoal = {
   edges : int32 ;
   radius : float32 ;
}

type shapeActionFeedback = {
   shapeActionFeedback_header : Std_msgs.header ;
   shapeActionFeedback_status : Actionlib_msgs.goalStatus ;
   shapeActionFeedback_feedback : shapeFeedback ;
}

type shapeActionResult = {
   shapeActionResult_header : Std_msgs.header ;
   shapeActionResult_status : Actionlib_msgs.goalStatus ;
   shapeActionResult_result : shapeResult ;
}

type velocity = {
   linear : float32 ;
   angular : float32 ;
}

type shapeActionGoal = {
   shapeActionGoal_header : Std_msgs.header ;
   shapeActionGoal_goal_id : Actionlib_msgs.goalID ;
   shapeActionGoal_goal : shapeGoal ;
}

type shapeAction = {
   action_goal : shapeActionGoal ;
   action_result : shapeActionResult ;
   action_feedback : shapeActionFeedback ;
}

