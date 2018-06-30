open Basic_types;;

type modelCoefficients = {
   modelCoefficients_header : Std_msgs.header ;
   modelCoefficients_values : float32 list ;
}

type pointIndices = {
   pointIndices_header : Std_msgs.header ;
   pointIndices_indices : int32 list ;
}

type vertices = {
   vertices : uint32 list ;
}

type polygonMesh = {
   polygonMesh_header : Std_msgs.header ;
   polygonMesh_cloud : Sensor_msgs.pointCloud2 ;
   polygonMesh_polygons : vertices list ;
}

