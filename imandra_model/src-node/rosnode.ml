let (>>=) = Lwt.(>>=);;

let rec ros_event_loop ( zmqpub , zmqsub ) state : unit Lwt.t= 
  let loop = ros_event_loop ( zmqpub , zmqsub ) in
  Lwt_zmq.Socket.(recv zmqsub) >>= fun msg ->
  let msg = Yojson.Basic.from_string msg in
  let msg = Model_codec.json_to_incoming_opt msg in
  match msg with None -> loop state | Some msg ->  
  let state = Ros_model.{ state with incoming = Some msg } in
  let state = Ros_model.one_step state in
  match state.Ros_model.outgoing with
    | Some msg -> begin
      let msg = Model_codec.outgoing_to_json msg in
      let msg = Yojson.Basic.to_string msg in
      Lwt_zmq.Socket.send zmqpub msg >>= fun () ->
      loop state
    end 
    | None -> loop state 

let run_client zmqcontext = 
  (* Bringing up ZMQ sockets *)
  let zmqsubsocket = ZMQ.Socket.(create zmqcontext sub) in
  let zmqpubsocket = ZMQ.Socket.(create zmqcontext pub) in
  (* Connecting *)
  let () = ZMQ.Socket.connect zmqsubsocket "tcp://127.0.0.1:16000" in 
  let () = ZMQ.Socket.subscribe zmqsubsocket "" in
  let () = ZMQ.Socket.bind zmqpubsocket "tcp://127.0.0.1:16001" in 
  (* Adapt to LWT*)
  let zmqsubsocket = Lwt_zmq.Socket.of_socket zmqsubsocket in
  let zmqpubsocket = Lwt_zmq.Socket.of_socket zmqpubsocket in
  (* Starting the loop *)
  let loop = ros_event_loop ( zmqpubsocket , zmqsubsocket ) Ros_model.init_state in
  Lwt_main.run loop

let () = 
  let zmqcontext = ZMQ.Context.create () in
  run_client zmqcontext
