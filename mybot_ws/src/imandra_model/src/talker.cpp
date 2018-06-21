#include "ros/ros.h"
#include "geometry_msgs/Twist.h"
#include "sensor_msgs/LaserScan.h"

#include <sstream>

void laserCallback(const sensor_msgs::LaserScanConstPtr& msg)
{

}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "imandra_model");

  ros::NodeHandle n;
  ros::Publisher control_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 1000);
  

  ros::Rate loop_rate(10);

  while (ros::ok())
  {
    geometry_msgs::Twist msg;

    control_pub.publish(msg);

    ros::spinOnce();
    loop_rate.sleep();
  }

  return 0;
}

