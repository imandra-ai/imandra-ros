open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Std_msgs;;

let json_to_char_opt json = 
    jreq json "char_data" json_to_char_opt @@ fun char_data ->
    Some {
    char_data;
    }

let json_to_header_opt json = 
    jreq json "seq" json_to_uint32_opt @@ fun seq ->
    jreq json "stamp" json_to_time_opt @@ fun stamp ->
    jreq json "frame_id" json_to_string_opt @@ fun frame_id ->
    Some {
    seq;
    stamp;
    frame_id;
    }

let json_to_uInt16_opt json = 
    jreq json "uInt16_data" json_to_uint16_opt @@ fun uInt16_data ->
    Some {
    uInt16_data;
    }

let json_to_duration_opt json = 
    jreq json "duration_data" json_to_duration_opt @@ fun duration_data ->
    Some {
    duration_data;
    }

let json_to_uInt32_opt json = 
    jreq json "uInt32_data" json_to_uint32_opt @@ fun uInt32_data ->
    Some {
    uInt32_data;
    }

let json_to_uInt8_opt json = 
    jreq json "uInt8_data" json_to_uint8_opt @@ fun uInt8_data ->
    Some {
    uInt8_data;
    }

let json_to_bool_opt json = 
    jreq json "bool_data" json_to_bool_opt @@ fun bool_data ->
    Some {
    bool_data;
    }

let json_to_float32_opt json = 
    jreq json "float32_data" json_to_float32_opt @@ fun float32_data ->
    Some {
    float32_data;
    }

let json_to_uInt64_opt json = 
    jreq json "uInt64_data" json_to_uint64_opt @@ fun uInt64_data ->
    Some {
    uInt64_data;
    }

let json_to_int32_opt json = 
    jreq json "int32_data" json_to_int32_opt @@ fun int32_data ->
    Some {
    int32_data;
    }

let json_to_int16_opt json = 
    jreq json "int16_data" json_to_int16_opt @@ fun int16_data ->
    Some {
    int16_data;
    }

let json_to_string_opt json = 
    jreq json "string_data" json_to_string_opt @@ fun string_data ->
    Some {
    string_data;
    }

let json_to_colorRGBA_opt json = 
    jreq json "r" json_to_float32_opt @@ fun r ->
    jreq json "g" json_to_float32_opt @@ fun g ->
    jreq json "b" json_to_float32_opt @@ fun b ->
    jreq json "a" json_to_float32_opt @@ fun a ->
    Some {
    r;
    g;
    b;
    a;
    }

let json_to_byte_opt json = 
    jreq json "byte_data" json_to_byte_opt @@ fun byte_data ->
    Some {
    byte_data;
    }

let json_to_int8_opt json = 
    jreq json "int8_data" json_to_int8_opt @@ fun int8_data ->
    Some {
    int8_data;
    }

let json_to_float64_opt json = 
    jreq json "float64_data" json_to_float64_opt @@ fun float64_data ->
    Some {
    float64_data;
    }

let json_to_multiArrayDimension_opt json = 
    jreq json "label" json_to_string_opt @@ fun label ->
    jreq json "size" json_to_uint32_opt @@ fun size ->
    jreq json "stride" json_to_uint32_opt @@ fun stride ->
    Some {
    label;
    size;
    stride;
    }

let json_to_int64_opt json = 
    jreq json "int64_data" json_to_int64_opt @@ fun int64_data ->
    Some {
    int64_data;
    }

let json_to_empty_opt json : empty option = Some ()

let json_to_time_opt json = 
    jreq json "time_data" json_to_time_opt @@ fun time_data ->
    Some {
    time_data;
    }

let json_to_multiArrayLayout_opt json = 
    jreq json "dim" (jlist json_to_multiArrayDimension_opt) @@ fun dim ->
    jreq json "data_offset" json_to_uint32_opt @@ fun data_offset ->
    Some {
    dim;
    data_offset;
    }

