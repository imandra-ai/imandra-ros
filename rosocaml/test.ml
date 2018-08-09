let ( >>= ) = Lwt.(>>=)

let slave_thread , pubs_box =
  let server = Slave_server.create 14444 "test_slave" in
  let publishers = Slave_server.publishers server in
  ( server , publishers )

let rec register_pubs () : unit Lwt.t =
  Lwt_mvar.take pubs_box >>= fun pubs ->
  Lwt_io.printl "Registered publishers :" >>= fun () ->
  String.concat "\n" pubs |> Lwt_io.printl >>= fun () ->
  register_pubs ()

let print_entry (name, names) =
  Lwt_io.printl ( "  " ^ name ) >>= fun () ->
  names |> Lwt_list.iter_s ( fun n ->  "    " ^ n |> Lwt_io.printl )

let pub_register api = 
  Lwt_io.printl "Registering  pub" >>= fun () ->
  Master_api.registerSubscriber api "rosocaml_test" "std_msgs/String" "http://localhost:14444" >>= fun _ ->
  Lwt_io.printf "Done\n"

let sstate_register api = 
  Master_api.getSystemState api >>= fun state  ->
  Lwt_io.printl "Call to getSystemState" >>= fun () ->
  Lwt_io.printl "PUBS : " >>= fun () ->
  state.publishers |> Array.to_list |> Lwt_list.iter_s print_entry >>= fun () ->
  Lwt_io.printl "SUBS : " >>= fun () ->
  state.subscribers |> Array.to_list |> Lwt_list.iter_s print_entry >>= fun () ->
  Lwt_io.printl "SRVS : " >>= fun () ->
  state.services |> Array.to_list |> Lwt_list.iter_s print_entry
  

let thread =
  let api = Master_api.create "/rosocaml" in
  Master_api.getUri api >>= fun masterURI ->
  Lwt_io.printl "Call to getUri" >>= fun () ->
  Lwt_io.printf "Got masterURI : %s \n" masterURI >>= fun () ->
  Lwt.join 
    [ Slave_server.slave_server_thread slave_thread
    ; pub_register api >>= fun () -> sstate_register api
    ]

let () = Lwt_main.run thread