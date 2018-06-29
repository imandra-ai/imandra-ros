open Basic_types;;

type status = {
   id : string ;
   instance_id : string ;
   active : bool ;
   heartbeat_timeout : float32 ;
   heartbeat_period : float32 ;
}

type constants = ()

