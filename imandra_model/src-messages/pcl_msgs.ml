open Basic_types;;

type modelCoefficients = {
   values : float32 list ;
}

type pointIndices = {
   indices : int32 list ;
}

type vertices = {
   vertices : uint32 list ;
}

type polygonMesh = {
   cloud : Sensor_msgs.pointCloud2 ;
   polygons : vertices list ;
}

