// Generated by gencpp from file nodelet/NodeletUnloadRequest.msg
// DO NOT EDIT!


#ifndef NODELET_MESSAGE_NODELETUNLOADREQUEST_H
#define NODELET_MESSAGE_NODELETUNLOADREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nodelet
{
template <class ContainerAllocator>
struct NodeletUnloadRequest_
{
  typedef NodeletUnloadRequest_<ContainerAllocator> Type;

  NodeletUnloadRequest_()
    : name()  {
    }
  NodeletUnloadRequest_(const ContainerAllocator& _alloc)
    : name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _name_type;
  _name_type name;




  typedef boost::shared_ptr< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> const> ConstPtr;

}; // struct NodeletUnloadRequest_

typedef ::nodelet::NodeletUnloadRequest_<std::allocator<void> > NodeletUnloadRequest;

typedef boost::shared_ptr< ::nodelet::NodeletUnloadRequest > NodeletUnloadRequestPtr;
typedef boost::shared_ptr< ::nodelet::NodeletUnloadRequest const> NodeletUnloadRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nodelet::NodeletUnloadRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace nodelet

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c1f3d28f1b044c871e6eff2e9fc3c667";
  }

  static const char* value(const ::nodelet::NodeletUnloadRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc1f3d28f1b044c87ULL;
  static const uint64_t static_value2 = 0x1e6eff2e9fc3c667ULL;
};

template<class ContainerAllocator>
struct DataType< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nodelet/NodeletUnloadRequest";
  }

  static const char* value(const ::nodelet::NodeletUnloadRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string name\n\
";
  }

  static const char* value(const ::nodelet::NodeletUnloadRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct NodeletUnloadRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nodelet::NodeletUnloadRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nodelet::NodeletUnloadRequest_<ContainerAllocator>& v)
  {
    s << indent << "name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NODELET_MESSAGE_NODELETUNLOADREQUEST_H
