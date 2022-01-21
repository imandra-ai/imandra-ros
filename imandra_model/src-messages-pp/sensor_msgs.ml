module Decode( D : Decoders.Decode.S) = struct
  open D.Infix
  module Basic_types = Basic_types.Decode(D) 
  open Basic_types
  module Std_msgs = Std_msgs.Decode(D) 

  let laser_scan =
    let* header = D.field "header" Std_msgs.header in
    let* angle_min = D.field "angle_min" float in
    let* angle_max = D.field "angle_max" float in
    let* angle_increment = D.field "angle_increment" float in
    let* time_increment = D.field "time_increment" float in
    let* scan_time = D.field "scan_time" float in
    let* range_min = D.field "range_min" float in
    let* range_max = D.field "range_max" float in
    let* ranges = D.field "ranges" (D.list float ) in
    let* intensities = D.field "intensities" (D.list float) in
    D.succeed Ros_messages.Sensor_msgs.
    { header
    ; angle_min
    ; angle_max
    ; angle_increment
    ; time_increment
    ; scan_time
    ; range_min
    ; range_max
    ; ranges
    ; intensities
    }
end
 

module Encode( E : Decoders.Encode.S) = struct
  module Std_msgs = Std_msgs.Encode(E) 
  module Basic_types = Basic_types.Encode(E) 
  open Basic_types

  let header : Ros_messages.Sensor_msgs.laser_scan E.encoder = fun x -> E.obj
    [ ( "header" , Std_msgs.header  x.header )
    ; ( "angle_min" , float  x.angle_min )
    ; ( "angle_max" , float  x.angle_max )
    ; ( "angle_increment" , float  x.angle_increment)
    ; ( "time_increment" , float  x.time_increment  )
    ; ( "scan_time" , float  x.scan_time )
    ; ( "range_min" , float  x.range_min )
    ; ( "range_max" , float  x.range_max )
    ; ( "ranges" , (E.list float )  x.ranges )
    ; ( "intensities" , (E.list float)  x.intensities )    
    ]
    
end