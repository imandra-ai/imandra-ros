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
   lookupTransformActionGoal_header : Std_msgs.header ;
   lookupTransformActionGoal_goal_id : Actionlib_msgs.goalID ;
   lookupTransformActionGoal_goal : lookupTransformGoal ;
}

type tF2Error = {
   tF2Error_error : uint8 ;
   tF2Error_error_string : string ;
}

type lookupTransformActionFeedback = {
   lookupTransformActionFeedback_header : Std_msgs.header ;
   lookupTransformActionFeedback_status : Actionlib_msgs.goalStatus ;
   lookupTransformActionFeedback_feedback : lookupTransformFeedback ;
}

type lookupTransformResult = {
   lookupTransformResult_transform : Geometry_msgs.transformStamped ;
   lookupTransformResult_error : tF2Error ;
}

type lookupTransformActionResult = {
   lookupTransformActionResult_header : Std_msgs.header ;
   lookupTransformActionResult_status : Actionlib_msgs.goalStatus ;
   lookupTransformActionResult_result : lookupTransformResult ;
}

type lookupTransformAction = {
   action_goal : lookupTransformActionGoal ;
   action_result : lookupTransformActionResult ;
   action_feedback : lookupTransformActionFeedback ;
}

