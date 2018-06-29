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
   shapeActionFeedback_status : Actionlib_msgs.goalStatus ;
   shapeActionFeedback_feedback : shapeFeedback ;
}

type shapeActionResult = {
   shapeActionResult_status : Actionlib_msgs.goalStatus ;
   shapeActionResult_result : shapeResult ;
}

type velocity = {
   linear : float32 ;
   angular : float32 ;
}

type shapeActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : shapeGoal ;
}

type shapeAction = {
   action_goal : shapeActionGoal ;
   action_result : shapeActionResult ;
   action_feedback : shapeActionFeedback ;
}

