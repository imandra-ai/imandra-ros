let (>>=) = Lwt.(>>=);;

let rec ros_event_loop ( zmqpub , zmqsub ) state : unit Lwt.t= 
  let () = Ros_model.print_state state in let () = flush_all () in
  let loop = ros_event_loop ( zmqpub , zmqsub ) in
  Zmq_lwt.Socket.(recv zmqsub) >>= fun msg ->
  let msg = Model_codec.json_to_incoming_opt msg in
  match msg with None -> loop state | Some msg ->  
  let state = Ros_model.{ state with incoming = Some msg } in
  let state = Ros_model.one_step state in
  match state.Ros_model.outgoing with
    | Some msg -> begin
      let () = print_endline "got outgoing msg" in let () = flush_all () in
      let msg = Model_codec.outgoing_to_json msg in
      Zmq_lwt.Socket.send zmqpub msg >>= fun () ->
      loop state
    end 
    | None -> loop state 

let run_client zmqcontext = 
  (* Bringing up ZMQ sockets *)
  let zmqsubsocket = Zmq.Socket.(create zmqcontext sub) in
  let zmqpubsocket = Zmq.Socket.(create zmqcontext pub) in
  (* Connecting *)
  let () = Zmq.Socket.connect zmqsubsocket "tcp://127.0.0.1:16000" in 
  let () = Zmq.Socket.subscribe zmqsubsocket "" in
  let () = Zmq.Socket.bind zmqpubsocket "tcp://127.0.0.1:16001" in 
  (* Adapt to LWT*)
  let zmqsubsocket = Zmq_lwt.Socket.of_socket zmqsubsocket in
  let zmqpubsocket = Zmq_lwt.Socket.of_socket zmqpubsocket in
  (* Starting the loop *)
  let loop = ros_event_loop ( zmqpubsocket , zmqsubsocket ) Ros_model.init_state in
  Lwt_main.run loop

let () = 
  let zmqcontext = Zmq.Context.create () in
  run_client zmqcontext
