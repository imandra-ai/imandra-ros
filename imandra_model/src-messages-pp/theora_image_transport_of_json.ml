open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Theora_image_transport;;

let json_to_packet_opt json = 
    jreq json "header" Std_msgs_of_json.json_to_header_opt @@ fun header ->
    jreq json "data" (jlist json_to_uint8_opt) @@ fun data ->
    jreq json "b_o_s" json_to_int32_opt @@ fun b_o_s ->
    jreq json "e_o_s" json_to_int32_opt @@ fun e_o_s ->
    jreq json "granulepos" json_to_int64_opt @@ fun granulepos ->
    jreq json "packetno" json_to_int64_opt @@ fun packetno ->
    Some {
    header;
    data;
    b_o_s;
    e_o_s;
    granulepos;
    packetno;
    }

