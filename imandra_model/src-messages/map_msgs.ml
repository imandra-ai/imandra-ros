open Basic_types;;

type projectedMap = {
   projectedMap_map : Nav_msgs.occupancyGrid ;
   projectedMap_min_z : float64 ;
   projectedMap_max_z : float64 ;
}

type occupancyGridUpdate = {
   occupancyGridUpdate_x : int32 ;
   occupancyGridUpdate_y : int32 ;
   occupancyGridUpdate_width : uint32 ;
   occupancyGridUpdate_height : uint32 ;
   occupancyGridUpdate_data : int8 list ;
}

type projectedMapInfo = {
   projectedMapInfo_frame_id : string ;
   projectedMapInfo_x : float64 ;
   projectedMapInfo_y : float64 ;
   projectedMapInfo_width : float64 ;
   projectedMapInfo_height : float64 ;
   projectedMapInfo_min_z : float64 ;
   projectedMapInfo_max_z : float64 ;
}

type pointCloud2Update = {
   ros_type : uint32 ;
   points : Sensor_msgs.pointCloud2 ;
}

