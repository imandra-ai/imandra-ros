open Basic_types;;

type smachContainerStatus = {
   path : string ;
   initial_states : string list ;
   active_states : string list ;
   local_data : string ;
   info : string ;
}

type smachContainerInitialStatusCmd = {
   path : string ;
   initial_states : string list ;
   local_data : string ;
}

type smachContainerStructure = {
   path : string ;
   children : string list ;
   internal_outcomes : string list ;
   outcomes_from : string list ;
   outcomes_to : string list ;
   container_outcomes : string list ;
}

