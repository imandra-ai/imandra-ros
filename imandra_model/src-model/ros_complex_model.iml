open Ros_messages;; 

type incoming =
  | Clock  of Rosgraph_msgs.clock
  | Sensor of Sensor_msgs.laserScan

type outgoing =
  | Twist of Geometry_msgs.twist
  
type mode =
  | Stopped
  | Turning
  | Driving
  | Error

type state = 
  { mode     : mode 
  ; incoming : incoming option 
  ; outgoing : outgoing option
  }

let init_state = 
  { mode = Stopped
  ; incoming = None
  ; outgoing = None
  }

let make_twist_message v omega =
  let open Geometry_msgs in
  let mkvector x y z = { vector3_x = x; vector3_y = y; vector3_z = z } in 
  Twist { twist_linear  = mkvector v 0 0
        ; twist_angular = mkvector 0 0 omega 
        } 

let valid_incoming incoming =
  match incoming with
    | Sensor smsg -> List.length smsg.Sensor_msgs.laserScan_ranges = 5
    | _ -> true

type sensor_interpretation =
  | FreeAhead
  | Free2Left
  | Free2Right
  | WallAhead
  | SensorError

let interpret_sensor ( ranges : int list ) : sensor_interpretation =
  match List.nth 1 ranges with None -> SensorError | Some range_right ->
  match List.nth 2 ranges with None -> SensorError | Some range_mid   ->
  match List.nth 3 ranges with None -> SensorError | Some range_left  ->
  if range_mid < 65000 then WallAhead else
  if (range_right < 50000) && (range_left < 50000) then WallAhead else
  if  range_right < 50000  then Free2Left  else
  if  range_left  < 50000  then Free2Right else
  FreeAhead


let process_stopped ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match interpret_sensor l.Sensor_msgs.laserScan_ranges with
      | WallAhead -> {state with outgoing = Some (make_twist_message 0 10000) }
      | _ -> {state with outgoing = Some (make_twist_message 10000 0) }
    end

let process_driving ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match interpret_sensor l.Sensor_msgs.laserScan_ranges with
      | WallAhead -> {state with outgoing = Some (make_twist_message 0 10000) }
      | _ -> {state with outgoing = Some (make_twist_message 10000 0) }
    end

let process_turning ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match interpret_sensor l.Sensor_msgs.laserScan_ranges with
      | WallAhead -> {state with outgoing = Some (make_twist_message 0 10000) }
      | _ -> {state with outgoing = Some (make_twist_message 10000 0) }
    end

let one_step (state : state) =
  let state = { state with outgoing = None } in
  if state.mode = Error then state else
  match state.incoming with None -> state | Some msg ->
  if not (valid_incoming msg) then { state with mode = Error } else 
  match state.mode with
    | Stopped -> process_stopped ( state , msg )
    | Driving -> process_driving ( state , msg )
    | Turning -> process_turning ( state , msg )  
    | _ -> state

