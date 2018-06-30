open Basic_types;;

type joyFeedback = {
   ros_type : uint8 ;
   id : uint8 ;
   intensity : float32 ;
}

type image = {
   image_header : Std_msgs.header ;
   image_height : uint32 ;
   image_width : uint32 ;
   image_encoding : string ;
   image_is_bigendian : uint8 ;
   image_step : uint32 ;
   image_data : uint8 list ;
}

type magneticField = {
   magneticField_header : Std_msgs.header ;
   magneticField_magnetic_field : Geometry_msgs.vector3 ;
   magneticField_magnetic_field_covariance : float64 list ;
}

type pointField = {
   pointField_name : string ;
   pointField_offset : uint32 ;
   pointField_datatype : uint8 ;
   pointField_count : uint32 ;
}

type laserScan = {
   laserScan_header : Std_msgs.header ;
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
   jointState_header : Std_msgs.header ;
   jointState_name : string list ;
   jointState_position : float64 list ;
   jointState_velocity : float64 list ;
   jointState_effort : float64 list ;
}

type batteryState = {
   batteryState_header : Std_msgs.header ;
   batteryState_voltage : float32 ;
   batteryState_current : float32 ;
   batteryState_charge : float32 ;
   batteryState_capacity : float32 ;
   batteryState_design_capacity : float32 ;
   batteryState_percentage : float32 ;
   batteryState_power_supply_status : uint8 ;
   batteryState_power_supply_health : uint8 ;
   batteryState_power_supply_technology : uint8 ;
   batteryState_present : bool ;
   batteryState_cell_voltage : float32 list ;
   batteryState_location : string ;
   batteryState_serial_number : string ;
}

type compressedImage = {
   compressedImage_header : Std_msgs.header ;
   compressedImage_format : string ;
   compressedImage_data : uint8 list ;
}

type temperature = {
   temperature_header : Std_msgs.header ;
   temperature_temperature : float64 ;
   temperature_variance : float64 ;
}

type fluidPressure = {
   fluidPressure_header : Std_msgs.header ;
   fluidPressure_fluid_pressure : float64 ;
   fluidPressure_variance : float64 ;
}

type range = {
   range_header : Std_msgs.header ;
   range_radiation_type : uint8 ;
   range_field_of_view : float32 ;
   range_min_range : float32 ;
   range_max_range : float32 ;
   range_range : float32 ;
}

type laserEcho = {
   echoes : float32 list ;
}

type illuminance = {
   illuminance_header : Std_msgs.header ;
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
   imu_header : Std_msgs.header ;
   imu_orientation : Geometry_msgs.quaternion ;
   imu_orientation_covariance : float64 list ;
   imu_angular_velocity : Geometry_msgs.vector3 ;
   imu_angular_velocity_covariance : float64 list ;
   imu_linear_acceleration : Geometry_msgs.vector3 ;
   imu_linear_acceleration_covariance : float64 list ;
}

type relativeHumidity = {
   relativeHumidity_header : Std_msgs.header ;
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
   joy_header : Std_msgs.header ;
   joy_axes : float32 list ;
   joy_buttons : int32 list ;
}

type timeReference = {
   timeReference_header : Std_msgs.header ;
   timeReference_time_ref : time ;
   timeReference_source : string ;
}

type pointCloud2 = {
   pointCloud2_header : Std_msgs.header ;
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
   multiDOFJointState_header : Std_msgs.header ;
   multiDOFJointState_joint_names : string list ;
   multiDOFJointState_transforms : Geometry_msgs.transform list ;
   multiDOFJointState_twist : Geometry_msgs.twist list ;
   multiDOFJointState_wrench : Geometry_msgs.wrench list ;
}

type cameraInfo = {
   cameraInfo_header : Std_msgs.header ;
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
   multiEchoLaserScan_header : Std_msgs.header ;
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
   pointCloud_header : Std_msgs.header ;
   pointCloud_points : Geometry_msgs.point32 list ;
   pointCloud_channels : channelFloat32 list ;
}

type navSatFix = {
   navSatFix_header : Std_msgs.header ;
   navSatFix_status : navSatStatus ;
   navSatFix_latitude : float64 ;
   navSatFix_longitude : float64 ;
   navSatFix_altitude : float64 ;
   navSatFix_position_covariance : float64 list ;
   navSatFix_position_covariance_type : uint8 ;
}

