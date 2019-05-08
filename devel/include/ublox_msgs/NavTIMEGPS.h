// Generated by gencpp from file ublox_msgs/NavTIMEGPS.msg
// DO NOT EDIT!


#ifndef UBLOX_MSGS_MESSAGE_NAVTIMEGPS_H
#define UBLOX_MSGS_MESSAGE_NAVTIMEGPS_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace ublox_msgs
{
template <class ContainerAllocator>
struct NavTIMEGPS_
{
  typedef NavTIMEGPS_<ContainerAllocator> Type;

  NavTIMEGPS_()
    : iTOW(0)
    , fTOW(0)
    , week(0)
    , leapS(0)
    , valid(0)
    , tAcc(0)  {
    }
  NavTIMEGPS_(const ContainerAllocator& _alloc)
    : iTOW(0)
    , fTOW(0)
    , week(0)
    , leapS(0)
    , valid(0)
    , tAcc(0)  {
  (void)_alloc;
    }



   typedef uint32_t _iTOW_type;
  _iTOW_type iTOW;

   typedef int32_t _fTOW_type;
  _fTOW_type fTOW;

   typedef int16_t _week_type;
  _week_type week;

   typedef int8_t _leapS_type;
  _leapS_type leapS;

   typedef uint8_t _valid_type;
  _valid_type valid;

   typedef uint32_t _tAcc_type;
  _tAcc_type tAcc;



  enum {
    CLASS_ID = 1u,
    MESSAGE_ID = 32u,
    VALID_TOW = 1u,
    VALID_WEEK = 2u,
    VALID_UTC = 4u,
  };


  typedef boost::shared_ptr< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> const> ConstPtr;

}; // struct NavTIMEGPS_

typedef ::ublox_msgs::NavTIMEGPS_<std::allocator<void> > NavTIMEGPS;

typedef boost::shared_ptr< ::ublox_msgs::NavTIMEGPS > NavTIMEGPSPtr;
typedef boost::shared_ptr< ::ublox_msgs::NavTIMEGPS const> NavTIMEGPSConstPtr;

// constants requiring out of line definition

   

   

   

   

   



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace ublox_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'ublox_msgs': ['/home/b2256/catkin_ws/src/ublox_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4b13e924e2a4818785c01a54ff86bd76";
  }

  static const char* value(const ::ublox_msgs::NavTIMEGPS_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4b13e924e2a48187ULL;
  static const uint64_t static_value2 = 0x85c01a54ff86bd76ULL;
};

template<class ContainerAllocator>
struct DataType< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ublox_msgs/NavTIMEGPS";
  }

  static const char* value(const ::ublox_msgs::NavTIMEGPS_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# NAV-TIMEGPS (0x01 0x20)\n\
# GPS Time Solution\n\
#\n\
\n\
uint8 CLASS_ID = 1\n\
uint8 MESSAGE_ID = 32\n\
\n\
uint32 iTOW             # GPS Millisecond time of week [ms]\n\
int32 fTOW              # Fractional Nanoseconds remainder of rounded\n\
                        # ms above, range -500000 .. 500000 [ns]\n\
int16 week              # GPS week (GPS time)\n\
\n\
int8 leapS              # Leap Seconds (GPS-UTC) [s]\n\
\n\
uint8 valid             # Validity Flags\n\
uint8 VALID_TOW = 1         # Valid Time of Week\n\
uint8 VALID_WEEK = 2        # Valid Week Number\n\
uint8 VALID_UTC = 4         # Valid Leap Seconds, i.e. Leap Seconds already known\n\
\n\
uint32 tAcc             # Time Accuracy Estimate [ns]\n\
";
  }

  static const char* value(const ::ublox_msgs::NavTIMEGPS_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.iTOW);
      stream.next(m.fTOW);
      stream.next(m.week);
      stream.next(m.leapS);
      stream.next(m.valid);
      stream.next(m.tAcc);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NavTIMEGPS_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ublox_msgs::NavTIMEGPS_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::ublox_msgs::NavTIMEGPS_<ContainerAllocator>& v)
  {
    s << indent << "iTOW: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.iTOW);
    s << indent << "fTOW: ";
    Printer<int32_t>::stream(s, indent + "  ", v.fTOW);
    s << indent << "week: ";
    Printer<int16_t>::stream(s, indent + "  ", v.week);
    s << indent << "leapS: ";
    Printer<int8_t>::stream(s, indent + "  ", v.leapS);
    s << indent << "valid: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.valid);
    s << indent << "tAcc: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.tAcc);
  }
};

} // namespace message_operations
} // namespace ros

#endif // UBLOX_MSGS_MESSAGE_NAVTIMEGPS_H
