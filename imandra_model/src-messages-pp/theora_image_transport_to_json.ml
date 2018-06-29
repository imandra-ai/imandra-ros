open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Theora_image_transport;;

let packet_to_json x = [
    ( "data" , x.data |> (mklist uint8_to_json) );
    ( "b_o_s" , x.b_o_s |> int32_to_json );
    ( "e_o_s" , x.e_o_s |> int32_to_json );
    ( "granulepos" , x.granulepos |> int64_to_json );
    ( "packetno" , x.packetno |> int64_to_json );
    ] |> assoc_filter_nulls

