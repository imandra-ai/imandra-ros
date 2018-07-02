import zmq

# Socket to talk to server
context = zmq.Context()
socket = context.socket(zmq.SUB)

socket.connect( "tcp://localhost:16000" )
socket.setsockopt(zmq.SUBSCRIBE, '')

while True:
    string = socket.recv()
    print string
