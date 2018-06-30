open Basic_types;;

type std_bool = {
   bool_data : bool ;
}

type header = {
   seq : uint32 ;
   stamp : time ;
   frame_id : string ;
}

type uInt16 = {
   uInt16_data : uint16 ;
}

type uInt32 = {
   uInt32_data : uint32 ;
}

type std_time = {
   time_data : time ;
}

type uInt8 = {
   uInt8_data : uint8 ;
}

type std_float32 = {
   float32_data : float32 ;
}

type std_duration = {
   duration_data : duration ;
}

type std_int64 = {
   int64_data : int64 ;
}

type empty = ()

type uInt64 = {
   uInt64_data : uint64 ;
}

type std_string = {
   string_data : string ;
}

type std_int16 = {
   int16_data : int16 ;
}

type std_int32 = {
   int32_data : int32 ;
}

type colorRGBA = {
   r : float32 ;
   g : float32 ;
   b : float32 ;
   a : float32 ;
}

type std_char = {
   char_data : char ;
}

type std_float64 = {
   float64_data : float64 ;
}

type std_byte = {
   byte_data : byte ;
}

type multiArrayDimension = {
   label : string ;
   size : uint32 ;
   stride : uint32 ;
}

type std_int8 = {
   int8_data : int8 ;
}

type multiArrayLayout = {
   dim : multiArrayDimension list ;
   data_offset : uint32 ;
}

type int16MultiArray = {
   int16MultiArray_layout : multiArrayLayout ;
   int16MultiArray_data : int16 list ;
}

type int32MultiArray = {
   int32MultiArray_layout : multiArrayLayout ;
   int32MultiArray_data : int32 list ;
}

type float64MultiArray = {
   float64MultiArray_layout : multiArrayLayout ;
   float64MultiArray_data : float64 list ;
}

type uInt64MultiArray = {
   uInt64MultiArray_layout : multiArrayLayout ;
   uInt64MultiArray_data : uint64 list ;
}

type int64MultiArray = {
   int64MultiArray_layout : multiArrayLayout ;
   int64MultiArray_data : int64 list ;
}

type uInt16MultiArray = {
   uInt16MultiArray_layout : multiArrayLayout ;
   uInt16MultiArray_data : uint16 list ;
}

type float32MultiArray = {
   float32MultiArray_layout : multiArrayLayout ;
   float32MultiArray_data : float32 list ;
}

type uInt32MultiArray = {
   uInt32MultiArray_layout : multiArrayLayout ;
   uInt32MultiArray_data : uint32 list ;
}

type uInt8MultiArray = {
   uInt8MultiArray_layout : multiArrayLayout ;
   uInt8MultiArray_data : uint8 list ;
}

type int8MultiArray = {
   int8MultiArray_layout : multiArrayLayout ;
   int8MultiArray_data : int8 list ;
}

type byteMultiArray = {
   byteMultiArray_layout : multiArrayLayout ;
   byteMultiArray_data : byte list ;
}

