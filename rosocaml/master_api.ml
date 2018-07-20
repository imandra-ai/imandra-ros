module Datatypes = struct

  type   reg_srv_result = ( int * string * string )[@@deriving rpcty]
  type unreg_srv_result = ( int * string * int    )[@@deriving rpcty]
  type   reg_sub_result = ( int * string * string list )[@@deriving rpcty]
  type unreg_sub_result = ( int * string * int    )[@@deriving rpcty]
  type   reg_pub_result = ( int * string * string list )[@@deriving rpcty]
  type unreg_pub_result = ( int * string * int    )[@@deriving rpcty]

  type get_uri_result = ( int * string * string )[@@deriving rpcty]
  type lookup_result = ( int * string * string )[@@deriving rpcty]

  type published_topics = 
    ( int 
    * string 
    * (string * string) array 
    )[@@deriving rpcty]

  type topic_types = 
    ( int 
    * string 
    * (string * string) array 
    )[@@deriving rpcty]

  type system_state = 
    ( int
    * string
    * ( ( string * string list ) array  
      * ( string * string list ) array
      * ( string * string list ) array
      )  
    ) [@@deriving rpcty]
end


module ROS_Master_API(R : Idl.RPC) = struct
  open R
  
  let str_p = Idl.Param.mk Rpc.Types.string
  let int_p = Idl.Param.mk Rpc.Types.int

  let   reg_srv_result_p = Idl.Param.mk Datatypes.reg_srv_result
  let unreg_srv_result_p = Idl.Param.mk Datatypes.unreg_srv_result
  let   reg_sub_result_p = Idl.Param.mk Datatypes.reg_sub_result
  let unreg_sub_result_p = Idl.Param.mk Datatypes.unreg_sub_result
  let   reg_pub_result_p = Idl.Param.mk Datatypes.reg_pub_result
  let unreg_pub_result_p = Idl.Param.mk Datatypes.unreg_pub_result

  let lookup_result_p    = Idl.Param.mk Datatypes.lookup_result
  let published_topics_p = Idl.Param.mk Datatypes.published_topics  
  let topic_types_p      = Idl.Param.mk Datatypes.topic_types  
  let system_state_p     = Idl.Param.mk Datatypes.system_state  

  let err = Idl.DefaultError.err

  (* Register/unregister methods *)

  let registerService = R.declare "registerService"
    ["Register the caller as a provider of the specified service."]
    ( str_p @-> str_p @-> str_p @-> str_p @-> returning reg_srv_result_p err)
  let registerSubscriber = R.declare "registerSubscriber"
    [ "Subscribe the caller to the specified topic. In addition to receiving "
    ^ "a list of current publishers, the subscriber will also receive "
    ^ "notifications of new publishers via the publisherUpdate API."]
    ( str_p @-> str_p @-> str_p @-> str_p @-> returning reg_sub_result_p err)
  let registerPublisher = R.declare "registerPublisher"
    [ "Register the caller as a publisher the topic."]
    ( str_p @-> str_p @-> str_p @-> str_p @-> returning reg_pub_result_p err)

  let unregisterService = R.declare "unregisterService"
    ["Unregister the caller as a provider of the specified service."]
    ( str_p @-> str_p @-> str_p @-> returning unreg_srv_result_p err)
  let unregisterSubscriber = R.declare "unregisterSubscriber"
    [ "Unregister the caller as a publisher of the topic."]
    ( str_p @-> str_p @-> str_p @-> returning unreg_sub_result_p err)
  let unregisterPublisher = R.declare "unregisterPublisher"
    [ "Unregister the caller as a publisher of the topic."]
    ( str_p @-> str_p @-> str_p @-> returning unreg_pub_result_p err)

  (* Name service and system state *)  

  let lookupNode = R.declare "lookupNode"
    [ "Get the XML-RPC URI of the node with the associated name/caller_id. "
    ^ "This API is for looking information about publishers and subscribers. "
    ^ "Use lookupService instead to lookup ROS-RPC URIs."]
    ( str_p @-> str_p @-> returning lookup_result_p err)

  let getPublishedTopics = R.declare "getPublishedTopics"
    [ "Get list of topics that can be subscribed to. "
    ^ "This does not return topics that have no publishers. "
    ^ "See getSystemState() to get more comprehensive list."]
    ( str_p @-> str_p @-> returning published_topics_p err)

  let getTopicTypes = R.declare "getTopicTypes"
    [ "Retrieve list topic names and their types."]
    ( str_p @-> returning topic_types_p err)

  let getSystemState = R.declare "getSystemState"
    ["Retrieve list representation of system state (i.e. publishers, subscribers, and services)."]
    (str_p @-> returning system_state_p err)

  let getUri = R.declare "getUri"
    ["Get the URI of the master."]
    (str_p @-> returning system_state_p err)

  let lookupService = R.declare "lookupService"
    ["Lookup all provider of a particular service."]
    (str_p @-> str_p @-> returning lookup_result_p err)

  let implementation = implement
    { Idl.Interface.name = "ROS_Master"
    ; namespace = None
    ; description = ["ROS Master"]
    ; version = (0,0,1) 
    }
end

type t =
  { caller_id : string
  ; server_proxy_uri : Uri.t
  }

let create ?server caller_id =
  let server_proxy_uri = 
    match server, Sys.getenv_opt "ROS_MASTER_URI" with 
    | Some s , _      -> Uri.of_string s 
    | None   , Some s -> Uri.of_string s
    | None   , None   -> failwith ("\"ROS_MASTER_URI\" is not set." )
    in
  { caller_id; server_proxy_uri }

module Client = ROS_Master_API( Rpc_lwt.GenClient () )
let ( >>= ) = Lwt.(>>=)
  
let rpc t call =
  let body = Xmlrpc.string_of_call call in
  let headers = Cohttp.Header.( of_list
    [ ( "Content-Type"   , "application/x-www-form-urlencoded" )
    ; ( "Content-Length" , string_of_int @@ String.length body )
    ; ( "Accept"         , "*/*"                               )
    ] ) in
  let body = Cohttp_lwt.Body.of_string @@ Xmlrpc.string_of_call call in
  let uri = t.server_proxy_uri in
  Lwt_io.printl "About to post" >>= Lwt_io.flush_all >>= fun () ->
  Lwt_io.printl @@ Xmlrpc.string_of_call call >>= Lwt_io.flush_all >>= fun () ->
  Cohttp_lwt_unix.Client.post ~headers ~body uri >>= fun (responce, body) ->
   match responce.status with 
  | `OK -> 
    Cohttp_lwt.Body.to_string body >>= fun body ->
    Lwt_io.printl body >>= Lwt_io.flush_all >>= fun () ->
    Lwt.return @@ Xmlrpc.response_of_string body
  | _ -> 
    Lwt_io.printl "Request error" >>= Lwt_io.flush_all >>= fun () ->
    Lwt.return @@ Rpc.failure @@ Rpc.rpc_of_unit ()
  




    
let _ =
  let thread = 
    Rpc_lwt.M.lwt @@ Client.getSystemState rpc caller_id >>= fun _ ->
    Lwt.return_unit
  in
  Lwt_main.run thread