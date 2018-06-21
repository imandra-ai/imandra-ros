#include <iostream>
#include <caml/callback.h>
#include <caml/mlvalue.h>

#include "imandra_model.h"

#include "geometry_msgs/Twist.h"
#include "sensor_msgs/LaserScan.h"


class ImandraModel
{

    ImandraModel(char ** argv, ros::NodeHandle & node);
    static ImandraModel * singleton;

public: 

    static ImandraModel * getImandraModel();
    static void initImandraModel(char ** argv, ros::NodeHandle & node);

    void laser(const sensor_msgs::LaserScanConstPtr & msg);
};

///////////////////////////  Singleton stuff ////////////////////////////

ImandraModel * ImandraModel::singleton = NULL; 

ImandraModel * ImandraModel::getImandraModel() { 
    // TODO: figure out how to critical error properly in ROS
    if(!singleton){
        std::cerr << "Use of uninitialized Imandra Model. Call initImandraModel first." << std::endl;
        exit(1);
    }
    return singleton; 
} 

void ImandraModel::initImandraModel(char ** argv, ros::NodeHandle & node) {
    if(singleton) return;
    singleton = new ImandraModel(argv, node);
}

//////////// Plain C callbacks use the singleton and forward the messages to the object ///////////////


void laser_callback(const sensor_msgs::LaserScanConstPtr & msg) 
{ ImandraModel::getImandraModel()->laser(msg); }

void laser_callback(const sensor_msgs::LaserScanConstPtr & msg) 
{ ImandraModel::getImandraModel()->laser(msg); }


///////////////////////////  Constructor wires callbacks and methods together ////////////////////////////

ImandraModel::ImandraModel(char ** argv, ros::NodeHandle & node)
{
    caml_startup(argv);
    one_step = caml_named_value("one_step");

    node.subscribe("mybot/laser/scan", 1000,
}
