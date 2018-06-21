#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/custom.h>
#include <caml/misc.h>
#include <caml/signals.h>

#include "ros/ros.h"

static struct custom_operations ros_custom_ops = {
    "com.aestheticintegration.imandra-ros.ros",
    custom_finalize_default,
    custom_compare_default,
    custom_hash_default,
    custom_serialize_default,
    custom_deserialize_default
};

typedef struct ros_node_state {
    ros::NodeHandle * nodeHandle;
} ros_node_state_t;


CAMLprim
value ros_init(value v1) {
  CAMLparam1(v1);
  CAMLlocal1(res);

  // Calling ros::init with the node name
  std::map<std::string, std::string> remapping;
  std::string node_name(String_val(v1));
  ros::init( remapping, node_name );

  // Putting node handle into the state variable
  ros_node_state_t * ros_state = new ros_node_state_t();
  ros_state->nodeHandle = new ros::NodeHandle();

  // Alloc and return
  res = caml_alloc_custom( &ros_custom_ops, sizeof(ros_state), 0, 1 );

  CAMLreturn(Val_unit);
}

CAMLprim
value subscribe(value v1){
    CAMLparam1(v1);
    // ???
}