open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Sensor_msgs;;

let json_to_joyFeedback_opt json = 
    jreq json "ros_type" json_to_uint8_opt @@ fun ros_type ->
    jreq json "id" json_to_uint8_opt @@ fun id ->
    jreq json "intensity" json_to_float32_opt @@ fun intensity ->
    Some {
    ros_type;
    id;
    intensity;
    }

let json_to_image_opt json = 
    jreq json "image_height" json_to_uint32_opt @@ fun image_height ->
    jreq json "image_width" json_to_uint32_opt @@ fun image_width ->
    jreq json "image_encoding" json_to_string_opt @@ fun image_encoding ->
    jreq json "image_is_bigendian" json_to_uint8_opt @@ fun image_is_bigendian ->
    jreq json "image_step" json_to_uint32_opt @@ fun image_step ->
    jreq json "image_data" (jlist json_to_uint8_opt) @@ fun image_data ->
    Some {
    image_height;
    image_width;
    image_encoding;
    image_is_bigendian;
    image_step;
    image_data;
    }

let json_to_magneticField_opt json = 
    jreq json "magnetic_field" Geometry_msgs_of_json.json_to_vector3_opt @@ fun magnetic_field ->
    jreq json "magnetic_field_covariance" (jlist json_to_float64_opt) @@ fun magnetic_field_covariance ->
    Some {
    magnetic_field;
    magnetic_field_covariance;
    }

let json_to_pointField_opt json = 
    jreq json "pointField_name" json_to_string_opt @@ fun pointField_name ->
    jreq json "pointField_offset" json_to_uint32_opt @@ fun pointField_offset ->
    jreq json "pointField_datatype" json_to_uint8_opt @@ fun pointField_datatype ->
    jreq json "pointField_count" json_to_uint32_opt @@ fun pointField_count ->
    Some {
    pointField_name;
    pointField_offset;
    pointField_datatype;
    pointField_count;
    }

let json_to_laserScan_opt json = 
    jreq json "laserScan_angle_min" json_to_float32_opt @@ fun laserScan_angle_min ->
    jreq json "laserScan_angle_max" json_to_float32_opt @@ fun laserScan_angle_max ->
    jreq json "laserScan_angle_increment" json_to_float32_opt @@ fun laserScan_angle_increment ->
    jreq json "laserScan_time_increment" json_to_float32_opt @@ fun laserScan_time_increment ->
    jreq json "laserScan_scan_time" json_to_float32_opt @@ fun laserScan_scan_time ->
    jreq json "laserScan_range_min" json_to_float32_opt @@ fun laserScan_range_min ->
    jreq json "laserScan_range_max" json_to_float32_opt @@ fun laserScan_range_max ->
    jreq json "laserScan_ranges" (jlist json_to_float32_opt) @@ fun laserScan_ranges ->
    jreq json "laserScan_intensities" (jlist json_to_float32_opt) @@ fun laserScan_intensities ->
    Some {
    laserScan_angle_min;
    laserScan_angle_max;
    laserScan_angle_increment;
    laserScan_time_increment;
    laserScan_scan_time;
    laserScan_range_min;
    laserScan_range_max;
    laserScan_ranges;
    laserScan_intensities;
    }

let json_to_jointState_opt json = 
    jreq json "jointState_name" (jlist json_to_string_opt) @@ fun jointState_name ->
    jreq json "jointState_position" (jlist json_to_float64_opt) @@ fun jointState_position ->
    jreq json "jointState_velocity" (jlist json_to_float64_opt) @@ fun jointState_velocity ->
    jreq json "jointState_effort" (jlist json_to_float64_opt) @@ fun jointState_effort ->
    Some {
    jointState_name;
    jointState_position;
    jointState_velocity;
    jointState_effort;
    }

