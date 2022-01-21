module Decode( D : Decoders.Decode.S) = struct
  open D.Infix
  module Basic_types = Basic_types.Decode(D) 
  open Basic_types


  let time =
    let* sec = D.field "sec" int in
    let* nanosec = D.field "nanosec" int in
    D.succeed Ros_messages.Builtin_interfaces.{ sec ; nanosec }

end


module Encode( E : Decoders.Encode.S) = struct
  module Basic_types = Basic_types.Encode(E) 
  open Basic_types

  let time : Ros_messages.Builtin_interfaces.time  E.encoder = fun x -> E.obj
    [ ( "sec" , int x.sec )
    ; ( "nanosec" , int x.nanosec )
    ]
end