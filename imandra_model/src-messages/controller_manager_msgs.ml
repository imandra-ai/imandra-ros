open Basic_types;;

type controllerStatistics = {
   controllerStatistics_name : string ;
   controllerStatistics_ros_type : string ;
   controllerStatistics_timestamp : time ;
   controllerStatistics_running : bool ;
   controllerStatistics_max_time : duration ;
   controllerStatistics_mean_time : duration ;
   controllerStatistics_variance_time : duration ;
   controllerStatistics_num_control_loop_overruns : int32 ;
   controllerStatistics_time_last_control_loop_overrun : time ;
}

type hardwareInterfaceResources = {
   hardware_interface : string ;
   resources : string list ;
}

type controllersStatistics = {
   header : Std_msgs.header ;
   controller : controllerStatistics list ;
}

type controllerState = {
   controllerState_name : string ;
   controllerState_state : string ;
   controllerState_ros_type : string ;
   controllerState_claimed_resources : hardwareInterfaceResources list ;
}

