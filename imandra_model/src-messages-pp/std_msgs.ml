module Decode( D : Decoders.Decode.S) = struct
  open D.Infix
  module Builtin_interfaces = Builtin_interfaces.Decode(D) 

  let header =
    let* stamp = D.field "stamp" Builtin_interfaces.time in
    let* frame_id = D.field "frame_id" D.string in
    D.succeed Ros_messages.Std_msgs.{ stamp ; frame_id }

end


module Encode( E : Decoders.Encode.S) = struct
  module Builtin_interfaces = Builtin_interfaces.Encode(E) 

  let header : Ros_messages.Std_msgs.header E.encoder = fun x -> E.obj
    [ ( "stamp" , Builtin_interfaces.time x.stamp )
    ; ( "frame_id" , E.string x.frame_id )
    ]
end