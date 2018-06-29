open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Roscpp;;

let json_to_logger_opt json = 
    jreq json "name" json_to_string_opt @@ fun name ->
    jreq json "level" json_to_string_opt @@ fun level ->
    Some {
    name;
    level;
    }

