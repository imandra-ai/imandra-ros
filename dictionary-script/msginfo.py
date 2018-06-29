def get_module_name(msg):
    if '/' not in msg: 
        return None
    return msg.split('/')[0].capitalize()

def get_type_info(rostype):
    tinfo = {}
    if '/' in rostype: 
        module , rostype = rostype.split('/')
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

class MsgInfo(object):
    
    def _process_raw(self):
        self.entries = []
        raw_filtered = filter(lambda x: '=' not in x, self.raw)
        for entry in raw_filtered:
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
        
        info = info.splitlines()
        info = filter(lambda x : not x.startswith(' '), info)
        info = filter(lambda x : x != 'std_msgs/Header header', info)
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

    def get_local_dependencies(self):
        return [e['type']['name'] for e in self.entries if e.get('local', False)]
    
    def get_field_names(self):
        return [e['name'] for e in self.entries]
    
    def prefix_fields(self, fields):
        for e in self.entries:
            e['name'] = self.name + "_" + e['name']
