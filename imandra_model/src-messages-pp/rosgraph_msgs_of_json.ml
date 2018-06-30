open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Rosgraph_msgs;;

let json_to_topicStatistics_opt json = 
    jreq json "topic" json_to_string_opt @@ fun topic ->
    jreq json "node_pub" json_to_string_opt @@ fun node_pub ->
    jreq json "node_sub" json_to_string_opt @@ fun node_sub ->
    jreq json "window_start" json_to_time_opt @@ fun window_start ->
    jreq json "window_stop" json_to_time_opt @@ fun window_stop ->
    jreq json "delivered_msgs" json_to_int32_opt @@ fun delivered_msgs ->
    jreq json "dropped_msgs" json_to_int32_opt @@ fun dropped_msgs ->
    jreq json "traffic" json_to_int32_opt @@ fun traffic ->
    jreq json "period_mean" json_to_duration_opt @@ fun period_mean ->
    jreq json "period_stddev" json_to_duration_opt @@ fun period_stddev ->
    jreq json "period_max" json_to_duration_opt @@ fun period_max ->
    jreq json "stamp_age_mean" json_to_duration_opt @@ fun stamp_age_mean ->
    jreq json "stamp_age_stddev" json_to_duration_opt @@ fun stamp_age_stddev ->
    jreq json "stamp_age_max" json_to_duration_opt @@ fun stamp_age_max ->
    Some {
    topic;
    node_pub;
    node_sub;
    window_start;
    window_stop;
    delivered_msgs;
    dropped_msgs;
    traffic;
    period_mean;
    period_stddev;
    period_max;
    stamp_age_mean;
    stamp_age_stddev;
    stamp_age_max;
    }

let json_to_log_opt json = 
    jreq json "header" Std_msgs_of_json.json_to_header_opt @@ fun header ->
    jreq json "level" json_to_byte_opt @@ fun level ->
    jreq json "name" json_to_string_opt @@ fun name ->
    jreq json "msg" json_to_string_opt @@ fun msg ->
    jreq json "file" json_to_string_opt @@ fun file ->
    jreq json "ros_function" json_to_string_opt @@ fun ros_function ->
    jreq json "line" json_to_uint32_opt @@ fun line ->
    jreq json "topics" (jlist json_to_string_opt) @@ fun topics ->
    Some {
    header;
    level;
    name;
    msg;
    file;
    ros_function;
    line;
    topics;
    }

let json_to_clock_opt json = 
    jreq json "clock" json_to_time_opt @@ fun clock ->
    Some {
    clock;
    }

