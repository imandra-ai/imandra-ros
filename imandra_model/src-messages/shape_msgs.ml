open Basic_types;;

type solidPrimitive = {
   ros_type : uint8 ;
   dimensions : float64 list ;
}

type meshTriangle = {
   vertex_indices : uint32 list ;
}

type plane = {
   coef : float64 list ;
}

type mesh = {
   triangles : meshTriangle list ;
   vertices : Geometry_msgs.point list ;
}

