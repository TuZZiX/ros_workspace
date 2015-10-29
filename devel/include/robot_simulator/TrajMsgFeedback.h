// Generated by gencpp from file robot_simulator/TrajMsgFeedback.msg
// DO NOT EDIT!


#ifndef ROBOT_SIMULATOR_MESSAGE_TRAJMSGFEEDBACK_H
#define ROBOT_SIMULATOR_MESSAGE_TRAJMSGFEEDBACK_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace robot_simulator
{
template <class ContainerAllocator>
struct TrajMsgFeedback_
{
  typedef TrajMsgFeedback_<ContainerAllocator> Type;

  TrajMsgFeedback_()
    : cmd_out(0.0)  {
    }
  TrajMsgFeedback_(const ContainerAllocator& _alloc)
    : cmd_out(0.0)  {
    }



   typedef double _cmd_out_type;
  _cmd_out_type cmd_out;




  typedef boost::shared_ptr< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> const> ConstPtr;

}; // struct TrajMsgFeedback_

typedef ::robot_simulator::TrajMsgFeedback_<std::allocator<void> > TrajMsgFeedback;

typedef boost::shared_ptr< ::robot_simulator::TrajMsgFeedback > TrajMsgFeedbackPtr;
typedef boost::shared_ptr< ::robot_simulator::TrajMsgFeedback const> TrajMsgFeedbackConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace robot_simulator

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'robot_simulator': ['/home/tianshipei/ros_ws/devel/share/robot_simulator/msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/indigo/share/trajectory_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0f7410aaefb32aa45c708beeb052f064";
  }

  static const char* value(const ::robot_simulator::TrajMsgFeedback_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0f7410aaefb32aa4ULL;
  static const uint64_t static_value2 = 0x5c708beeb052f064ULL;
};

template<class ContainerAllocator>
struct DataType< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "robot_simulator/TrajMsgFeedback";
  }

  static const char* value(const ::robot_simulator::TrajMsgFeedback_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#Feedback messages\n\
float64 cmd_out		#current output\n\
\n\
";
  }

  static const char* value(const ::robot_simulator::TrajMsgFeedback_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.cmd_out);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct TrajMsgFeedback_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::robot_simulator::TrajMsgFeedback_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::robot_simulator::TrajMsgFeedback_<ContainerAllocator>& v)
  {
    s << indent << "cmd_out: ";
    Printer<double>::stream(s, indent + "  ", v.cmd_out);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROBOT_SIMULATOR_MESSAGE_TRAJMSGFEEDBACK_H