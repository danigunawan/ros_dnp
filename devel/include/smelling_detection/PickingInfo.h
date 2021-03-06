// Generated by gencpp from file smelling_detection/PickingInfo.msg
// DO NOT EDIT!


#ifndef SMELLING_DETECTION_MESSAGE_PICKINGINFO_H
#define SMELLING_DETECTION_MESSAGE_PICKINGINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <smelling_detection/Coord2D.h>

namespace smelling_detection
{
template <class ContainerAllocator>
struct PickingInfo_
{
  typedef PickingInfo_<ContainerAllocator> Type;

  PickingInfo_()
    : is_pick()
    , coords()  {
    }
  PickingInfo_(const ContainerAllocator& _alloc)
    : is_pick(_alloc)
    , coords(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<uint8_t, typename ContainerAllocator::template rebind<uint8_t>::other >  _is_pick_type;
  _is_pick_type is_pick;

   typedef std::vector< ::smelling_detection::Coord2D_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::smelling_detection::Coord2D_<ContainerAllocator> >::other >  _coords_type;
  _coords_type coords;





  typedef boost::shared_ptr< ::smelling_detection::PickingInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::smelling_detection::PickingInfo_<ContainerAllocator> const> ConstPtr;

}; // struct PickingInfo_

typedef ::smelling_detection::PickingInfo_<std::allocator<void> > PickingInfo;

typedef boost::shared_ptr< ::smelling_detection::PickingInfo > PickingInfoPtr;
typedef boost::shared_ptr< ::smelling_detection::PickingInfo const> PickingInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::smelling_detection::PickingInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::smelling_detection::PickingInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace smelling_detection

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'smelling_detection': ['/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::smelling_detection::PickingInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::smelling_detection::PickingInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::smelling_detection::PickingInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::smelling_detection::PickingInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::smelling_detection::PickingInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::smelling_detection::PickingInfo_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::smelling_detection::PickingInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4cd6626278c83bec5ea5cc54e9e1e510";
  }

  static const char* value(const ::smelling_detection::PickingInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4cd6626278c83becULL;
  static const uint64_t static_value2 = 0x5ea5cc54e9e1e510ULL;
};

template<class ContainerAllocator>
struct DataType< ::smelling_detection::PickingInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "smelling_detection/PickingInfo";
  }

  static const char* value(const ::smelling_detection::PickingInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::smelling_detection::PickingInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool[] is_pick\n\
Coord2D[] coords\n\
\n\
================================================================================\n\
MSG: smelling_detection/Coord2D\n\
int16 x\n\
int16 y\n\
";
  }

  static const char* value(const ::smelling_detection::PickingInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::smelling_detection::PickingInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.is_pick);
      stream.next(m.coords);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PickingInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::smelling_detection::PickingInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::smelling_detection::PickingInfo_<ContainerAllocator>& v)
  {
    s << indent << "is_pick[]" << std::endl;
    for (size_t i = 0; i < v.is_pick.size(); ++i)
    {
      s << indent << "  is_pick[" << i << "]: ";
      Printer<uint8_t>::stream(s, indent + "  ", v.is_pick[i]);
    }
    s << indent << "coords[]" << std::endl;
    for (size_t i = 0; i < v.coords.size(); ++i)
    {
      s << indent << "  coords[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::smelling_detection::Coord2D_<ContainerAllocator> >::stream(s, indent + "    ", v.coords[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SMELLING_DETECTION_MESSAGE_PICKINGINFO_H
