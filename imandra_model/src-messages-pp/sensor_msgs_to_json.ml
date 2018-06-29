open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Sensor_msgs;;

let joyFeedback_to_json x = [
    ( "ros_type" , x.ros_type |> uint8_to_json );
    ( "id" , x.id |> uint8_to_json );
    ( "intensity" , x.intensity |> float32_to_json );
    ] |> assoc_filter_nulls

let image_to_json x = [
    ( "image_height" , x.image_height |> uint32_to_json );
    ( "image_width" , x.image_width |> uint32_to_json );
    ( "image_encoding" , x.image_encoding |> string_to_json );
    ( "image_is_bigendian" , x.image_is_bigendian |> uint8_to_json );
    ( "image_step" , x.image_step |> uint32_to_json );
    ( "image_data" , x.image_data |> (mklist uint8_to_json) );
    ] |> assoc_filter_nulls

let magneticField_to_json x = [
    ( "magnetic_field" , x.magnetic_field |> Geometry_msgs_to_json.vector3_to_json );
    ( "magnetic_field_covariance" , x.magnetic_field_covariance |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let pointField_to_json x = [
    ( "pointField_name" , x.pointField_name |> string_to_json );
    ( "pointField_offset" , x.pointField_offset |> uint32_to_json );
    ( "pointField_datatype" , x.pointField_datatype |> uint8_to_json );
    ( "pointField_count" , x.pointField_count |> uint32_to_json );
    ] |> assoc_filter_nulls

let laserScan_to_json x = [
    ( "laserScan_angle_min" , x.laserScan_angle_min |> float32_to_json );
    ( "laserScan_angle_max" , x.laserScan_angle_max |> float32_to_json );
    ( "laserScan_angle_increment" , x.laserScan_angle_increment |> float32_to_json );
    ( "laserScan_time_increment" , x.laserScan_time_increment |> float32_to_json );
    ( "laserScan_scan_time" , x.laserScan_scan_time |> float32_to_json );
    ( "laserScan_range_min" , x.laserScan_range_min |> float32_to_json );
    ( "laserScan_range_max" , x.laserScan_range_max |> float32_to_json );
    ( "laserScan_ranges" , x.laserScan_ranges |> (mklist float32_to_json) );
    ( "laserScan_intensities" , x.laserScan_intensities |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

let jointState_to_json x = [
    ( "jointState_name" , x.jointState_name |> (mklist string_to_json) );
    ( "jointState_position" , x.jointState_position |> (mklist float64_to_json) );
    ( "jointState_velocity" , x.jointState_velocity |> (mklist float64_to_json) );
    ( "jointState_effort" , x.jointState_effort |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let batteryState_to_json x = [
    ( "voltage" , x.voltage |> float32_to_json );
    ( "current" , x.current |> float32_to_json );
    ( "charge" , x.charge |> float32_to_json );
    ( "capacity" , x.capacity |> float32_to_json );
    ( "design_capacity" , x.design_capacity |> float32_to_json );
    ( "percentage" , x.percentage |> float32_to_json );
    ( "power_supply_status" , x.power_supply_status |> uint8_to_json );
    ( "power_supply_health" , x.power_supply_health |> uint8_to_json );
    ( "power_supply_technology" , x.power_supply_technology |> uint8_to_json );
    ( "present" , x.present |> bool_to_json );
    ( "cell_voltage" , x.cell_voltage |> (mklist float32_to_json) );
    ( "location" , x.location |> string_to_json );
    ( "serial_number" , x.serial_number |> string_to_json );
    ] |> assoc_filter_nulls

let compressedImage_to_json x = [
    ( "compressedImage_format" , x.compressedImage_format |> string_to_json );
    ( "compressedImage_data" , x.compressedImage_data |> (mklist uint8_to_json) );
    ] |> assoc_filter_nulls

let temperature_to_json x = [
    ( "temperature_temperature" , x.temperature_temperature |> float64_to_json );
    ( "temperature_variance" , x.temperature_variance |> float64_to_json );
    ] |> assoc_filter_nulls

let fluidPressure_to_json x = [
    ( "fluidPressure_fluid_pressure" , x.fluidPressure_fluid_pressure |> float64_to_json );
    ( "fluidPressure_variance" , x.fluidPressure_variance |> float64_to_json );
    ] |> assoc_filter_nulls

let range_to_json x = [
    ( "radiation_type" , x.radiation_type |> uint8_to_json );
    ( "field_of_view" , x.field_of_view |> float32_to_json );
    ( "min_range" , x.min_range |> float32_to_json );
    ( "max_range" , x.max_range |> float32_to_json );
    ( "range" , x.range |> float32_to_json );
    ] |> assoc_filter_nulls

let laserEcho_to_json x = [
    ( "echoes" , x.echoes |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

let illuminance_to_json x = [
    ( "illuminance_illuminance" , x.illuminance_illuminance |> float64_to_json );
    ( "illuminance_variance" , x.illuminance_variance |> float64_to_json );
    ] |> assoc_filter_nulls

let regionOfInterest_to_json x = [
    ( "regionOfInterest_x_offset" , x.regionOfInterest_x_offset |> uint32_to_json );
    ( "regionOfInterest_y_offset" , x.regionOfInterest_y_offset |> uint32_to_json );
    ( "regionOfInterest_height" , x.regionOfInterest_height |> uint32_to_json );
    ( "regionOfInterest_width" , x.regionOfInterest_width |> uint32_to_json );
    ( "regionOfInterest_do_rectify" , x.regionOfInterest_do_rectify |> bool_to_json );
    ] |> assoc_filter_nulls

let joyFeedbackArray_to_json x = [
    ( "array" , x.array |> (mklist joyFeedback_to_json) );
    ] |> assoc_filter_nulls

let imu_to_json x = [
    ( "orientation" , x.orientation |> Geometry_msgs_to_json.quaternion_to_json );
    ( "orientation_covariance" , x.orientation_covariance |> (mklist float64_to_json) );
    ( "angular_velocity" , x.angular_velocity |> Geometry_msgs_to_json.vector3_to_json );
    ( "angular_velocity_covariance" , x.angular_velocity_covariance |> (mklist float64_to_json) );
    ( "linear_acceleration" , x.linear_acceleration |> Geometry_msgs_to_json.vector3_to_json );
    ( "linear_acceleration_covariance" , x.linear_acceleration_covariance |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let relativeHumidity_to_json x = [
    ( "relativeHumidity_relative_humidity" , x.relativeHumidity_relative_humidity |> float64_to_json );
    ( "relativeHumidity_variance" , x.relativeHumidity_variance |> float64_to_json );
    ] |> assoc_filter_nulls

let navSatStatus_to_json x = [
    ( "navSatStatus_status" , x.navSatStatus_status |> int8_to_json );
    ( "navSatStatus_service" , x.navSatStatus_service |> uint16_to_json );
    ] |> assoc_filter_nulls

let channelFloat32_to_json x = [
    ( "channelFloat32_name" , x.channelFloat32_name |> string_to_json );
    ( "channelFloat32_values" , x.channelFloat32_values |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

let joy_to_json x = [
    ( "axes" , x.axes |> (mklist float32_to_json) );
    ( "buttons" , x.buttons |> (mklist int32_to_json) );
    ] |> assoc_filter_nulls

let timeReference_to_json x = [
    ( "time_ref" , x.time_ref |> time_to_json );
    ( "source" , x.source |> string_to_json );
    ] |> assoc_filter_nulls

let pointCloud2_to_json x = [
    ( "pointCloud2_height" , x.pointCloud2_height |> uint32_to_json );
    ( "pointCloud2_width" , x.pointCloud2_width |> uint32_to_json );
    ( "pointCloud2_fields" , x.pointCloud2_fields |> (mklist pointField_to_json) );
    ( "pointCloud2_is_bigendian" , x.pointCloud2_is_bigendian |> bool_to_json );
    ( "pointCloud2_point_step" , x.pointCloud2_point_step |> uint32_to_json );
    ( "pointCloud2_row_step" , x.pointCloud2_row_step |> uint32_to_json );
    ( "pointCloud2_data" , x.pointCloud2_data |> (mklist uint8_to_json) );
    ( "pointCloud2_is_dense" , x.pointCloud2_is_dense |> bool_to_json );
    ] |> assoc_filter_nulls

let multiDOFJointState_to_json x = [
    ( "joint_names" , x.joint_names |> (mklist string_to_json) );
    ( "transforms" , x.transforms |> (mklist Geometry_msgs_to_json.transform_to_json) );
    ( "twist" , x.twist |> (mklist Geometry_msgs_to_json.twist_to_json) );
    ( "wrench" , x.wrench |> (mklist Geometry_msgs_to_json.wrench_to_json) );
    ] |> assoc_filter_nulls

let cameraInfo_to_json x = [
    ( "cameraInfo_height" , x.cameraInfo_height |> uint32_to_json );
    ( "cameraInfo_width" , x.cameraInfo_width |> uint32_to_json );
    ( "cameraInfo_distortion_model" , x.cameraInfo_distortion_model |> string_to_json );
    ( "cameraInfo_d" , x.cameraInfo_d |> (mklist float64_to_json) );
    ( "cameraInfo_k" , x.cameraInfo_k |> (mklist float64_to_json) );
    ( "cameraInfo_r" , x.cameraInfo_r |> (mklist float64_to_json) );
    ( "cameraInfo_p" , x.cameraInfo_p |> (mklist float64_to_json) );
    ( "cameraInfo_binning_x" , x.cameraInfo_binning_x |> uint32_to_json );
    ( "cameraInfo_binning_y" , x.cameraInfo_binning_y |> uint32_to_json );
    ( "cameraInfo_roi" , x.cameraInfo_roi |> regionOfInterest_to_json );
    ] |> assoc_filter_nulls

let multiEchoLaserScan_to_json x = [
    ( "multiEchoLaserScan_angle_min" , x.multiEchoLaserScan_angle_min |> float32_to_json );
    ( "multiEchoLaserScan_angle_max" , x.multiEchoLaserScan_angle_max |> float32_to_json );
    ( "multiEchoLaserScan_angle_increment" , x.multiEchoLaserScan_angle_increment |> float32_to_json );
    ( "multiEchoLaserScan_time_increment" , x.multiEchoLaserScan_time_increment |> float32_to_json );
    ( "multiEchoLaserScan_scan_time" , x.multiEchoLaserScan_scan_time |> float32_to_json );
    ( "multiEchoLaserScan_range_min" , x.multiEchoLaserScan_range_min |> float32_to_json );
    ( "multiEchoLaserScan_range_max" , x.multiEchoLaserScan_range_max |> float32_to_json );
    ( "multiEchoLaserScan_ranges" , x.multiEchoLaserScan_ranges |> (mklist laserEcho_to_json) );
    ( "multiEchoLaserScan_intensities" , x.multiEchoLaserScan_intensities |> (mklist laserEcho_to_json) );
    ] |> assoc_filter_nulls

let pointCloud_to_json x = [
    ( "points" , x.points |> (mklist Geometry_msgs_to_json.point32_to_json) );
    ( "channels" , x.channels |> (mklist channelFloat32_to_json) );
    ] |> assoc_filter_nulls

let navSatFix_to_json x = [
    ( "navSatFix_status" , x.navSatFix_status |> navSatStatus_to_json );
    ( "navSatFix_latitude" , x.navSatFix_latitude |> float64_to_json );
    ( "navSatFix_longitude" , x.navSatFix_longitude |> float64_to_json );
    ( "navSatFix_altitude" , x.navSatFix_altitude |> float64_to_json );
    ( "navSatFix_position_covariance" , x.navSatFix_position_covariance |> (mklist float64_to_json) );
    ( "navSatFix_position_covariance_type" , x.navSatFix_position_covariance_type |> uint8_to_json );
    ] |> assoc_filter_nulls

