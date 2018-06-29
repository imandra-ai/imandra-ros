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
   status_list : goalStatus list ;
}

