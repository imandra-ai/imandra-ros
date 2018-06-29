open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Controller_manager_msgs;;

let json_to_controllerStatistics_opt json = 
    jreq json "controllerStatistics_name" json_to_string_opt @@ fun controllerStatistics_name ->
    jreq json "controllerStatistics_ros_type" json_to_string_opt @@ fun controllerStatistics_ros_type ->
    jreq json "controllerStatistics_timestamp" json_to_time_opt @@ fun controllerStatistics_timestamp ->
    jreq json "controllerStatistics_running" json_to_bool_opt @@ fun controllerStatistics_running ->
    jreq json "controllerStatistics_max_time" json_to_duration_opt @@ fun controllerStatistics_max_time ->
    jreq json "controllerStatistics_mean_time" json_to_duration_opt @@ fun controllerStatistics_mean_time ->
    jreq json "controllerStatistics_variance_time" json_to_duration_opt @@ fun controllerStatistics_variance_time ->
    jreq json "controllerStatistics_num_control_loop_overruns" json_to_int32_opt @@ fun controllerStatistics_num_control_loop_overruns ->
    jreq json "controllerStatistics_time_last_control_loop_overrun" json_to_time_opt @@ fun controllerStatistics_time_last_control_loop_overrun ->
    Some {
    controllerStatistics_name;
    controllerStatistics_ros_type;
    controllerStatistics_timestamp;
    controllerStatistics_running;
    controllerStatistics_max_time;
    controllerStatistics_mean_time;
    controllerStatistics_variance_time;
    controllerStatistics_num_control_loop_overruns;
    controllerStatistics_time_last_control_loop_overrun;
    }

let json_to_hardwareInterfaceResources_opt json = 
    jreq json "hardware_interface" json_to_string_opt @@ fun hardware_interface ->
    jreq json "resources" (jlist json_to_string_opt) @@ fun resources ->
    Some {
    hardware_interface;
    resources;
    }

let json_to_controllersStatistics_opt json = 
    jreq json "controller" (jlist json_to_controllerStatistics_opt) @@ fun controller ->
    Some {
    controller;
    }

let json_to_controllerState_opt json = 
    jreq json "controllerState_name" json_to_string_opt @@ fun controllerState_name ->
    jreq json "controllerState_state" json_to_string_opt @@ fun controllerState_state ->
    jreq json "controllerState_ros_type" json_to_string_opt @@ fun controllerState_ros_type ->
    jreq json "controllerState_claimed_resources" (jlist json_to_hardwareInterfaceResources_opt) @@ fun controllerState_claimed_resources ->
    Some {
    controllerState_name;
    controllerState_state;
    controllerState_ros_type;
    controllerState_claimed_resources;
    }

