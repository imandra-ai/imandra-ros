open Basic_types;;

type goalID = {
   stamp : time ;
   id : string ;
}

type goalStatus = {
   goal_id : goalID ;
   status : uint8 ;
   text : string ;
}

type goalStatusArray = {
   header : Std_msgs.header ;
   status_list : goalStatus list ;
}

