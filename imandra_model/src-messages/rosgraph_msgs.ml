open Basic_types;;

type topicStatistics = {
   topic : string ;
   node_pub : string ;
   node_sub : string ;
   window_start : time ;
   window_stop : time ;
   delivered_msgs : int32 ;
   dropped_msgs : int32 ;
   traffic : int32 ;
   period_mean : duration ;
   period_stddev : duration ;
   period_max : duration ;
   stamp_age_mean : duration ;
   stamp_age_stddev : duration ;
   stamp_age_max : duration ;
}

type log = {
   level : byte ;
   name : string ;
   msg : string ;
   file : string ;
   ros_function : string ;
   line : uint32 ;
   topics : string list ;
}

type clock = {
   clock : time ;
}

