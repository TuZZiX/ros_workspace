// Generated by gencpp from file cwru_msgs/PowerState.msg
// DO NOT EDIT!


#ifndef CWRU_MSGS_MESSAGE_POWERSTATE_H
#define CWRU_MSGS_MESSAGE_POWERSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace cwru_msgs
{
template <class ContainerAllocator>
struct PowerState_
{
  typedef PowerState_<ContainerAllocator> Type;

  PowerState_()
    : header()
    , battery_voltage(0.0)
    , cRIO_voltage(0.0)
    , v13_8_voltage(0.0)
    , motor_voltage(0.0)  {
    }
  PowerState_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , battery_voltage(0.0)
    , cRIO_voltage(0.0)
    , v13_8_voltage(0.0)
    , motor_voltage(0.0)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef float _battery_voltage_type;
  _battery_voltage_type battery_voltage;

   typedef float _cRIO_voltage_type;
  _cRIO_voltage_type cRIO_voltage;

   typedef float _v13_8_voltage_type;
  _v13_8_voltage_type v13_8_voltage;

   typedef float _motor_voltage_type;
  _motor_voltage_type motor_voltage;




  typedef boost::shared_ptr< ::cwru_msgs::PowerState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cwru_msgs::PowerState_<ContainerAllocator> const> ConstPtr;

}; // struct PowerState_

typedef ::cwru_msgs::PowerState_<std::allocator<void> > PowerState;

typedef boost::shared_ptr< ::cwru_msgs::PowerState > PowerStatePtr;
typedef boost::shared_ptr< ::cwru_msgs::PowerState const> PowerStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cwru_msgs::PowerState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cwru_msgs::PowerState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cwru_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'cwru_msgs': ['/home/tianshipei/ros_ws/src/external_packages/cwru_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cwru_msgs::PowerState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cwru_msgs::PowerState_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cwru_msgs::PowerState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cwru_msgs::PowerState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cwru_msgs::PowerState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cwru_msgs::PowerState_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cwru_msgs::PowerState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "28d9736fc054adc56d7b67c1f71a6b0d";
  }

  static const char* value(const ::cwru_msgs::PowerState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x28d9736fc054adc5ULL;
  static const uint64_t static_value2 = 0x6d7b67c1f71a6b0dULL;
};

template<class ContainerAllocator>
struct DataType< ::cwru_msgs::PowerState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cwru_msgs/PowerState";
  }

  static const char* value(const ::cwru_msgs::PowerState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cwru_msgs::PowerState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
float32 battery_voltage\n\
float32 cRIO_voltage\n\
float32 v13_8_voltage\n\
float32 motor_voltage\n\
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
";
  }

  static const char* value(const ::cwru_msgs::PowerState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cwru_msgs::PowerState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.battery_voltage);
      stream.next(m.cRIO_voltage);
      stream.next(m.v13_8_voltage);
      stream.next(m.motor_voltage);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct PowerState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cwru_msgs::PowerState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cwru_msgs::PowerState_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "battery_voltage: ";
    Printer<float>::stream(s, indent + "  ", v.battery_voltage);
    s << indent << "cRIO_voltage: ";
    Printer<float>::stream(s, indent + "  ", v.cRIO_voltage);
    s << indent << "v13_8_voltage: ";
    Printer<float>::stream(s, indent + "  ", v.v13_8_voltage);
    s << indent << "motor_voltage: ";
    Printer<float>::stream(s, indent + "  ", v.motor_voltage);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CWRU_MSGS_MESSAGE_POWERSTATE_H
