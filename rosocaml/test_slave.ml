let ( >>= ) = Lwt.(>>=)

let server_thread , pubs_box =
  let server = Slave_server.create 14444 "test_slave" in
  let publishers = Slave_server.publishers server in
  ( server , publishers )

let rec register_pubs () : unit Lwt.t =
  Lwt_mvar.take pubs_box >>= fun pubs ->
  Lwt_io.printl "Registered publishers :" >>= fun () ->
  String.concat "\n" pubs |> Lwt_io.printl >>= fun () ->
  register_pubs ()

let thread =
  Lwt_io.printl "Starting slave API" >>= fun () ->
  Lwt.choose [ Slave_server.slave_server_thread server_thread ; register_pubs () ]

let () = Lwt_main.run thread