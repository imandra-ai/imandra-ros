open Basic_types;;

type smachContainerStatus = {
   smachContainerStatus_path : string ;
   smachContainerStatus_initial_states : string list ;
   smachContainerStatus_active_states : string list ;
   smachContainerStatus_local_data : string ;
   smachContainerStatus_info : string ;
}

type smachContainerInitialStatusCmd = {
   smachContainerInitialStatusCmd_path : string ;
   smachContainerInitialStatusCmd_initial_states : string list ;
   smachContainerInitialStatusCmd_local_data : string ;
}

type smachContainerStructure = {
   smachContainerStructure_path : string ;
   smachContainerStructure_children : string list ;
   smachContainerStructure_internal_outcomes : string list ;
   smachContainerStructure_outcomes_from : string list ;
   smachContainerStructure_outcomes_to : string list ;
   smachContainerStructure_container_outcomes : string list ;
}

