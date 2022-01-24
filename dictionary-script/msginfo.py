#    ROS-messaging OCaml codegenerator tool

#    Aesthetic Integration Limited
#    Copyright (c) 2014 - 2018



def get_module_name(msg):
    if '/' not in msg: 
        return None
    return msg.split('/')[0].capitalize()

def get_type_info(rostype):
    tinfo = {}
    if '/' in rostype: 
        spl = rostype.split('/')
        module = spl[0]
        rostype = spl[-1]
        tinfo['module'] = module.capitalize()
    rostype = rostype[0].lower() + rostype[1:]    
    tinfo['name'] = rostype
    if '[' in rostype:
        tinfo['list'] = True
        tinfo['name'] = rostype[:rostype.index('[')]
    
    return tinfo

def kw(name):
    keywords = {
        "type" : "ros_type",
        "function" : "ros_function"
    }
    name = name[0].lower() + name[1:]
    return keywords.get(name,name)

def format_type(tinfo, current_module=None):
    tdecl = kw(tinfo['name'])
    if 'module' in tinfo and tinfo['module'] != current_module:
        tdecl = tinfo['module'] + "." + tdecl
    if tinfo.get('list', False):
        tdecl += ' list'
    return tdecl

def get_type_parser(tinfo, current_module=None):
    tdecl = "json_to_" + kw(tinfo['name']) + "_opt"
    if 'module' in tinfo and tinfo['module'] != current_module:
        tdecl = "{0}_of_json.{1}".format( tinfo['module'] , tdecl )
    if tinfo.get('list', False):
        tdecl = "(jlist {})".format(tdecl)
    return tdecl

class MsgInfo(object):
    
    def _process_raw(self):
        self.entries = []
        raw_filtered = filter(lambda x: '=' not in x, self.raw)
        for entry in raw_filtered:
            entry = entry.strip()
            if entry[0] == "#" or entry.strip() == "": continue
            lst = entry.split(' ')
            if len(lst) != 2:
                raise ValueError("Cant process raw entry '{}'".format(entry))
            etype = get_type_info(lst[0])
            edata = { "type" : etype, "name" : kw(lst[1]) }
            emodule = edata['type'].get('module')
            if emodule and emodule != self.module:
                edata["module"] = emodule
            if emodule == self.module:
                edata["local"] = True
            self.entries.append(edata) 

        self.cases = {}
        raw_cases = filter(lambda x: '=' in x, self.raw)
        
    
    def __init__(self, msg, info):
        
        self.module = get_module_name(msg)
        self.name =  get_type_info(msg)['name']
        
        info = filter(lambda x : not x.startswith(' '), info)
        info = filter(lambda x : x, info)
        
        self.raw = info
        self._process_raw()
        
    def gen_typedecl(self):
        if self.entries == []:
            return "type {} = ()".format(self.name)
        code = ["type {} = {{".format(self.name)]
        for entry in self.entries:
            etype = format_type(entry['type'], self.module)
            code.append("   {0} : {1} ;".format(entry['name'], etype))
        code += ["}"]
        return "\n".join(code)

    def gen_json_reader(self):
        if self.entries == []:
            return "let json_to_{0}_opt json : {0} option = Some ()".format(self.name)
        code = ["let json_to_{}_opt json = ".format(self.name)]
        for entry in self.entries:
            etype = get_type_parser(entry['type'], self.module)
            code.append("    jreq json \"{0}\" {1} @@ fun {0} ->".format(entry['name'], etype))
        code += ["    Some {"]
        for entry in self.entries:
            code.append("    {0};".format(entry['name']))
        code += ["    }"]
        return "\n".join(code)

    def get_local_dependencies(self):
        return [e['type']['name'] for e in self.entries if e.get('local', False)]
    
    def get_field_names(self):
        return [e['name'] for e in self.entries]
    
    def prefix_fields(self, fields):
        for e in self.entries:
            e['name'] = self.name + "_" + e['name']
