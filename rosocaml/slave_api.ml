module Datatypes = struct
  type str_list = string list [@@deriving rpcty] 
  
  type      int_result = ( int * string * int    )[@@deriving rpcty]
  type   string_result = ( int * string * string )[@@deriving rpcty]
  type     list_result = ( int * string * string list )[@@deriving rpcty]
  type    assoc_result = ( int * string * ( string * string ) array )[@@deriving rpcty]
end


module ROS_Slave_API(R : Idl.RPC) = struct
  open R
  
  let description = Idl.Interface.{
      name = "rosocaml slave XMLRPC API";
      namespace = Some "rosocaml";
      description = [
        "The OCaml ROS slave XMLRPC API implementation."
      ];
      version=(0,0,1);
    }

  let implementation = implement description
  
  let str_p = Idl.Param.mk Rpc.Types.string
  let str_list_p = Idl.Param.mk Datatypes.str_list

  let    int_result_p = Idl.Param.mk Datatypes.int_result
  let string_result_p = Idl.Param.mk Datatypes.string_result
  let   list_result_p = Idl.Param.mk Datatypes.list_result
  let  assoc_result_p = Idl.Param.mk Datatypes.assoc_result

  let err = Idl.DefaultError.err

  let getMasterUri = R.declare "getMasterUri"
    [ "Get the URI of the master node." ]
    ( str_p @-> returning string_result_p err)     
  let shutdown = R.declare "shutdown"
    [ "Stop this server." ]
    ( str_p @-> str_p @-> returning int_result_p err)         
  let getSubscriptions = R.declare "getSubscriptions"
    [ "Get the PID of this server." ]
    ( str_p @-> returning assoc_result_p err) 
  let getPublications = R.declare "getPublications"
    [ "Retrieve a list of topics that this node subscribes to." ]
    ( str_p @-> returning assoc_result_p err)  
  let paramUpdate = R.declare "paramUpdate"
    [ "Callback from master with updated value of subscribed parameter." ]
    ( str_p @-> str_p @-> str_p @-> returning int_result_p err)      
  let publisherUpdate  = R.declare "publisherUpdate"
    [ "Callback from master of current publisher list for specified topic." ]
    ( str_p @-> str_p @-> str_list_p @-> returning int_result_p err)  
  let requestTopic = R.declare "requestTopic"
    [ "Publisher node API method called by a subscriber node. "
    ^ "This requests that source allocate a channel for communication. "
    ^ "Subscriber provides a list of desired protocols for communication. "
    ^ "Publisher returns the selected protocol along with any additional " 
    ^ "params required for establishing connection. "
    ^ "For example, for a TCP/IP-based connection, the source node may "
    ^ "return a port number of TCP/IP server."
    ]( str_p @-> str_p @-> str_list_p @-> returning list_result_p err)     
end