let json_to_batteryState_opt json = 
    jreq json "voltage" json_to_float32_opt @@ fun voltage ->
    jreq json "current" json_to_float32_opt @@ fun current ->
    jreq json "charge" json_to_float32_opt @@ fun charge ->
    jreq json "capacity" json_to_float32_opt @@ fun capacity ->
    jreq json "design_capacity" json_to_float32_opt @@ fun design_capacity ->
    jreq json "percentage" json_to_float32_opt @@ fun percentage ->
    jreq json "power_supply_status" json_to_uint8_opt @@ fun power_supply_status ->
    jreq json "power_supply_health" json_to_uint8_opt @@ fun power_supply_health ->
    jreq json "power_supply_technology" json_to_uint8_opt @@ fun power_supply_technology ->
    jreq json "present" json_to_bool_opt @@ fun present ->
    jreq json "cell_voltage" (jlist json_to_float32_opt) @@ fun cell_voltage ->
    jreq json "location" json_to_string_opt @@ fun location ->
    jreq json "serial_number" json_to_string_opt @@ fun serial_number ->
    Some {
    voltage;
    current;
    charge;
    capacity;
    design_capacity;
    percentage;
    power_supply_status;
    power_supply_health;
    power_supply_technology;
    present;
    cell_voltage;
    location;
    serial_number;
    }

let json_to_compressedImage_opt json = 
    jreq json "compressedImage_format" json_to_string_opt @@ fun compressedImage_format ->
    jreq json "compressedImage_data" (jlist json_to_uint8_opt) @@ fun compressedImage_data ->
    Some {
    compressedImage_format;
    compressedImage_data;
    }

let json_to_temperature_opt json = 
    jreq json "temperature_temperature" json_to_float64_opt @@ fun temperature_temperature ->
    jreq json "temperature_variance" json_to_float64_opt @@ fun temperature_variance ->
    Some {
    temperature_temperature;
    temperature_variance;
    }

let json_to_fluidPressure_opt json = 
    jreq json "fluidPressure_fluid_pressure" json_to_float64_opt @@ fun fluidPressure_fluid_pressure ->
    jreq json "fluidPressure_variance" json_to_float64_opt @@ fun fluidPressure_variance ->
    Some {
    fluidPressure_fluid_pressure;
    fluidPressure_variance;
    }

let json_to_range_opt json = 
    jreq json "radiation_type" json_to_uint8_opt @@ fun radiation_type ->
    jreq json "field_of_view" json_to_float32_opt @@ fun field_of_view ->
    jreq json "min_range" json_to_float32_opt @@ fun min_range ->
    jreq json "max_range" json_to_float32_opt @@ fun max_range ->
    jreq json "range" json_to_float32_opt @@ fun range ->
    Some {
    radiation_type;
    field_of_view;
    min_range;
    max_range;
    range;
    }

let json_to_laserEcho_opt json = 
    jreq json "echoes" (jlist json_to_float32_opt) @@ fun echoes ->
    Some {
    echoes;
    }

let json_to_illuminance_opt json = 
    jreq json "illuminance_illuminance" json_to_float64_opt @@ fun illuminance_illuminance ->
    jreq json "illuminance_variance" json_to_float64_opt @@ fun illuminance_variance ->
    Some {
    illuminance_illuminance;
    illuminance_variance;
    }

let json_to_regionOfInterest_opt json = 
    jreq json "regionOfInterest_x_offset" json_to_uint32_opt @@ fun regionOfInterest_x_offset ->
    jreq json "regionOfInterest_y_offset" json_to_uint32_opt @@ fun regionOfInterest_y_offset ->
    jreq json "regionOfInterest_height" json_to_uint32_opt @@ fun regionOfInterest_height ->
    jreq json "regionOfInterest_width" json_to_uint32_opt @@ fun regionOfInterest_width ->
    jreq json "regionOfInterest_do_rectify" json_to_bool_opt @@ fun regionOfInterest_do_rectify ->
    Some {
    regionOfInterest_x_offset;
    regionOfInterest_y_offset;
    regionOfInterest_height;
    regionOfInterest_width;
    regionOfInterest_do_rectify;
    }

let json_to_joyFeedbackArray_opt json = 
    jreq json "array" (jlist json_to_joyFeedback_opt) @@ fun array ->
    Some {
    array;
    }

