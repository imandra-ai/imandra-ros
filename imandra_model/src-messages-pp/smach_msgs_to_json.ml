open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Smach_msgs;;

let smachContainerStatus_to_json x = [
    ( "smachContainerStatus_header" , x.smachContainerStatus_header |> Std_msgs_to_json.header_to_json );
    ( "smachContainerStatus_path" , x.smachContainerStatus_path |> string_to_json );
    ( "smachContainerStatus_initial_states" , x.smachContainerStatus_initial_states |> (mklist string_to_json) );
    ( "smachContainerStatus_active_states" , x.smachContainerStatus_active_states |> (mklist string_to_json) );
    ( "smachContainerStatus_local_data" , x.smachContainerStatus_local_data |> string_to_json );
    ( "smachContainerStatus_info" , x.smachContainerStatus_info |> string_to_json );
    ] |> assoc_filter_nulls

let smachContainerInitialStatusCmd_to_json x = [
    ( "smachContainerInitialStatusCmd_path" , x.smachContainerInitialStatusCmd_path |> string_to_json );
    ( "smachContainerInitialStatusCmd_initial_states" , x.smachContainerInitialStatusCmd_initial_states |> (mklist string_to_json) );
    ( "smachContainerInitialStatusCmd_local_data" , x.smachContainerInitialStatusCmd_local_data |> string_to_json );
    ] |> assoc_filter_nulls

let smachContainerStructure_to_json x = [
    ( "smachContainerStructure_header" , x.smachContainerStructure_header |> Std_msgs_to_json.header_to_json );
    ( "smachContainerStructure_path" , x.smachContainerStructure_path |> string_to_json );
    ( "smachContainerStructure_children" , x.smachContainerStructure_children |> (mklist string_to_json) );
    ( "smachContainerStructure_internal_outcomes" , x.smachContainerStructure_internal_outcomes |> (mklist string_to_json) );
    ( "smachContainerStructure_outcomes_from" , x.smachContainerStructure_outcomes_from |> (mklist string_to_json) );
    ( "smachContainerStructure_outcomes_to" , x.smachContainerStructure_outcomes_to |> (mklist string_to_json) );
    ( "smachContainerStructure_container_outcomes" , x.smachContainerStructure_container_outcomes |> (mklist string_to_json) );
    ] |> assoc_filter_nulls

