open Basic_types;;

type getMapGoal = ()

type odometry = {
   child_frame_id : string ;
   pose : Geometry_msgs.poseWithCovariance ;
   twist : Geometry_msgs.twistWithCovariance ;
}

type mapMetaData = {
   map_load_time : time ;
   resolution : float32 ;
   width : uint32 ;
   height : uint32 ;
   origin : Geometry_msgs.pose ;
}

type getMapFeedback = ()

type gridCells = {
   cell_width : float32 ;
   cell_height : float32 ;
   cells : Geometry_msgs.point list ;
}

type path = {
   poses : Geometry_msgs.poseStamped list ;
}

type getMapActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : getMapGoal ;
}

type occupancyGrid = {
   info : mapMetaData ;
   data : int8 list ;
}

type getMapActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : getMapFeedback ;
}

type getMapResult = {
   map : occupancyGrid ;
}

type getMapActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : getMapResult ;
}

type getMapAction = {
   action_goal : getMapActionGoal ;
   action_result : getMapActionResult ;
   action_feedback : getMapActionFeedback ;
}