let json_to_imu_opt json = 
    jreq json "orientation" Geometry_msgs_of_json.json_to_quaternion_opt @@ fun orientation ->
    jreq json "orientation_covariance" (jlist json_to_float64_opt) @@ fun orientation_covariance ->
    jreq json "angular_velocity" Geometry_msgs_of_json.json_to_vector3_opt @@ fun angular_velocity ->
    jreq json "angular_velocity_covariance" (jlist json_to_float64_opt) @@ fun angular_velocity_covariance ->
    jreq json "linear_acceleration" Geometry_msgs_of_json.json_to_vector3_opt @@ fun linear_acceleration ->
    jreq json "linear_acceleration_covariance" (jlist json_to_float64_opt) @@ fun linear_acceleration_covariance ->
    Some {
    orientation;
    orientation_covariance;
    angular_velocity;
    angular_velocity_covariance;
    linear_acceleration;
    linear_acceleration_covariance;
    }

let json_to_relativeHumidity_opt json = 
    jreq json "relativeHumidity_relative_humidity" json_to_float64_opt @@ fun relativeHumidity_relative_humidity ->
    jreq json "relativeHumidity_variance" json_to_float64_opt @@ fun relativeHumidity_variance ->
    Some {
    relativeHumidity_relative_humidity;
    relativeHumidity_variance;
    }

let json_to_navSatStatus_opt json = 
    jreq json "navSatStatus_status" json_to_int8_opt @@ fun navSatStatus_status ->
    jreq json "navSatStatus_service" json_to_uint16_opt @@ fun navSatStatus_service ->
    Some {
    navSatStatus_status;
    navSatStatus_service;
    }

let json_to_channelFloat32_opt json = 
    jreq json "channelFloat32_name" json_to_string_opt @@ fun channelFloat32_name ->
    jreq json "channelFloat32_values" (jlist json_to_float32_opt) @@ fun channelFloat32_values ->
    Some {
    channelFloat32_name;
    channelFloat32_values;
    }

let json_to_joy_opt json = 
    jreq json "axes" (jlist json_to_float32_opt) @@ fun axes ->
    jreq json "buttons" (jlist json_to_int32_opt) @@ fun buttons ->
    Some {
    axes;
    buttons;
    }

let json_to_timeReference_opt json = 
    jreq json "time_ref" json_to_time_opt @@ fun time_ref ->
    jreq json "source" json_to_string_opt @@ fun source ->
    Some {
    time_ref;
    source;
    }

let json_to_pointCloud2_opt json = 
    jreq json "pointCloud2_height" json_to_uint32_opt @@ fun pointCloud2_height ->
    jreq json "pointCloud2_width" json_to_uint32_opt @@ fun pointCloud2_width ->
    jreq json "pointCloud2_fields" (jlist json_to_pointField_opt) @@ fun pointCloud2_fields ->
    jreq json "pointCloud2_is_bigendian" json_to_bool_opt @@ fun pointCloud2_is_bigendian ->
    jreq json "pointCloud2_point_step" json_to_uint32_opt @@ fun pointCloud2_point_step ->
    jreq json "pointCloud2_row_step" json_to_uint32_opt @@ fun pointCloud2_row_step ->
    jreq json "pointCloud2_data" (jlist json_to_uint8_opt) @@ fun pointCloud2_data ->
    jreq json "pointCloud2_is_dense" json_to_bool_opt @@ fun pointCloud2_is_dense ->
    Some {
    pointCloud2_height;
    pointCloud2_width;
    pointCloud2_fields;
    pointCloud2_is_bigendian;
    pointCloud2_point_step;
    pointCloud2_row_step;
    pointCloud2_data;
    pointCloud2_is_dense;
    }

let json_to_multiDOFJointState_opt json = 
    jreq json "joint_names" (jlist json_to_string_opt) @@ fun joint_names ->
    jreq json "transforms" (jlist Geometry_msgs_of_json.json_to_transform_opt) @@ fun transforms ->
    jreq json "twist" (jlist Geometry_msgs_of_json.json_to_twist_opt) @@ fun twist ->
    jreq json "wrench" (jlist Geometry_msgs_of_json.json_to_wrench_opt) @@ fun wrench ->
    Some {
    joint_names;
    transforms;
    twist;
    wrench;
    }

