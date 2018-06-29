open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Roscpp;;

let logger_to_json x = [
    ( "name" , x.name |> string_to_json );
    ( "level" , x.level |> string_to_json );
    ] |> assoc_filter_nulls

