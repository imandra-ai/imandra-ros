open Slave_api

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

module Client = ROS_Slave_API( Rpc_lwt.GenClient () )

let ( >>= ) = Lwt.(>>=)

let log str =
  Lwt_io.printl str >>= Lwt_io.flush_all 

let rpc ?(verbose=true) t call =
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
  | Ok ( 1l , _ , result ) -> Lwt.return result
  | Ok ( _ , errstr , _ ) -> 
     Lwt.fail (Failure ("XMLRPC " ^ nm ^ " call failed: " ^ errstr))

let getMasterUri t : string Lwt.t =
  Client.getMasterUri (rpc t) t.caller_id 
  |> Rpc_lwt.M.lwt >>= unpack_result "getMasterUri"

let shutdown t ?(msg="") : int32 Lwt.t =
  Client.shutdown (rpc t) t.caller_id msg
  |> Rpc_lwt.M.lwt >>= unpack_result "shutdown"

let getSubscriptions t : ( string * string ) array Lwt.t =
  Client.getSubscriptions (rpc t) t.caller_id 
  |> Rpc_lwt.M.lwt >>= unpack_result "getSubscriptions"

let getPublications  t : ( string * string ) array Lwt.t =
  Client.getSubscriptions (rpc t) t.caller_id
  |> Rpc_lwt.M.lwt >>= unpack_result "getPublications"

let paramUpdate t parameter_key parameter_value : int32 Lwt.t =
  Client.paramUpdate (rpc t) t.caller_id parameter_key parameter_value
  |> Rpc_lwt.M.lwt >>= unpack_result "paramUpdate"

let publisherUpdate t topic publishers : int32 Lwt.t = 
  Client.publisherUpdate (rpc t) t.caller_id topic publishers
  |> Rpc_lwt.M.lwt >>= unpack_result "publisherUpdate"

let requestTopic t topic protocols : string list Lwt.t =
  Client.requestTopic (rpc t) t.caller_id topic protocols
  |> Rpc_lwt.M.lwt >>= unpack_result "requestTopic"


