import json
import zmq
import rospy


from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from rosgraph_msgs.msg import Clock

def float_to_number(max):
    def f(x):
        try:
            return int(x * 1000)
        except:
            return int(max * 1000)
    return f

def laser_scan_to_json(msg):
    convf = float_to_number(msg.range_max)
    data = \
        { "tag"  : "laser_scan"
        , "data" : \
            { "Angle_min"       : convf ( msg.angle_min       ) 
            , "Angle_max"       : convf ( msg.angle_max       ) 
            , "Angle_increment" : convf ( msg.angle_increment ) 
            , "Time_increment"  : convf ( msg.time_increment  ) 
            , "Scan_time"       : convf ( msg.scan_time       ) 
            , "Range_min"       : convf ( msg.range_min       ) 
            , "Range_max"       : convf ( msg.range_max       ) 
            , "Ranges"          : map ( convf , msg.ranges      ) 
            , "Intensities"     : map ( convf , msg.intensities ) 
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
    msg.linear.x  = float(data["Linear"]["x"] ) / 1000
    msg.linear.y  = float(data["Linear"]["y"] ) / 1000
    msg.linear.z  = float(data["Linear"]["z"] ) / 1000
    msg.angular.x = float(data["Angular"]["x"]) / 1000
    msg.angular.y = float(data["Angular"]["y"]) / 1000
    msg.angular.z = float(data["Angular"]["z"]) / 1000
    return msg

##### Initializing ZMQ

zmq_context  = zmq.Context.instance()
zmq_poller = zmq.Poller()
pub_socket = zmq_context.socket(zmq.PUB)
pub_socket.bind("tcp://127.0.0.1:16000")

sub_socket = zmq_context.socket(zmq.SUB)
sub_socket.connect("tcp://127.0.0.1:16001")
sub_socket.setsockopt(zmq.SUBSCRIBE, '')

##### Initializing ROS

rospy.init_node("imandra")
cmd_vel_pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)

# Wiring ROS -> ZMQ

def forward_clock(msg):
    pub_socket.send(clock_to_json(msg))
rospy.Subscriber("clock", Clock, forward_clock)

def forward_laser(msg):
    pub_socket.send(laser_scan_to_json(msg))
rospy.Subscriber("mybot/laser/scan", LaserScan, forward_laser)

# Wiring ZMQ -> ROS

def json_dispatch(msg):
    msg = json.loads(msg)
    if msg["tag"] == "twist":
        msg = dict_to_twist(msg["data"])
        print "ZMQ -> ROS " + str(msg)
        cmd_vel_pub.publish(msg)

while not rospy.is_shutdown():
    msg = sub_socket.recv()
    json_dispatch(msg)
    
