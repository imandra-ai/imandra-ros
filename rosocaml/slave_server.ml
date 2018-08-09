open Slave_api

type t =
  { caller_id : string
  ; server_proxy_uri : Uri.t
  ; shutdown : unit Lwt_mvar.t
  ; publishers : string list Lwt_mvar.t
  ; port : int
  }

let create ?server port caller_id =
  let server_proxy_uri = 
    match server, Sys.getenv_opt "ROS_MASTER_URI" with 
    | Some s , _      -> Uri.of_string s 
    | None   , Some s -> Uri.of_string s
    | None   , None   -> failwith ("\"ROS_MASTER_URI\" is not set." )
    in
  { caller_id
  ; server_proxy_uri 
  ; port
  ; shutdown = Lwt_mvar.create_empty ()
  ; publishers = Lwt_mvar.create_empty ()
  }

let publishers t = t.publishers

module Server = ROS_Slave_API( Rpc_lwt.GenServer () )

let ( >>= ) = Lwt.(>>=)

let rpc_wrap thread =
  let thread = thread >>= fun () -> Lwt.return @@ Result.Ok () in
  Rpc_lwt.M.{ lwt = thread }

let log str =
  Lwt_io.printl str >>= 
  Lwt_io.flush_all 
  |> rpc_wrap

let ok call x = 
  let open Rpc_lwt.M in
  log ( "Slave API call to " ^ call ^ " successful. Returning OK." )  >>= fun () ->
  Rpc_lwt.M.return ( 1 , "" , x )

let server (port : int) (fn : Rpc_lwt.lwt_rpcfn) = 
  let xmrpc_callback _conn (req : Cohttp.Request.t) (body : Cohttp_lwt.Body.t) =
    if Cohttp.Request.meth req <> `POST then 
      Cohttp_lwt_unix.Server.respond_error ~status:`Bad_request ~body:"" ()
    else 
    Cohttp_lwt.Body.to_string body >>= fun body ->
    Xmlrpc.call_of_string body |> fn >>= fun responce ->
    let body = Xmlrpc.string_of_response responce in
    let headers = Cohttp.Header.( of_list
    [ ( "Content-Type"   , "application/x-www-form-urlencoded" )
    ; ( "Content-Length" , string_of_int @@ String.length body )
    ; ( "Accept"         , "*/*"                               )
    ] ) in 
    Cohttp_lwt_unix.Server.respond_string ~status:`OK ~body ~headers ()
    in
  let mode = `TCP (`Port port) in
  Cohttp_lwt_unix.Server.(create ~mode (make ~callback:xmrpc_callback ()) )

let slave_server_thread t =
  let open Rpc_lwt.M in
  Server.getMasterUri ( fun _ -> 
    ok "getMasterUri" @@ Uri.to_string t.server_proxy_uri 
  );
  Server.shutdown ( fun caller_id reason -> 
    log ("Slave API shutdown initiated by " ^ caller_id ^ ": " ^ reason ) >>= fun () ->
    rpc_wrap ( Lwt_mvar.put t.shutdown () ) >>= fun () ->
    ok "shutdown" @@ 1 
  );
  Server.publisherUpdate ( fun caller_id topic publishers ->
    log ("Publisher updates received from " ^ caller_id ^ " on " ^ topic ) >>= fun () ->
    rpc_wrap ( Lwt_mvar.put t.publishers publishers ) >>= fun () ->
    ok "publisherUpdate" @@ 1 
  );
  Server.getSubscriptions( fun _ -> Rpc_lwt.M.return_err @@ Idl.DefaultError.InternalError "Not Implemented" );
  Server.getPublications ( fun _ -> Rpc_lwt.M.return_err @@ Idl.DefaultError.InternalError "Not Implemented" );
  Server.paramUpdate     ( fun _ _ _ -> Rpc_lwt.M.return_err @@ Idl.DefaultError.InternalError "Not Implemented" );
  Server.requestTopic    ( fun _ _ _ -> Rpc_lwt.M.return_err @@ Idl.DefaultError.InternalError "Not Implemented" );
  server t.port @@ Rpc_lwt.server Server.implementation 