let json_to_int32MultiArray_opt json = 
    jreq json "int32MultiArray_layout" json_to_multiArrayLayout_opt @@ fun int32MultiArray_layout ->
    jreq json "int32MultiArray_data" (jlist json_to_int32_opt) @@ fun int32MultiArray_data ->
    Some {
    int32MultiArray_layout;
    int32MultiArray_data;
    }

let json_to_int16MultiArray_opt json = 
    jreq json "int16MultiArray_layout" json_to_multiArrayLayout_opt @@ fun int16MultiArray_layout ->
    jreq json "int16MultiArray_data" (jlist json_to_int16_opt) @@ fun int16MultiArray_data ->
    Some {
    int16MultiArray_layout;
    int16MultiArray_data;
    }

let json_to_float64MultiArray_opt json = 
    jreq json "float64MultiArray_layout" json_to_multiArrayLayout_opt @@ fun float64MultiArray_layout ->
    jreq json "float64MultiArray_data" (jlist json_to_float64_opt) @@ fun float64MultiArray_data ->
    Some {
    float64MultiArray_layout;
    float64MultiArray_data;
    }

let json_to_uInt64MultiArray_opt json = 
    jreq json "uInt64MultiArray_layout" json_to_multiArrayLayout_opt @@ fun uInt64MultiArray_layout ->
    jreq json "uInt64MultiArray_data" (jlist json_to_uint64_opt) @@ fun uInt64MultiArray_data ->
    Some {
    uInt64MultiArray_layout;
    uInt64MultiArray_data;
    }

let json_to_int64MultiArray_opt json = 
    jreq json "int64MultiArray_layout" json_to_multiArrayLayout_opt @@ fun int64MultiArray_layout ->
    jreq json "int64MultiArray_data" (jlist json_to_int64_opt) @@ fun int64MultiArray_data ->
    Some {
    int64MultiArray_layout;
    int64MultiArray_data;
    }

let json_to_uInt16MultiArray_opt json = 
    jreq json "uInt16MultiArray_layout" json_to_multiArrayLayout_opt @@ fun uInt16MultiArray_layout ->
    jreq json "uInt16MultiArray_data" (jlist json_to_uint16_opt) @@ fun uInt16MultiArray_data ->
    Some {
    uInt16MultiArray_layout;
    uInt16MultiArray_data;
    }

let json_to_float32MultiArray_opt json = 
    jreq json "float32MultiArray_layout" json_to_multiArrayLayout_opt @@ fun float32MultiArray_layout ->
    jreq json "float32MultiArray_data" (jlist json_to_float32_opt) @@ fun float32MultiArray_data ->
    Some {
    float32MultiArray_layout;
    float32MultiArray_data;
    }

let json_to_uInt32MultiArray_opt json = 
    jreq json "uInt32MultiArray_layout" json_to_multiArrayLayout_opt @@ fun uInt32MultiArray_layout ->
    jreq json "uInt32MultiArray_data" (jlist json_to_uint32_opt) @@ fun uInt32MultiArray_data ->
    Some {
    uInt32MultiArray_layout;
    uInt32MultiArray_data;
    }

let json_to_uInt8MultiArray_opt json = 
    jreq json "uInt8MultiArray_layout" json_to_multiArrayLayout_opt @@ fun uInt8MultiArray_layout ->
    jreq json "uInt8MultiArray_data" (jlist json_to_uint8_opt) @@ fun uInt8MultiArray_data ->
    Some {
    uInt8MultiArray_layout;
    uInt8MultiArray_data;
    }

let json_to_int8MultiArray_opt json = 
    jreq json "int8MultiArray_layout" json_to_multiArrayLayout_opt @@ fun int8MultiArray_layout ->
    jreq json "int8MultiArray_data" (jlist json_to_int8_opt) @@ fun int8MultiArray_data ->
    Some {
    int8MultiArray_layout;
    int8MultiArray_data;
    }

let json_to_byteMultiArray_opt json = 
    jreq json "byteMultiArray_layout" json_to_multiArrayLayout_opt @@ fun byteMultiArray_layout ->
    jreq json "byteMultiArray_data" (jlist json_to_byte_opt) @@ fun byteMultiArray_data ->
    Some {
    byteMultiArray_layout;
    byteMultiArray_data;
    }

