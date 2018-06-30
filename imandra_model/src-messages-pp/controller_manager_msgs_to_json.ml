open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Controller_manager_msgs;;

let controllerStatistics_to_json x = [
    ( "controllerStatistics_name" , x.controllerStatistics_name |> string_to_json );
    ( "controllerStatistics_ros_type" , x.controllerStatistics_ros_type |> string_to_json );
    ( "controllerStatistics_timestamp" , x.controllerStatistics_timestamp |> time_to_json );
    ( "controllerStatistics_running" , x.controllerStatistics_running |> bool_to_json );
    ( "controllerStatistics_max_time" , x.controllerStatistics_max_time |> duration_to_json );
    ( "controllerStatistics_mean_time" , x.controllerStatistics_mean_time |> duration_to_json );
    ( "controllerStatistics_variance_time" , x.controllerStatistics_variance_time |> duration_to_json );
    ( "controllerStatistics_num_control_loop_overruns" , x.controllerStatistics_num_control_loop_overruns |> int32_to_json );
    ( "controllerStatistics_time_last_control_loop_overrun" , x.controllerStatistics_time_last_control_loop_overrun |> time_to_json );
    ] |> assoc_filter_nulls

let hardwareInterfaceResources_to_json x = [
    ( "hardware_interface" , x.hardware_interface |> string_to_json );
    ( "resources" , x.resources |> (mklist string_to_json) );
    ] |> assoc_filter_nulls

let controllersStatistics_to_json x = [
    ( "header" , x.header |> Std_msgs_to_json.header_to_json );
    ( "controller" , x.controller |> (mklist controllerStatistics_to_json) );
    ] |> assoc_filter_nulls

let controllerState_to_json x = [
    ( "controllerState_name" , x.controllerState_name |> string_to_json );
    ( "controllerState_state" , x.controllerState_state |> string_to_json );
    ( "controllerState_ros_type" , x.controllerState_ros_type |> string_to_json );
    ( "controllerState_claimed_resources" , x.controllerState_claimed_resources |> (mklist hardwareInterfaceResources_to_json) );
    ] |> assoc_filter_nulls

