import json 

import builtin_interfaces.msg
import std_msgs.msg
import sensor_msgs.msg
import geometry_msgs.msg

modules = \
  { "builtin_interfaces" : builtin_interfaces
  , "std_msgs" : std_msgs 
  , "sensor_msgs" : sensor_msgs
  , "geometry_msgs" : geometry_msgs
  }

#############################################
################# Encoders ##################
#############################################

# Second-order encoder combinators

def sequence_to_json(enc):
    def f(lst):
        return [ enc(x) for x in lst ]
    return f

def msg_to_json(fields):
    def f(msg):
        return { k:f(getattr(msg,k)) for k,f in fields.items() }
    return f
    
# Atomic type encoders

float_scale = 100000
def float_to_json(x):
    try:
        return { "value" : int(x * float_scale) , "precision" : float_scale }  
    except:
        return None


basic = {}
basic["float"] = float_to_json
ids = ["string", "int32", "uint32"]
for t in ids:
    basic[t] = lambda x: x

# Encoder getter by name / type

# TODO: caching
def get_encoder(t):
    if t in basic:
        return basic[t]
    if t.startswith("sequence<"):
        f = get_encoder(t[len("sequence<"):-1])
        return sequence_to_json(f)
    if "/" in t:
        ( module , msg ) = t.split("/")
        if module not in modules: 
            return None
        module = modules[module]
        msg_class = getattr(module.msg, msg)
        tfields = msg_class.get_fields_and_field_types()
        tfields = { k:get_encoder(t)  for k,t in tfields.items()}
        return msg_to_json(tfields)
    return None

def encode_msg(t, msg):
    f = get_encoder(t)
    data = f(msg)
    data = { "tag" : t , "data" : data }
    return json.dumps(data)

#############################################
################# Decoders ##################
#############################################

def sequence_decoder(dec):
    def f(lst):
        return [dec(x) for x in lst]
    return f
    
def msg_decoder(msg_class):
    tfields = msg_class.get_fields_and_field_types()
    def f(msg):
        args = {}
        for k, t in tfields.items():
            decoder = get_decoder(t)
            v = msg.get(k)
            if v is None: continue
            args[k] = v if decoder is None else decoder(v)
        return msg_class(**args)
    return f

def float_decoder(x):
    if x is None: return float("inf")
    return x["value"] / x["precision"]
    
def get_decoder(t):
    if t == "float":
        return float_decoder
    if t == "sequence<float>":
        return sequence_decoder(float_decoder)
    if "/" in t:
        ( module , msg ) = t.split("/")
        module = modules[module]
        msg_class = getattr(module.msg, msg)      
        return msg_decoder(msg_class)
    return None

def decode_msg(msg):
    t = msg["tag"]
    f = get_decoder(t)
    return f(msg["data"])