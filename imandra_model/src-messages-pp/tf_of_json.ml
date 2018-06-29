open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Tf;;

let json_to_tfMessage_opt json = 
    jreq json "transforms" (jlist Geometry_msgs_of_json.json_to_transformStamped_opt) @@ fun transforms ->
    Some {
    transforms;
    }

