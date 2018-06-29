open Basic_types;;

type lookupTransformFeedback = ()

type tFMessage = {
   transforms : Geometry_msgs.transformStamped list ;
}

type lookupTransformGoal = {
   target_frame : string ;
   source_frame : string ;
   source_time : time ;
   timeout : duration ;
   target_time : time ;
   fixed_frame : string ;
   advanced : bool ;
}

type lookupTransformActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : lookupTransformGoal ;
}

type tF2Error = {
   error : uint8 ;
   error_string : string ;
}

type lookupTransformActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : lookupTransformFeedback ;
}

type lookupTransformResult = {
   transform : Geometry_msgs.transformStamped ;
   error : tF2Error ;
}

type lookupTransformActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : lookupTransformResult ;
}

type lookupTransformAction = {
   action_goal : lookupTransformActionGoal ;
   action_result : lookupTransformActionResult ;
   action_feedback : lookupTransformActionFeedback ;
}

