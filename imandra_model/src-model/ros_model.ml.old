open Ros_messages;; 
open Imandra_prelude;;


let mkvector x y z = { x ; y ; z }

type incoming =
  | Clock  of Rosgraph_msgs.clock
  | Sensor of Sensor_msgs.laserScan

type outgoing =
  | Twist of Geometry_msgs.twist
  
  type incoming_msg = 
    | Clock  of Rosgraph_msgs.clock
    | Sensor of Sensor_msgs.laserScan
  
  type outgoing_msg =
    | Twist of Geometry_msgs.twist
  
  type state =
    { incoming : incoming_msg option
    ; outgoing : outgoing_msg option }

let make_twist_message v =
  let open Geometry_msgs in
  let mkvector x y z = { vector3_x = x; vector3_y = y; vector3_z = z } in 
  Twist { twist_linear  = mkvector v 0 0
        ; twist_angular = mkvector 0 0 0 
        }     

let max = List.fold_left  
  

let one_step state =
  match state.incoming with None -> state | Some in_msg ->
  let state = { state with incoming = None } in
  match in_msg with 
  | Clock  _ -> { state with outgoing = None }
  | Sensor laserScan -> 
    if max laserScan.ranges < 0 then 




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

let valid_incoming incoming =
  match incoming with
    | Sensor smsg -> List.length smsg.Sensor_msgs.ranges = 5
    | _ -> true

let drive state =
  { state with 
    mode = Driving 
  ; outgoing = Some ( Twist Geometry_msg.
    { linear  = mkvector 100 0 0
    ; angular = mkvector 0 0 0 
    } ) 
  }

let stop state =
  { state with 
    mode = Stopped 
  ; outgoing = Some ( Twist Geometry_msg.
    { linear  = mkvector 0 0 0
    ; angular = mkvector 0 0 0 
    } ) 
  }

let turn omega state =
  { state with 
    mode = Turning 
  ; outgoing = Some ( Twist Geometry_msg.
    { linear  = mkvector 0 0 0
    ; angular = mkvector 0 0 omega 
    } ) 
  }

type sensor_interpretation =
  | FreeAhead
  | Free2Left
  | Free2Right
  | WallAhead
  | SensorError

let itp = function
  | FreeAhead  -> "FreeAhead"
  | Free2Left  -> "Free2Left"
  | Free2Right  -> "Free2Right"
  | WallAhead  -> "WallAhead"
  | SensorError  -> "SensorError"

let interpret_sensor ( ranges : int list ) : sensor_interpretation =
  match List.nth 1 ranges with None -> SensorError | Some range_right ->
  match List.nth 2 ranges with None -> SensorError | Some range_mid   ->
  match List.nth 3 ranges with None -> SensorError | Some range_left  ->
  if range_mid < 650 then WallAhead else
  if (range_right < 1000) && (range_left < 1000) then WallAhead else
  if  range_right < 1000  then Free2Left
  if  range_left  < 1000  then Free2Right
  else FreeAhead


let process_stopped ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match interpret_sensor l.Sensor_msgs.ranges with
      | WallAhead -> turn 100 state 
      | _ -> drive state
    end

let process_driving ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      print_endline ( "Driving " ^ itp @@ interpret_sensor l.Sensor_msgs.ranges );
      match interpret_sensor l.Sensor_msgs.ranges with
      | WallAhead -> turn 100 state 
      | _ -> drive state
    end

let process_turning ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      print_endline ( "Turning " ^ itp @@ interpret_sensor l.Sensor_msgs.ranges );
      match interpret_sensor l.Sensor_msgs.ranges with
      | WallAhead -> turn 100 state 
      | _ -> drive state
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

