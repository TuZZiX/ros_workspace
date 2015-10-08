// Generated by gencpp from file cwru_srv/arm_nav_service_messageRequest.msg
// DO NOT EDIT!


#ifndef CWRU_SRV_MESSAGE_ARM_NAV_SERVICE_MESSAGEREQUEST_H
#define CWRU_SRV_MESSAGE_ARM_NAV_SERVICE_MESSAGEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseStamped.h>

namespace cwru_srv
{
template <class ContainerAllocator>
struct arm_nav_service_messageRequest_
{
  typedef arm_nav_service_messageRequest_<ContainerAllocator> Type;

  arm_nav_service_messageRequest_()
    : cmd_mode(0)
    , q_vec_start()
    , q_vec_end()
    , poseStamped_start()
    , poseStamped_goal()
    , plan_id(0)
    , delta_p()  {
    }
  arm_nav_service_messageRequest_(const ContainerAllocator& _alloc)
    : cmd_mode(0)
    , q_vec_start(_alloc)
    , q_vec_end(_alloc)
    , poseStamped_start(_alloc)
    , poseStamped_goal(_alloc)
    , plan_id(0)
    , delta_p(_alloc)  {
    }



   typedef int32_t _cmd_mode_type;
  _cmd_mode_type cmd_mode;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _q_vec_start_type;
  _q_vec_start_type q_vec_start;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _q_vec_end_type;
  _q_vec_end_type q_vec_end;

   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _poseStamped_start_type;
  _poseStamped_start_type poseStamped_start;

   typedef  ::geometry_msgs::PoseStamped_<ContainerAllocator>  _poseStamped_goal_type;
  _poseStamped_goal_type poseStamped_goal;

   typedef int32_t _plan_id_type;
  _plan_id_type plan_id;

   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _delta_p_type;
  _delta_p_type delta_p;




  typedef boost::shared_ptr< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> const> ConstPtr;

}; // struct arm_nav_service_messageRequest_

typedef ::cwru_srv::arm_nav_service_messageRequest_<std::allocator<void> > arm_nav_service_messageRequest;

typedef boost::shared_ptr< ::cwru_srv::arm_nav_service_messageRequest > arm_nav_service_messageRequestPtr;
typedef boost::shared_ptr< ::cwru_srv::arm_nav_service_messageRequest const> arm_nav_service_messageRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cwru_srv

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68f001930aa82828f0f67063bbe44011";
  }

  static const char* value(const ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68f001930aa82828ULL;
  static const uint64_t static_value2 = 0xf0f67063bbe44011ULL;
};

template<class ContainerAllocator>
struct DataType< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cwru_srv/arm_nav_service_messageRequest";
  }

  static const char* value(const ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
int32 cmd_mode\n\
\n\
\n\
float32[] q_vec_start\n\
float32[] q_vec_end\n\
\n\
\n\
\n\
geometry_msgs/PoseStamped poseStamped_start\n\
geometry_msgs/PoseStamped poseStamped_goal\n\
\n\
\n\
\n\
int32 plan_id\n\
\n\
\n\
float32[] delta_p\n\
\n\
\n\
================================================================================\n\
MSG: geometry_msgs/PoseStamped\n\
# A Pose with reference coordinate frame and timestamp\n\
Header header\n\
Pose pose\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of postion and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.cmd_mode);
      stream.next(m.q_vec_start);
      stream.next(m.q_vec_end);
      stream.next(m.poseStamped_start);
      stream.next(m.poseStamped_goal);
      stream.next(m.plan_id);
      stream.next(m.delta_p);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct arm_nav_service_messageRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cwru_srv::arm_nav_service_messageRequest_<ContainerAllocator>& v)
  {
    s << indent << "cmd_mode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.cmd_mode);
    s << indent << "q_vec_start[]" << std::endl;
    for (size_t i = 0; i < v.q_vec_start.size(); ++i)
    {
      s << indent << "  q_vec_start[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.q_vec_start[i]);
    }
    s << indent << "q_vec_end[]" << std::endl;
    for (size_t i = 0; i < v.q_vec_end.size(); ++i)
    {
      s << indent << "  q_vec_end[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.q_vec_end[i]);
    }
    s << indent << "poseStamped_start: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.poseStamped_start);
    s << indent << "poseStamped_goal: ";
    s << std::endl;
    Printer< ::geometry_msgs::PoseStamped_<ContainerAllocator> >::stream(s, indent + "  ", v.poseStamped_goal);
    s << indent << "plan_id: ";
    Printer<int32_t>::stream(s, indent + "  ", v.plan_id);
    s << indent << "delta_p[]" << std::endl;
    for (size_t i = 0; i < v.delta_p.size(); ++i)
    {
      s << indent << "  delta_p[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.delta_p[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CWRU_SRV_MESSAGE_ARM_NAV_SERVICE_MESSAGEREQUEST_H
