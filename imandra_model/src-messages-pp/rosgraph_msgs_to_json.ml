open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Rosgraph_msgs;;

let topicStatistics_to_json x = [
    ( "topic" , x.topic |> string_to_json );
    ( "node_pub" , x.node_pub |> string_to_json );
    ( "node_sub" , x.node_sub |> string_to_json );
    ( "window_start" , x.window_start |> time_to_json );
    ( "window_stop" , x.window_stop |> time_to_json );
    ( "delivered_msgs" , x.delivered_msgs |> int32_to_json );
    ( "dropped_msgs" , x.dropped_msgs |> int32_to_json );
    ( "traffic" , x.traffic |> int32_to_json );
    ( "period_mean" , x.period_mean |> duration_to_json );
    ( "period_stddev" , x.period_stddev |> duration_to_json );
    ( "period_max" , x.period_max |> duration_to_json );
    ( "stamp_age_mean" , x.stamp_age_mean |> duration_to_json );
    ( "stamp_age_stddev" , x.stamp_age_stddev |> duration_to_json );
    ( "stamp_age_max" , x.stamp_age_max |> duration_to_json );
    ] |> assoc_filter_nulls

let log_to_json x = [
    ( "level" , x.level |> byte_to_json );
    ( "name" , x.name |> string_to_json );
    ( "msg" , x.msg |> string_to_json );
    ( "file" , x.file |> string_to_json );
    ( "ros_function" , x.ros_function |> string_to_json );
    ( "line" , x.line |> uint32_to_json );
    ( "topics" , x.topics |> (mklist string_to_json) );
    ] |> assoc_filter_nulls

let clock_to_json x = [
    ( "clock" , x.clock |> time_to_json );
    ] |> assoc_filter_nulls

