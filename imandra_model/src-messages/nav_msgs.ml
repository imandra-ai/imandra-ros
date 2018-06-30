open Basic_types;;

type getMapGoal = ()

type odometry = {
   odometry_header : Std_msgs.header ;
   odometry_child_frame_id : string ;
   odometry_pose : Geometry_msgs.poseWithCovariance ;
   odometry_twist : Geometry_msgs.twistWithCovariance ;
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
   gridCells_header : Std_msgs.header ;
   gridCells_cell_width : float32 ;
   gridCells_cell_height : float32 ;
   gridCells_cells : Geometry_msgs.point list ;
}

type path = {
   path_header : Std_msgs.header ;
   path_poses : Geometry_msgs.poseStamped list ;
}

type getMapActionGoal = {
   getMapActionGoal_header : Std_msgs.header ;
   getMapActionGoal_goal_id : Actionlib_msgs.goalID ;
   getMapActionGoal_goal : getMapGoal ;
}

type occupancyGrid = {
   occupancyGrid_header : Std_msgs.header ;
   occupancyGrid_info : mapMetaData ;
   occupancyGrid_data : int8 list ;
}

type getMapActionFeedback = {
   getMapActionFeedback_header : Std_msgs.header ;
   getMapActionFeedback_status : Actionlib_msgs.goalStatus ;
   getMapActionFeedback_feedback : getMapFeedback ;
}

type getMapResult = {
   map : occupancyGrid ;
}

type getMapActionResult = {
   getMapActionResult_header : Std_msgs.header ;
   getMapActionResult_status : Actionlib_msgs.goalStatus ;
   getMapActionResult_result : getMapResult ;
}

type getMapAction = {
   action_goal : getMapActionGoal ;
   action_result : getMapActionResult ;
   action_feedback : getMapActionFeedback ;
}

