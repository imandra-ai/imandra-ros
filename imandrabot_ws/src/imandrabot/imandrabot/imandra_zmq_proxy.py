from functools import partial
import zmq
import json

import rclpy
import rclpy.node
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

        self.create_subscription(LaserScan, '/scan', self.__on_scan, 1)
        self.zmq_proxy_publishers = {}
        self.zmq_proxy_publishers["geometry_msgs/Twist"] = self.create_publisher(Twist, '/cmd_vel', 1)


    def __timer_callback(self):
        while True:
            try:
                msg = sub_socket.recv(flags=zmq.NOBLOCK)
            except:
                break
            msg = json.loads(msg)
            msg_type = msg.get("ros2_message_type")
            if msg_type is None: continue
            msg = decode_msg(msg_type, msg_json)
            self.zmq_proxy_publishers[msg].publish(msg)


    def __on_scan(self, msg):
        msg_json = encode_msg("sensor_msgs/LaserScan", msg)
        print(msg_json)
        self.pub_socket.send_string(msg_json)

        # Test decoder
        msg_json = json.loads(msg_json)
        msg = decode_msg("sensor_msgs/LaserScan", msg_json)
        print(msg)



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