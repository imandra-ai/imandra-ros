module Datatypes = struct

  type   reg_srv_result = ( int * string * string )[@@deriving rpcty]
  type unreg_srv_result = ( int * string * int    )[@@deriving rpcty]
  type   reg_sub_result = ( int * string * string list )[@@deriving rpcty]
  type unreg_sub_result = ( int * string * int    )[@@deriving rpcty]
  type   reg_pub_result = ( int * string * string list )[@@deriving rpcty]
  type unreg_pub_result = ( int * string * int    )[@@deriving rpcty]

  type get_uri_result = ( int * string * string )[@@deriving rpcty]
  type lookup_result  = ( int * string * string )[@@deriving rpcty]
  
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
  (* let int_p = Idl.Param.mk Rpc.Types.int *)

  let   reg_srv_result_p = Idl.Param.mk Datatypes.reg_srv_result
  let unreg_srv_result_p = Idl.Param.mk Datatypes.unreg_srv_result
  let   reg_sub_result_p = Idl.Param.mk Datatypes.reg_sub_result
  let unreg_sub_result_p = Idl.Param.mk Datatypes.unreg_sub_result
  let   reg_pub_result_p = Idl.Param.mk Datatypes.reg_pub_result
  let unreg_pub_result_p = Idl.Param.mk Datatypes.unreg_pub_result

  let lookup_result_p    = Idl.Param.mk Datatypes.lookup_result
  let get_uri_result_p   = Idl.Param.mk Datatypes.get_uri_result
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
    (str_p @-> returning get_uri_result_p err)

  let lookupService = R.declare "lookupService"
    ["Lookup all provider of a particular service."]
    (str_p @-> str_p @-> returning lookup_result_p err)

  (*  
  let implementation = implement
    { Idl.Interface.name = "ROS_Master"
    ; namespace = None
    ; description = ["ROS Master"]
    ; version = (0,0,1) 
    }
  *)

end

type t =
  { caller_id : string
  ; server_proxy_uri : Uri.t
  }

type system_state =
  { publishers  : (string * string list) array 
  ; subscribers : (string * string list) array 
  ; services    : (string * string list) array
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

let log str =
  Lwt_io.printl str >>= Lwt_io.flush_all 

let rpc ?(verbose=false) t call =
  let body = Xmlrpc.string_of_call call in
  let headers = Cohttp.Header.( of_list
    [ ( "Content-Type"   , "application/x-www-form-urlencoded" )
    ; ( "Content-Length" , string_of_int @@ String.length body )
    ; ( "Accept"         , "*/*"                               )
    ] ) in
  let body = Cohttp_lwt.Body.of_string @@ Xmlrpc.string_of_call call in
  let uri = t.server_proxy_uri in
  ( if verbose then log "About to post" else Lwt.return_unit ) >>= fun () ->
  ( if verbose then log  @@ Xmlrpc.string_of_call call else  Lwt.return_unit ) >>= fun () ->
  Cohttp_lwt_unix.Client.post ~headers ~body uri >>= fun (responce, body) ->
   match responce.status with 
  | `OK -> 
    Cohttp_lwt.Body.to_string body >>= fun body ->
    ( if verbose then log body else Lwt.return_unit ) >>= fun () ->
    Lwt.return @@ Xmlrpc.response_of_string body
  | _ -> 
    Lwt_io.printl "Request error" >>= Lwt_io.flush_all >>= fun () ->
    Lwt.return @@ Rpc.failure @@ Rpc.rpc_of_unit ()


let unpack_result nm = function   
  | Error _   -> Lwt.fail (Failure ("XMLRPC " ^ nm ^ " call failed. Internal error."))
  | Ok ( 1 , _ , result ) -> Lwt.return result
  | Ok ( _ , errstr , _ ) -> 
     Lwt.fail (Failure ("XMLRPC " ^ nm ^ " call failed: " ^ errstr))


let registerService t service service_api caller_api : string Lwt.t =
  Client.registerService ( rpc t ) t.caller_id service service_api caller_api 
  |> Rpc_lwt.M.lwt >>= unpack_result "registerSerivce"

let registerSubscriber t topic topic_type caller_api : string list Lwt.t =
  Client.registerSubscriber ( rpc t ) t.caller_id topic topic_type caller_api 
  |> Rpc_lwt.M.lwt >>= unpack_result "registerSubscriber"

let registerPublisher t topic topic_type caller_api : string list Lwt.t =
  Client.registerPublisher ( rpc t ) t.caller_id topic topic_type caller_api 
  |> Rpc_lwt.M.lwt >>= unpack_result "registerPublisher"

let unregisterService t service service_api : int Lwt.t =
  Client.unregisterService ( rpc t ) t.caller_id service service_api 
  |> Rpc_lwt.M.lwt >>= unpack_result "unregisterService"

let unregisterSubscriber t topic api : int Lwt.t =
  Client.unregisterSubscriber ( rpc t ) t.caller_id topic api 
  |> Rpc_lwt.M.lwt >>= unpack_result "unregisterSubscriber"

let unregisterPublisher t topic api : int Lwt.t =
  Client.unregisterPublisher ( rpc t ) t.caller_id topic api 
  |> Rpc_lwt.M.lwt >>= unpack_result "unregisterPublisher"

let lookupNode t node_name : string Lwt.t = 
  Client.lookupNode ( rpc t ) t.caller_id node_name 
  |> Rpc_lwt.M.lwt >>= unpack_result "lookupNode"
  
let getPublishedTopics t subgraph : (string * string) array Lwt.t =
  Client.getPublishedTopics ( rpc t ) t.caller_id subgraph 
  |> Rpc_lwt.M.lwt >>= unpack_result "getPublishedTopics"

let getTopicTypes t : (string * string) array Lwt.t = 
  Client.getTopicTypes ( rpc t ) t.caller_id  
  |> Rpc_lwt.M.lwt >>= unpack_result "getTopicTypes"
  
let getSystemState t : system_state Lwt.t = 
  Client.getSystemState ( rpc t ) t.caller_id  
  |> Rpc_lwt.M.lwt >>= unpack_result "getSystemState" 
  >>= fun (publishers,subscribers,services) ->
  Lwt.return { publishers; subscribers; services }

let getUri t : string Lwt.t= 
  Client.getUri ( rpc t ) t.caller_id  
  |> Rpc_lwt.M.lwt >>= unpack_result "getUri"

let lookupService t service : string Lwt.t = 
  Client.lookupService ( rpc t ) t.caller_id service
  |> Rpc_lwt.M.lwt >>= unpack_result "lookupService"

