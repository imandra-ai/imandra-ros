
let caller_id = "/script"
let server_proxy_uri = 
  match Sys.getenv_opt "ROS_MASTER_URI" with Some x -> x 
  | None -> failwith ("\"ROS_MASTER_URI\" not set." )


module Datatypes = struct
  module SystemState = struct
    type t = 
      ( int
      * string
      * ( ( string * string list ) array  
        * ( string * string list ) array
        * ( string * string list ) array
        )  
      ) [@@deriving rpcty]
  end 
end


module ROS_Master_API(R : Idl.RPC) = struct
  open R

  let err = Idl.DefaultError.err
  
  let str_p = Idl.Param.mk Rpc.Types.string
  let int_p = Idl.Param.mk Rpc.Types.int
  let sys_state_p = Idl.Param.mk Datatypes.SystemState.t  
  
  let getSystemState = R.declare "getSystemState"
    ["Retrieve list representation of system state (i.e. publishers, subscribers, and services)."]
    (str_p @-> returning sys_state_p err)

  let implementation = implement
    { Idl.Interface.name = "ROS_Master"
    ; namespace = None
    ; description = ["ROS Master"]
    ; version = (0,0,1) 
    }
end

module Client = ROS_Master_API( Rpc_lwt.GenClient () )



let ( >>= ) = Lwt.(>>=)

let rpc call =
  let body = Xmlrpc.string_of_call call in
  let headers = Cohttp.Header.( of_list
    [ ( "Content-Type"   , "application/x-www-form-urlencoded" )
    ; ( "Content-Length" , string_of_int @@ String.length body )
    ; ( "Accept"         , "*/*"                               )
    ] ) in
  let body = Cohttp_lwt.Body.of_string @@ Xmlrpc.string_of_call call in
  let uri = Uri.of_string server_proxy_uri in
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