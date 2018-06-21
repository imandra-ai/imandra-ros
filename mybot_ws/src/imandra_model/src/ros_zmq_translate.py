import json
import zmq
import rospy


from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from rosgraph_msgs.msg import Clock

def float_to_number(x):
    return int(x * 1000)

def laser_scan_to_json(msg):
    data = \
        { "tag"  : "laser_scan"
        , "data" : \
            { "Angle_min"       : float_to_number ( msg.angle_min       ) 
            , "Angle_max"       : float_to_number ( msg.angle_max       ) 
            , "Angle_increment" : float_to_number ( msg.angle_increment ) 
            , "Time_increment"  : float_to_number ( msg.time_increment  ) 
            , "Scan_time"       : float_to_number ( msg.scan_time       ) 
            , "Range_min"       : float_to_number ( msg.range_min       ) 
            , "Range_max"       : float_to_number ( msg.range_max       ) 
            , "Ranges"          : map ( float_to_number , msg.ranges      ) 
            , "Intensities"     : map ( float_to_number , msg.intensities ) 
            }
        }
    return json.dumps(data)

# TODO : nanoseconds
def clock_to_json(msg):
    data = \
        { "tag"  : "clock"
        , "data" : \
            { "Clock" : \
               { "seconds"      : msg.clock.secs
               , "milliseconds" : msg.clock.nsecs
               }
            }
        }
    return json.dumps(data)


def dict_to_twist(data):
    msg = Twist()
    msg.linear.x = data["Linear"]["x"]
    msg.linear.y = data["Linear"]["y"]
    msg.linear.z = data["Linear"]["z"]
    msg.angular.x = data["Angular"]["x"]
    msg.angular.y = data["Angular"]["y"]
    msg.angular.z = data["Angular"]["z"]
    return msg

# Initializing ZMQ

zmq_context  = zmq.Context.instance()
zmq_poller = zmq.Poller()
pub_socket = zmq_context.socket(zmq.PUB)
pub_socket.bind("tcp://127.0.0.1:16000")

req_socket = zmq_context.socket(zmq.REQ)
req_socket.connect("tcp://127.0.0.1:16001")


# Initializing ROS

rospy.init_node("imandra")
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)

def forward_clock(msg):
    pub_socket.send(clock_to_json(msg))
rospy.Subscriber("clock", Clock, forward_clock)

def forward_laser(msg):
    pub_socket.send(laser_scan_to_json(msg))
rospy.Subscriber("mybot/laser/scan", LaserScan, forward_laser)


rate = rospy.Rate(10)
while not rospy.is_shutdown():
    rate.sleep()
