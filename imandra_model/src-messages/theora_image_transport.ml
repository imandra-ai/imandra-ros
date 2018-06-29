open Basic_types;;

type packet = {
   data : uint8 list ;
   b_o_s : int32 ;
   e_o_s : int32 ;
   granulepos : int64 ;
   packetno : int64 ;
}

