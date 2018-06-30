open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Smach_msgs;;

let json_to_smachContainerStatus_opt json = 
    jreq json "smachContainerStatus_header" Std_msgs_of_json.json_to_header_opt @@ fun smachContainerStatus_header ->
    jreq json "smachContainerStatus_path" json_to_string_opt @@ fun smachContainerStatus_path ->
    jreq json "smachContainerStatus_initial_states" (jlist json_to_string_opt) @@ fun smachContainerStatus_initial_states ->
    jreq json "smachContainerStatus_active_states" (jlist json_to_string_opt) @@ fun smachContainerStatus_active_states ->
    jreq json "smachContainerStatus_local_data" json_to_string_opt @@ fun smachContainerStatus_local_data ->
    jreq json "smachContainerStatus_info" json_to_string_opt @@ fun smachContainerStatus_info ->
    Some {
    smachContainerStatus_header;
    smachContainerStatus_path;
    smachContainerStatus_initial_states;
    smachContainerStatus_active_states;
    smachContainerStatus_local_data;
    smachContainerStatus_info;
    }

let json_to_smachContainerInitialStatusCmd_opt json = 
    jreq json "smachContainerInitialStatusCmd_path" json_to_string_opt @@ fun smachContainerInitialStatusCmd_path ->
    jreq json "smachContainerInitialStatusCmd_initial_states" (jlist json_to_string_opt) @@ fun smachContainerInitialStatusCmd_initial_states ->
    jreq json "smachContainerInitialStatusCmd_local_data" json_to_string_opt @@ fun smachContainerInitialStatusCmd_local_data ->
    Some {
    smachContainerInitialStatusCmd_path;
    smachContainerInitialStatusCmd_initial_states;
    smachContainerInitialStatusCmd_local_data;
    }

let json_to_smachContainerStructure_opt json = 
    jreq json "smachContainerStructure_header" Std_msgs_of_json.json_to_header_opt @@ fun smachContainerStructure_header ->
    jreq json "smachContainerStructure_path" json_to_string_opt @@ fun smachContainerStructure_path ->
    jreq json "smachContainerStructure_children" (jlist json_to_string_opt) @@ fun smachContainerStructure_children ->
    jreq json "smachContainerStructure_internal_outcomes" (jlist json_to_string_opt) @@ fun smachContainerStructure_internal_outcomes ->
    jreq json "smachContainerStructure_outcomes_from" (jlist json_to_string_opt) @@ fun smachContainerStructure_outcomes_from ->
    jreq json "smachContainerStructure_outcomes_to" (jlist json_to_string_opt) @@ fun smachContainerStructure_outcomes_to ->
    jreq json "smachContainerStructure_container_outcomes" (jlist json_to_string_opt) @@ fun smachContainerStructure_container_outcomes ->
    Some {
    smachContainerStructure_header;
    smachContainerStructure_path;
    smachContainerStructure_children;
    smachContainerStructure_internal_outcomes;
    smachContainerStructure_outcomes_from;
    smachContainerStructure_outcomes_to;
    smachContainerStructure_container_outcomes;
    }

