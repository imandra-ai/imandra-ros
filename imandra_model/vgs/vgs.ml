open Ros_model;;
open Ros_message;;

(** VG1 pass to error state only if incoming message is wrongly formatted *)
theorem error_state_invalid_message state =
  match state.incoming with None -> true | Some msg -> 
  (  state.mode <> Error 
  && valid_incoming msg  
  ) ==> (one_step state).mode <> Error
;;


(** VG2 If a front sensor detects a wall very close - must have an outgoing twist message with velocity <= 0*)

let get_front_sensor_range state =
  match state.incoming with 
  | Some (Sensor sensor) -> List.nth 2 sensor.Sensor_msgs.ranges 
  | _ -> None 
;;

let no_positive_outgoing_velocity state =
  match state.outgoing with 
  | Some (Twist twist) -> twist.Geometry_msg.linear.x <= 0
  | _ -> false
;;

(** wrong theorem -- error state ignores all messages *)
theorem stop_if_front_sensor_close_wrong state =
  match state.incoming with None -> true | Some msg -> 
  match get_front_sensor_range state with None -> true | Some range_front ->
  let state' = one_step state in
  ( range_front < 500
  && valid_incoming msg  
  ) ==> 
  no_positive_outgoing_velocity state' 
;;

(** Proven *)
theorem stop_if_front_sensor_close state =
  match state.incoming with None -> true | Some msg -> 
  match get_front_sensor_range state with None -> true | Some range_front ->
  let state' = one_step state in
  (  range_front < 500 
  && state.mode <> Error
  && valid_incoming msg  
  ) ==> 
  no_positive_outgoing_velocity state' 
;;
