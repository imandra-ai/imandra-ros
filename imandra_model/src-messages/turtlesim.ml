open Basic_types;;

type color = {
   r : uint8 ;
   g : uint8 ;
   b : uint8 ;
}

type pose = {
   x : float32 ;
   y : float32 ;
   theta : float32 ;
   linear_velocity : float32 ;
   angular_velocity : float32 ;
}

