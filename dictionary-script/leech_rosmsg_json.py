import subprocess 
import json

cmd = ["ros2", "interface", "list", "-m"]
messages = subprocess.check_output(cmd).splitlines()

data = {}
for msg in messages:
    if msg.startswith(b"Messages:"): continue
    msg = msg.strip().decode("utf-8") 
    print(msg)
    cmd = [ "ros2", "interface", "show" , msg ]
    info = subprocess.check_output(cmd).splitlines()
    data[msg] =  "\n".join([i.decode("utf-8") for i in info])

with open("rosmsgs.json", "w") as jsonFile:
    json.dump(data, jsonFile)
