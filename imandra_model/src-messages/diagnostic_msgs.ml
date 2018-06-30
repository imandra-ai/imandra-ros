open Basic_types;;

type keyValue = {
   key : string ;
   value : string ;
}

type diagnosticStatus = {
   level : byte ;
   name : string ;
   message : string ;
   hardware_id : string ;
   values : keyValue list ;
}

type diagnosticArray = {
   header : Std_msgs.header ;
   status : diagnosticStatus list ;
}

