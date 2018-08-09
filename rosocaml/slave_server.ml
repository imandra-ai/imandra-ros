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
  log ( "Slave API call to \"" ^ call ^ "\" successful, returning OK." )  >>= fun () ->
  Rpc_lwt.M.return ( 1l , "" , x )

(* Hacking around the fact that Rpcmarshal never creates Int32 values *)
let rec scan_for_int32 : Rpc.t -> Rpc.t = function
  | Int i -> Int32 ( Int64.to_int32 i)
  | Enum lst -> Enum( List.map scan_for_int32 lst )
  | Dict lst -> Dict( List.map (fun (k,v) -> k , scan_for_int32 v ) lst )
  | v -> v  

(* Hacking around Xmlrpc.string_of_response structure wrapping *)
let string_of_response response =
  String.concat "" 
    [ "<?xml version=\"1.0\"?><methodResponse><params><param>"
    ; Xmlrpc.to_string @@ scan_for_int32 response.Rpc.contents
    ; "</param></params></methodResponse>"
    ]

let server (port : int) (fn : Rpc_lwt.lwt_rpcfn) = 
  let xmrpc_callback _conn (req : Cohttp.Request.t) (body : Cohttp_lwt.Body.t) =
    if Cohttp.Request.meth req <> `POST then 
      Cohttp_lwt_unix.Server.respond_error ~status:`Bad_request ~body:"" ()
    else 
    Cohttp_lwt.Body.to_string body >>= fun body ->
    Xmlrpc.call_of_string body |> fn >>= fun responce ->
    let body = string_of_response responce in
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
  Server.getPid ( fun _ -> 
    Unix.getpid () |> Int32.of_int |> ok "getPid" 
  );
  Server.shutdown ( fun caller_id reason -> 
    log ("Slave API shutdown initiated by " ^ caller_id ^ ": " ^ reason ) >>= fun () ->
    rpc_wrap ( Lwt_mvar.put t.shutdown () ) >>= fun () ->
    ok "shutdown" @@ 1l 
  );
  Server.publisherUpdate ( fun caller_id topic publishers ->
    log ("Publisher updates received from " ^ caller_id ^ " on " ^ topic ) >>= fun () ->
    rpc_wrap ( Lwt_mvar.put t.publishers publishers ) >>= fun () ->
    ok "publisherUpdate" @@ 1l 
  );
  Server.getSubscriptions( fun _ -> 
    log ("Received request on \"getSubscriptions\". The endpoint is not implemented yet." ) >>= fun () ->
    Rpc_lwt.M.return ( 0l , "Not Implemented" , [||] ) 
  );
  Server.getBusInfo      ( fun _     -> Rpc_lwt.M.return ( 0l , "Not Implemented" , []   ) );
  Server.getPublications ( fun _     -> Rpc_lwt.M.return ( 0l , "Not Implemented" , [||] ) );
  Server.paramUpdate     ( fun _ _ _ -> Rpc_lwt.M.return ( 0l , "Not Implemented" , 0l   ) );
  Server.requestTopic    ( fun _ _ _ -> Rpc_lwt.M.return ( 0l , "Not Implemented" , []   ) );
  Lwt.choose 
    [ server t.port @@ Rpc_lwt.server Server.implementation
    ; Lwt_mvar.take t.shutdown
    ] 
