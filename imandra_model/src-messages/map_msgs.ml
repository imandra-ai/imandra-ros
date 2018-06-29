open Basic_types;;

type projectedMap = {
   map : Nav_msgs.occupancyGrid ;
   min_z : float64 ;
   max_z : float64 ;
}

type occupancyGridUpdate = {
   x : int32 ;
   y : int32 ;
   width : uint32 ;
   height : uint32 ;
   data : int8 list ;
}

type projectedMapInfo = {
   frame_id : string ;
   x : float64 ;
   y : float64 ;
   width : float64 ;
   height : float64 ;
   min_z : float64 ;
   max_z : float64 ;
}

type pointCloud2Update = {
   ros_type : uint32 ;
   points : Sensor_msgs.pointCloud2 ;
}

