open Basic_types;;

type disparityImage = {
   header : Std_msgs.header ;
   image : Sensor_msgs.image ;
   f : float32 ;
   t : float32 ;
   valid_window : Sensor_msgs.regionOfInterest ;
   min_disparity : float32 ;
   max_disparity : float32 ;
   delta_d : float32 ;
}

