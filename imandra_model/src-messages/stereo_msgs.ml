open Basic_types;;

type disparityImage = {
   image : Sensor_msgs.image ;
   f : float32 ;
   t : float32 ;
   valid_window : Sensor_msgs.regionOfInterest ;
   min_disparity : float32 ;
   max_disparity : float32 ;
   delta_d : float32 ;
}

