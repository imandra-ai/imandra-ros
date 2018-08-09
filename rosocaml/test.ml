let ( >>= ) = Lwt.(>>=)


let print_entry (name, names) =
  Lwt_io.printl ( "  " ^ name ) >>= fun () ->
  names |> Lwt_list.iter_s ( fun n ->  "    " ^ n |> Lwt_io.printl )

let thread =
  let api = Master_api.create "/rosocaml" in
  Master_api.getUri api >>= fun masterURI ->
  Lwt_io.printl "Call to getUri" >>= fun () ->
  Lwt_io.printf "Got masterURI : %s \n" masterURI >>= fun () ->
  Master_api.getSystemState api >>= fun state  ->
  Lwt_io.printl "Call to getSystemState" >>= fun () ->
  Lwt_io.printl "PUBS : " >>= fun () ->
  state.publishers |> Array.to_list |> Lwt_list.iter_s print_entry >>= fun () ->
  Lwt_io.printl "SUBS : " >>= fun () ->
  state.subscribers |> Array.to_list |> Lwt_list.iter_s print_entry >>= fun () ->
  Lwt_io.printl "SRVS : " >>= fun () ->
  state.services |> Array.to_list |> Lwt_list.iter_s print_entry >>= fun () ->
  Lwt_io.printl "Registering  pub" >>= fun () ->
  Master_api.registerSubscriber api "rosocaml_test" "std_msgs/String" "http://localhost:14444" >>= fun _ ->
  Lwt_io.printf "Done\n" 


let () = Lwt_main.run thread