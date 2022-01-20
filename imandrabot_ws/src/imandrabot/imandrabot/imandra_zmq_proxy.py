from functools import partial
import zmq

import rclpy
import rclpy.node
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist

from  .json_utils import msg_to_json

class ImandraZmqProxy(rclpy.node.Node):
    def __init__(self, pub_socket, sub_socket):
        super().__init__('imandra_zmq_proxy')
        self.get_logger().info("Imandra proxy node has been started.")

        self.pub_socket = pub_socket
        self.sub_socket = sub_socket

        self.create_subscription(LaserScan, '/scan', self.__on_scan, 1)

    def __on_scan(self, msg):
        msg_json = msg_to_json("sensor_msgs/LaserScan",msg)
        print(msg_json)
        self.pub_socket.send_string(msg_json)




def main(args=None):
    ##### Initializing ZMQ

    zmq_context  = zmq.Context.instance()
    pub_socket = zmq_context.socket(zmq.PUB)
    pub_socket.bind("tcp://127.0.0.1:16000")

    sub_socket = zmq_context.socket(zmq.SUB)
    sub_socket.connect("tcp://127.0.0.1:16001")
    sub_socket.setsockopt(zmq.SUBSCRIBE, '')

    ##### Starting ROS2

    rclpy.init(args=args)
    imandra_proxy = ImandraZmqProxy(pub_socket, sub_socket)
    rclpy.spin(imandra_proxy)

    imandra_proxy.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()