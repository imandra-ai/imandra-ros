from functools import partial
import zmq
import json

import rclpy
import rclpy.node
from rosgraph_msgs.msg import Clock
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist

from  .json_utils import encode_msg , decode_msg

class ImandraZmqProxy(rclpy.node.Node):
    def __init__(self, pub_socket, sub_socket):
        super().__init__('imandra_zmq_proxy')
        self.get_logger().info("Imandra proxy node has been started.")

        self.pub_socket = pub_socket
        self.sub_socket = sub_socket

        self.create_timer(0.1, self.__timer_callback)

        self.create_subscription(Clock, '/clock', self.__on_clock, 1)
        self.create_subscription(LaserScan, '/scan', self.__on_scan, 1)

        self.zmq_proxy_publishers = {}
        self.zmq_proxy_publishers["geometry_msgs/Twist"] = self.create_publisher(Twist, '/cmd_vel', 1)


    def __timer_callback(self):
        while True:
            try:
                msg = self.sub_socket.recv(flags=zmq.NOBLOCK)
            except:
                break
            print("received ", msg)
            msg = json.loads(msg)
            msg_type = msg.get("tag")
            if msg_type is None: continue
            msg = decode_msg(msg)
            self.zmq_proxy_publishers[msg_type].publish(msg)

    def __on_clock(self, msg):
        msg_json = encode_msg("rosgraph_msgs/Clock", msg)
        self.pub_socket.send_string(msg_json)

    def __on_scan(self, msg):
        msg_json = encode_msg("sensor_msgs/LaserScan", msg)
        self.pub_socket.send_string(msg_json)


def main(args=None):
    ##### Initializing ZMQ

    zmq_context  = zmq.Context.instance()
    pub_socket = zmq_context.socket(zmq.PUB)
    pub_socket.bind("tcp://127.0.0.1:16000")

    sub_socket = zmq_context.socket(zmq.SUB)
    sub_socket.connect("tcp://127.0.0.1:16001")
    sub_socket.setsockopt(zmq.SUBSCRIBE, b'')

    ##### Starting ROS2

    rclpy.init(args=args)
    imandra_proxy = ImandraZmqProxy(pub_socket, sub_socket)
    rclpy.spin(imandra_proxy)

    imandra_proxy.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()