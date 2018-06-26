type number = int
type time = 
  { seconds : int
  ; milliseconds : int
  }

type vector3d = 
  { x : number
  ; y : number
  ; z : number }


module Geometry_msg = struct
  type twist = 
    { linear  : vector3d
    ; angular : vector3d
    }
  let default_twist =
    { linear  = { x = 0 ; y = 0 ; z = 0 }
    ; angular = { x = 0 ; y = 0 ; z = 0 }
    }
end

module Sensor_msgs = struct
  type laser_scan = 
    { angle_min        : number
    ; angle_max        : number
    ; angle_increment  : number
    ; time_increment   : number
    ; scan_time        : number
    ; range_min        : number
    ; range_max        : number
    ; ranges           : number list
    ; intensities      : number list
    }
end

module Rosgraph_msgs = struct 
  type severity =
    | DEBUG
    | INFO
    | WARN
    | ERROR
    | FATAL 
  type clock = { clock : time }
  type log = 
  { level : severity
  ; name  : string 
  ; msg   : string  
  ; file  : string 
  ; func  : string
  ; line  : int 
  ; topics : string list  
  }
end

