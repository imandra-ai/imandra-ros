import subprocess 
import json

messages = subprocess.check_output(["rosmsg" , "list"]).splitlines()

data = {}
for msg in messages:
    print msg
    cmd = [ "rosmsg" , "show" , msg ]
    info = subprocess.check_output(cmd)
    data[msg] = info

with open("rosmsgs.json", "w") as jsonFile:
    json.dump(data, jsonFile)
