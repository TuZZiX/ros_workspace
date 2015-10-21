// Generated by gencpp from file cwru_msgs/Path.msg
// DO NOT EDIT!


#ifndef CWRU_MSGS_MESSAGE_PATH_H
#define CWRU_MSGS_MESSAGE_PATH_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <cwru_msgs/PathSegment.h>

namespace cwru_msgs
{
template <class ContainerAllocator>
struct Path_
{
  typedef Path_<ContainerAllocator> Type;

  Path_()
    : header()
    , segs()  {
    }
  Path_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , segs(_alloc)  {
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector< ::cwru_msgs::PathSegment_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::cwru_msgs::PathSegment_<ContainerAllocator> >::other >  _segs_type;
  _segs_type segs;




  typedef boost::shared_ptr< ::cwru_msgs::Path_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cwru_msgs::Path_<ContainerAllocator> const> ConstPtr;

}; // struct Path_

typedef ::cwru_msgs::Path_<std::allocator<void> > Path;

typedef boost::shared_ptr< ::cwru_msgs::Path > PathPtr;
typedef boost::shared_ptr< ::cwru_msgs::Path const> PathConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cwru_msgs::Path_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cwru_msgs::Path_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cwru_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'cwru_msgs': ['/home/tianshipei/ros_ws/src/external_packages/cwru_msgs/cwru_msgs/msg'], 'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cwru_msgs::Path_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cwru_msgs::Path_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cwru_msgs::Path_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cwru_msgs::Path_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cwru_msgs::Path_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cwru_msgs::Path_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cwru_msgs::Path_<ContainerAllocator> >
{
  static const char* value()
  {
    return "61997cac25b65fbf8f9034286f94085e";
  }

  static const char* value(const ::cwru_msgs::Path_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x61997cac25b65fbfULL;
  static const uint64_t static_value2 = 0x8f9034286f94085eULL;
};

template<class ContainerAllocator>
struct DataType< ::cwru_msgs::Path_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cwru_msgs/Path";
  }

  static const char* value(const ::cwru_msgs::Path_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cwru_msgs::Path_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#Standard header.\n\
Header header\n\
\n\
#List of path segments that should be executed\n\
cwru_msgs/PathSegment[] segs\n\
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
MSG: cwru_msgs/PathSegment\n\
#Reference frame that the following coordinates should be interpreted relative to and timestamp to use when transforming\n\
Header header\n\
\n\
#Segment type enums\n\
int8 LINE = 1\n\
int8 ARC = 2\n\
int8 SPIN_IN_PLACE = 3\n\
\n\
#Segment type\n\
int8 seg_type\n\
\n\
#Segment number\n\
uint32 seg_number\n\
\n\
#Segment length\n\
float64 seg_length\n\
\n\
#Reference point\n\
geometry_msgs/Point ref_point\n\
\n\
#Initial tangent angle\n\
geometry_msgs/Quaternion init_tan_angle\n\
\n\
#Curvature\n\
float64 curvature\n\
\n\
#Speed limits for this segment\n\
geometry_msgs/Twist max_speeds\n\
geometry_msgs/Twist min_speeds\n\
\n\
#Acceleration limit for this segment (m/s^2 for lines/arcs, rads/s^2 for spin-in-place)\n\
float64 accel_limit\n\
\n\
#Deceleration limit for this segment\n\
float64 decel_limit\n\
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
\n\
================================================================================\n\
MSG: geometry_msgs/Twist\n\
# This expresses velocity in free space broken into its linear and angular parts.\n\
Vector3  linear\n\
Vector3  angular\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::cwru_msgs::Path_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cwru_msgs::Path_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.segs);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER;
  }; // struct Path_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cwru_msgs::Path_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cwru_msgs::Path_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "segs[]" << std::endl;
    for (size_t i = 0; i < v.segs.size(); ++i)
    {
      s << indent << "  segs[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::cwru_msgs::PathSegment_<ContainerAllocator> >::stream(s, indent + "    ", v.segs[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // CWRU_MSGS_MESSAGE_PATH_H
