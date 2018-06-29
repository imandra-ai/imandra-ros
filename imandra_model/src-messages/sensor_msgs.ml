open Basic_types;;

type joyFeedback = {
   ros_type : uint8 ;
   id : uint8 ;
   intensity : float32 ;
}

type image = {
   image_height : uint32 ;
   image_width : uint32 ;
   image_encoding : string ;
   image_is_bigendian : uint8 ;
   image_step : uint32 ;
   image_data : uint8 list ;
}

type magneticField = {
   magnetic_field : Geometry_msgs.vector3 ;
   magnetic_field_covariance : float64 list ;
}

type pointField = {
   pointField_name : string ;
   pointField_offset : uint32 ;
   pointField_datatype : uint8 ;
   pointField_count : uint32 ;
}

type laserScan = {
   laserScan_angle_min : float32 ;
   laserScan_angle_max : float32 ;
   laserScan_angle_increment : float32 ;
   laserScan_time_increment : float32 ;
   laserScan_scan_time : float32 ;
   laserScan_range_min : float32 ;
   laserScan_range_max : float32 ;
   laserScan_ranges : float32 list ;
   laserScan_intensities : float32 list ;
}

type jointState = {
   jointState_name : string list ;
   jointState_position : float64 list ;
   jointState_velocity : float64 list ;
   jointState_effort : float64 list ;
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
   compressedImage_format : string ;
   compressedImage_data : uint8 list ;
}

type temperature = {
   temperature_temperature : float64 ;
   temperature_variance : float64 ;
}

type fluidPressure = {
   fluidPressure_fluid_pressure : float64 ;
   fluidPressure_variance : float64 ;
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
   illuminance_illuminance : float64 ;
   illuminance_variance : float64 ;
}

type regionOfInterest = {
   regionOfInterest_x_offset : uint32 ;
   regionOfInterest_y_offset : uint32 ;
   regionOfInterest_height : uint32 ;
   regionOfInterest_width : uint32 ;
   regionOfInterest_do_rectify : bool ;
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
   relativeHumidity_relative_humidity : float64 ;
   relativeHumidity_variance : float64 ;
}

type navSatStatus = {
   navSatStatus_status : int8 ;
   navSatStatus_service : uint16 ;
}

type channelFloat32 = {
   channelFloat32_name : string ;
   channelFloat32_values : float32 list ;
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
   pointCloud2_height : uint32 ;
   pointCloud2_width : uint32 ;
   pointCloud2_fields : pointField list ;
   pointCloud2_is_bigendian : bool ;
   pointCloud2_point_step : uint32 ;
   pointCloud2_row_step : uint32 ;
   pointCloud2_data : uint8 list ;
   pointCloud2_is_dense : bool ;
}

type multiDOFJointState = {
   joint_names : string list ;
   transforms : Geometry_msgs.transform list ;
   twist : Geometry_msgs.twist list ;
   wrench : Geometry_msgs.wrench list ;
}

type cameraInfo = {
   cameraInfo_height : uint32 ;
   cameraInfo_width : uint32 ;
   cameraInfo_distortion_model : string ;
   cameraInfo_d : float64 list ;
   cameraInfo_k : float64 list ;
   cameraInfo_r : float64 list ;
   cameraInfo_p : float64 list ;
   cameraInfo_binning_x : uint32 ;
   cameraInfo_binning_y : uint32 ;
   cameraInfo_roi : regionOfInterest ;
}

type multiEchoLaserScan = {
   multiEchoLaserScan_angle_min : float32 ;
   multiEchoLaserScan_angle_max : float32 ;
   multiEchoLaserScan_angle_increment : float32 ;
   multiEchoLaserScan_time_increment : float32 ;
   multiEchoLaserScan_scan_time : float32 ;
   multiEchoLaserScan_range_min : float32 ;
   multiEchoLaserScan_range_max : float32 ;
   multiEchoLaserScan_ranges : laserEcho list ;
   multiEchoLaserScan_intensities : laserEcho list ;
}

type pointCloud = {
   points : Geometry_msgs.point32 list ;
   channels : channelFloat32 list ;
}

type navSatFix = {
   navSatFix_status : navSatStatus ;
   navSatFix_latitude : float64 ;
   navSatFix_longitude : float64 ;
   navSatFix_altitude : float64 ;
   navSatFix_position_covariance : float64 list ;
   navSatFix_position_covariance_type : uint8 ;
}

