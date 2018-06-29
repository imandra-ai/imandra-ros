open Basic_types;;

type joyFeedback = {
   ros_type : uint8 ;
   id : uint8 ;
   intensity : float32 ;
}

type image = {
   height : uint32 ;
   width : uint32 ;
   encoding : string ;
   is_bigendian : uint8 ;
   step : uint32 ;
   data : uint8 list ;
}

type magneticField = {
   magnetic_field : Geometry_msgs.vector3 ;
   magnetic_field_covariance : float64 list ;
}

type pointField = {
   name : string ;
   offset : uint32 ;
   datatype : uint8 ;
   count : uint32 ;
}

type laserScan = {
   angle_min : float32 ;
   angle_max : float32 ;
   angle_increment : float32 ;
   time_increment : float32 ;
   scan_time : float32 ;
   range_min : float32 ;
   range_max : float32 ;
   ranges : float32 list ;
   intensities : float32 list ;
}

type jointState = {
   name : string list ;
   position : float64 list ;
   velocity : float64 list ;
   effort : float64 list ;
}

type batteryState = {
   voltage : float32 ;
   current : float32 ;
   charge : float32 ;
   capacity : float32 ;
   design_capacity : float32 ;
   percentage : float32 ;
   power_supply_status : uint8 ;
   power_supply_health : uint8 ;
   power_supply_technology : uint8 ;
   present : bool ;
   cell_voltage : float32 list ;
   location : string ;
   serial_number : string ;
}

type compressedImage = {
   format : string ;
   data : uint8 list ;
}

type temperature = {
   temperature : float64 ;
   variance : float64 ;
}

type fluidPressure = {
   fluid_pressure : float64 ;
   variance : float64 ;
}

type range = {
   radiation_type : uint8 ;
   field_of_view : float32 ;
   min_range : float32 ;
   max_range : float32 ;
   range : float32 ;
}

type laserEcho = {
   echoes : float32 list ;
}

type illuminance = {
   illuminance : float64 ;
   variance : float64 ;
}

type regionOfInterest = {
   x_offset : uint32 ;
   y_offset : uint32 ;
   height : uint32 ;
   width : uint32 ;
   do_rectify : bool ;
}

type joyFeedbackArray = {
   array : joyFeedback list ;
}

type imu = {
   orientation : Geometry_msgs.quaternion ;
   orientation_covariance : float64 list ;
   angular_velocity : Geometry_msgs.vector3 ;
   angular_velocity_covariance : float64 list ;
   linear_acceleration : Geometry_msgs.vector3 ;
   linear_acceleration_covariance : float64 list ;
}

type relativeHumidity = {
   relative_humidity : float64 ;
   variance : float64 ;
}

type navSatStatus = {
   status : int8 ;
   service : uint16 ;
}

type channelFloat32 = {
   name : string ;
   values : float32 list ;
}

type joy = {
   axes : float32 list ;
   buttons : int32 list ;
}

type timeReference = {
   time_ref : time ;
   source : string ;
}

type pointCloud2 = {
   height : uint32 ;
   width : uint32 ;
   fields : pointField list ;
   is_bigendian : bool ;
   point_step : uint32 ;
   row_step : uint32 ;
   data : uint8 list ;
   is_dense : bool ;
}

type multiDOFJointState = {
   joint_names : string list ;
   transforms : Geometry_msgs.transform list ;
   twist : Geometry_msgs.twist list ;
   wrench : Geometry_msgs.wrench list ;
}

type cameraInfo = {
   height : uint32 ;
   width : uint32 ;
   distortion_model : string ;
   d : float64 list ;
   k : float64 list ;
   r : float64 list ;
   p : float64 list ;
   binning_x : uint32 ;
   binning_y : uint32 ;
   roi : regionOfInterest ;
}

type multiEchoLaserScan = {
   angle_min : float32 ;
   angle_max : float32 ;
   angle_increment : float32 ;
   time_increment : float32 ;
   scan_time : float32 ;
   range_min : float32 ;
   range_max : float32 ;
   ranges : laserEcho list ;
   intensities : laserEcho list ;
}

type pointCloud = {
   points : Geometry_msgs.point32 list ;
   channels : channelFloat32 list ;
}

type navSatFix = {
   status : navSatStatus ;
   latitude : float64 ;
   longitude : float64 ;
   altitude : float64 ;
   position_covariance : float64 list ;
   position_covariance_type : uint8 ;
}

