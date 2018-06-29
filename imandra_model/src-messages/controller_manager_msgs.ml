open Basic_types;;

type controllerStatistics = {
   name : string ;
   ros_type : string ;
   timestamp : time ;
   running : bool ;
   max_time : duration ;
   mean_time : duration ;
   variance_time : duration ;
   num_control_loop_overruns : int32 ;
   time_last_control_loop_overrun : time ;
}

type hardwareInterfaceResources = {
   hardware_interface : string ;
   resources : string list ;
}

type controllersStatistics = {
   controller : controllerStatistics list ;
}

type controllerState = {
   name : string ;
   state : string ;
   ros_type : string ;
   claimed_resources : hardwareInterfaceResources list ;
}

