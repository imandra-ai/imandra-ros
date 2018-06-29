open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Diagnostic_msgs;;

let keyValue_to_json x = [
    ( "key" , x.key |> string_to_json );
    ( "value" , x.value |> string_to_json );
    ] |> assoc_filter_nulls

let diagnosticStatus_to_json x = [
    ( "level" , x.level |> byte_to_json );
    ( "name" , x.name |> string_to_json );
    ( "message" , x.message |> string_to_json );
    ( "hardware_id" , x.hardware_id |> string_to_json );
    ( "values" , x.values |> (mklist keyValue_to_json) );
    ] |> assoc_filter_nulls

let diagnosticArray_to_json x = [
    ( "status" , x.status |> (mklist diagnosticStatus_to_json) );
    ] |> assoc_filter_nulls

