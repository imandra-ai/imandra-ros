from functools import partial
import zmq

import rclpy
import rclpy.node
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist

class ImandraZmqProxy(rclpy.node.Node):
    def __init__(self):
        super().__init__('imandra_zmq_proxy')
        self.get_logger().info("Imandra proxy node has been started.")

        self.create_subscription(LaserScan, '/scan', self.__on_scan, 1)

    def __on_scan(self, msg):
        print(msg)



def main(args=None):
    rclpy.init(args=args)
    imandra_proxy = ImandraZmqProxy()
    rclpy.spin(imandra_proxy)

    imandra_proxy.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()