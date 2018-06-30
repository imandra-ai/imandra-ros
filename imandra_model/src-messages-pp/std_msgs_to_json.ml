open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Std_msgs;;

let std_bool_to_json x = [
    ( "bool_data" , x.bool_data |> bool_to_json );
    ] |> assoc_filter_nulls

let header_to_json x = [
    ( "seq" , x.seq |> uint32_to_json );
    ( "stamp" , x.stamp |> time_to_json );
    ( "frame_id" , x.frame_id |> string_to_json );
    ] |> assoc_filter_nulls

let uInt16_to_json x = [
    ( "uInt16_data" , x.uInt16_data |> uint16_to_json );
    ] |> assoc_filter_nulls

let uInt32_to_json x = [
    ( "uInt32_data" , x.uInt32_data |> uint32_to_json );
    ] |> assoc_filter_nulls

let std_time_to_json x = [
    ( "time_data" , x.time_data |> time_to_json );
    ] |> assoc_filter_nulls

let uInt8_to_json x = [
    ( "uInt8_data" , x.uInt8_data |> uint8_to_json );
    ] |> assoc_filter_nulls

let std_float32_to_json x = [
    ( "float32_data" , x.float32_data |> float32_to_json );
    ] |> assoc_filter_nulls

let std_duration_to_json x = [
    ( "duration_data" , x.duration_data |> duration_to_json );
    ] |> assoc_filter_nulls

let std_int64_to_json x = [
    ( "int64_data" , x.int64_data |> int64_to_json );
    ] |> assoc_filter_nulls

let empty_to_json x = `Assoc []

let uInt64_to_json x = [
    ( "uInt64_data" , x.uInt64_data |> uint64_to_json );
    ] |> assoc_filter_nulls

let std_string_to_json x = [
    ( "string_data" , x.string_data |> string_to_json );
    ] |> assoc_filter_nulls

let std_int16_to_json x = [
    ( "int16_data" , x.int16_data |> int16_to_json );
    ] |> assoc_filter_nulls

let std_int32_to_json x = [
    ( "int32_data" , x.int32_data |> int32_to_json );
    ] |> assoc_filter_nulls

let colorRGBA_to_json x = [
    ( "r" , x.r |> float32_to_json );
    ( "g" , x.g |> float32_to_json );
    ( "b" , x.b |> float32_to_json );
    ( "a" , x.a |> float32_to_json );
    ] |> assoc_filter_nulls

let std_char_to_json x = [
    ( "char_data" , x.char_data |> char_to_json );
    ] |> assoc_filter_nulls

let std_float64_to_json x = [
    ( "float64_data" , x.float64_data |> float64_to_json );
    ] |> assoc_filter_nulls

let std_byte_to_json x = [
    ( "byte_data" , x.byte_data |> byte_to_json );
    ] |> assoc_filter_nulls

let multiArrayDimension_to_json x = [
    ( "label" , x.label |> string_to_json );
    ( "size" , x.size |> uint32_to_json );
    ( "stride" , x.stride |> uint32_to_json );
    ] |> assoc_filter_nulls

let std_int8_to_json x = [
    ( "int8_data" , x.int8_data |> int8_to_json );
    ] |> assoc_filter_nulls

let multiArrayLayout_to_json x = [
    ( "dim" , x.dim |> (mklist multiArrayDimension_to_json) );
    ( "data_offset" , x.data_offset |> uint32_to_json );
    ] |> assoc_filter_nulls

let int16MultiArray_to_json x = [
    ( "int16MultiArray_layout" , x.int16MultiArray_layout |> multiArrayLayout_to_json );
    ( "int16MultiArray_data" , x.int16MultiArray_data |> (mklist int16_to_json) );
    ] |> assoc_filter_nulls

let int32MultiArray_to_json x = [
    ( "int32MultiArray_layout" , x.int32MultiArray_layout |> multiArrayLayout_to_json );
    ( "int32MultiArray_data" , x.int32MultiArray_data |> (mklist int32_to_json) );
    ] |> assoc_filter_nulls

let float64MultiArray_to_json x = [
    ( "float64MultiArray_layout" , x.float64MultiArray_layout |> multiArrayLayout_to_json );
    ( "float64MultiArray_data" , x.float64MultiArray_data |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let uInt64MultiArray_to_json x = [
    ( "uInt64MultiArray_layout" , x.uInt64MultiArray_layout |> multiArrayLayout_to_json );
    ( "uInt64MultiArray_data" , x.uInt64MultiArray_data |> (mklist uint64_to_json) );
    ] |> assoc_filter_nulls

let int64MultiArray_to_json x = [
    ( "int64MultiArray_layout" , x.int64MultiArray_layout |> multiArrayLayout_to_json );
    ( "int64MultiArray_data" , x.int64MultiArray_data |> (mklist int64_to_json) );
    ] |> assoc_filter_nulls

let uInt16MultiArray_to_json x = [
    ( "uInt16MultiArray_layout" , x.uInt16MultiArray_layout |> multiArrayLayout_to_json );
    ( "uInt16MultiArray_data" , x.uInt16MultiArray_data |> (mklist uint16_to_json) );
    ] |> assoc_filter_nulls

let float32MultiArray_to_json x = [
    ( "float32MultiArray_layout" , x.float32MultiArray_layout |> multiArrayLayout_to_json );
    ( "float32MultiArray_data" , x.float32MultiArray_data |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

let uInt32MultiArray_to_json x = [
    ( "uInt32MultiArray_layout" , x.uInt32MultiArray_layout |> multiArrayLayout_to_json );
    ( "uInt32MultiArray_data" , x.uInt32MultiArray_data |> (mklist uint32_to_json) );
    ] |> assoc_filter_nulls

let uInt8MultiArray_to_json x = [
    ( "uInt8MultiArray_layout" , x.uInt8MultiArray_layout |> multiArrayLayout_to_json );
    ( "uInt8MultiArray_data" , x.uInt8MultiArray_data |> (mklist uint8_to_json) );
    ] |> assoc_filter_nulls

let int8MultiArray_to_json x = [
    ( "int8MultiArray_layout" , x.int8MultiArray_layout |> multiArrayLayout_to_json );
    ( "int8MultiArray_data" , x.int8MultiArray_data |> (mklist int8_to_json) );
    ] |> assoc_filter_nulls

let byteMultiArray_to_json x = [
    ( "byteMultiArray_layout" , x.byteMultiArray_layout |> multiArrayLayout_to_json );
    ( "byteMultiArray_data" , x.byteMultiArray_data |> (mklist byte_to_json) );
    ] |> assoc_filter_nulls