let json_to_cameraInfo_opt json = 
    jreq json "cameraInfo_height" json_to_uint32_opt @@ fun cameraInfo_height ->
    jreq json "cameraInfo_width" json_to_uint32_opt @@ fun cameraInfo_width ->
    jreq json "cameraInfo_distortion_model" json_to_string_opt @@ fun cameraInfo_distortion_model ->
    jreq json "cameraInfo_d" (jlist json_to_float64_opt) @@ fun cameraInfo_d ->
    jreq json "cameraInfo_k" (jlist json_to_float64_opt) @@ fun cameraInfo_k ->
    jreq json "cameraInfo_r" (jlist json_to_float64_opt) @@ fun cameraInfo_r ->
    jreq json "cameraInfo_p" (jlist json_to_float64_opt) @@ fun cameraInfo_p ->
    jreq json "cameraInfo_binning_x" json_to_uint32_opt @@ fun cameraInfo_binning_x ->
    jreq json "cameraInfo_binning_y" json_to_uint32_opt @@ fun cameraInfo_binning_y ->
    jreq json "cameraInfo_roi" json_to_regionOfInterest_opt @@ fun cameraInfo_roi ->
    Some {
    cameraInfo_height;
    cameraInfo_width;
    cameraInfo_distortion_model;
    cameraInfo_d;
    cameraInfo_k;
    cameraInfo_r;
    cameraInfo_p;
    cameraInfo_binning_x;
    cameraInfo_binning_y;
    cameraInfo_roi;
    }

let json_to_multiEchoLaserScan_opt json = 
    jreq json "multiEchoLaserScan_angle_min" json_to_float32_opt @@ fun multiEchoLaserScan_angle_min ->
    jreq json "multiEchoLaserScan_angle_max" json_to_float32_opt @@ fun multiEchoLaserScan_angle_max ->
    jreq json "multiEchoLaserScan_angle_increment" json_to_float32_opt @@ fun multiEchoLaserScan_angle_increment ->
    jreq json "multiEchoLaserScan_time_increment" json_to_float32_opt @@ fun multiEchoLaserScan_time_increment ->
    jreq json "multiEchoLaserScan_scan_time" json_to_float32_opt @@ fun multiEchoLaserScan_scan_time ->
    jreq json "multiEchoLaserScan_range_min" json_to_float32_opt @@ fun multiEchoLaserScan_range_min ->
    jreq json "multiEchoLaserScan_range_max" json_to_float32_opt @@ fun multiEchoLaserScan_range_max ->
    jreq json "multiEchoLaserScan_ranges" (jlist json_to_laserEcho_opt) @@ fun multiEchoLaserScan_ranges ->
    jreq json "multiEchoLaserScan_intensities" (jlist json_to_laserEcho_opt) @@ fun multiEchoLaserScan_intensities ->
    Some {
    multiEchoLaserScan_angle_min;
    multiEchoLaserScan_angle_max;
    multiEchoLaserScan_angle_increment;
    multiEchoLaserScan_time_increment;
    multiEchoLaserScan_scan_time;
    multiEchoLaserScan_range_min;
    multiEchoLaserScan_range_max;
    multiEchoLaserScan_ranges;
    multiEchoLaserScan_intensities;
    }

let json_to_pointCloud_opt json = 
    jreq json "points" (jlist Geometry_msgs_of_json.json_to_point32_opt) @@ fun points ->
    jreq json "channels" (jlist json_to_channelFloat32_opt) @@ fun channels ->
    Some {
    points;
    channels;
    }

let json_to_navSatFix_opt json = 
    jreq json "navSatFix_status" json_to_navSatStatus_opt @@ fun navSatFix_status ->
    jreq json "navSatFix_latitude" json_to_float64_opt @@ fun navSatFix_latitude ->
    jreq json "navSatFix_longitude" json_to_float64_opt @@ fun navSatFix_longitude ->
    jreq json "navSatFix_altitude" json_to_float64_opt @@ fun navSatFix_altitude ->
    jreq json "navSatFix_position_covariance" (jlist json_to_float64_opt) @@ fun navSatFix_position_covariance ->
    jreq json "navSatFix_position_covariance_type" json_to_uint8_opt @@ fun navSatFix_position_covariance_type ->
    Some {
    navSatFix_status;
    navSatFix_latitude;
    navSatFix_longitude;
    navSatFix_altitude;
    navSatFix_position_covariance;
    navSatFix_position_covariance_type;
    }

