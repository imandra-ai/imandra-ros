open Basic_types;;

type char = {
   data : char ;
}

type header = {
   seq : uint32 ;
   stamp : time ;
   frame_id : string ;
}

type uInt16 = {
   data : uint16 ;
}

type duration = {
   data : duration ;
}

type uInt32 = {
   data : uint32 ;
}

type uInt8 = {
   data : uint8 ;
}

type bool = {
   data : bool ;
}

type float32 = {
   data : float32 ;
}

type uInt64 = {
   data : uint64 ;
}

type int32 = {
   data : int32 ;
}

type int16 = {
   data : int16 ;
}

type string = {
   data : string ;
}

type colorRGBA = {
   r : float32 ;
   g : float32 ;
   b : float32 ;
   a : float32 ;
}

type byte = {
   data : byte ;
}

type int8 = {
   data : int8 ;
}

type float64 = {
   data : float64 ;
}

type multiArrayDimension = {
   label : string ;
   size : uint32 ;
   stride : uint32 ;
}

type int64 = {
   data : int64 ;
}

type empty = ()

type time = {
   data : time ;
}

type multiArrayLayout = {
   dim : multiArrayDimension list ;
   data_offset : uint32 ;
}

type int32MultiArray = {
   layout : multiArrayLayout ;
   data : int32 list ;
}

type int16MultiArray = {
   layout : multiArrayLayout ;
   data : int16 list ;
}

type float64MultiArray = {
   layout : multiArrayLayout ;
   data : float64 list ;
}

type uInt64MultiArray = {
   layout : multiArrayLayout ;
   data : uint64 list ;
}

type int64MultiArray = {
   layout : multiArrayLayout ;
   data : int64 list ;
}

type uInt16MultiArray = {
   layout : multiArrayLayout ;
   data : uint16 list ;
}

type float32MultiArray = {
   layout : multiArrayLayout ;
   data : float32 list ;
}

type uInt32MultiArray = {
   layout : multiArrayLayout ;
   data : uint32 list ;
}

type uInt8MultiArray = {
   layout : multiArrayLayout ;
   data : uint8 list ;
}

type int8MultiArray = {
   layout : multiArrayLayout ;
   data : int8 list ;
}

type byteMultiArray = {
   layout : multiArrayLayout ;
   data : byte list ;
}

