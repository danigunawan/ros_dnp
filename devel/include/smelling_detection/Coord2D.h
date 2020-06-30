// Generated by gencpp from file smelling_detection/Coord2D.msg
// DO NOT EDIT!


#ifndef SMELLING_DETECTION_MESSAGE_COORD2D_H
#define SMELLING_DETECTION_MESSAGE_COORD2D_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace smelling_detection
{
template <class ContainerAllocator>
struct Coord2D_
{
  typedef Coord2D_<ContainerAllocator> Type;

  Coord2D_()
    : x(0)
    , y(0)  {
    }
  Coord2D_(const ContainerAllocator& _alloc)
    : x(0)
    , y(0)  {
  (void)_alloc;
    }



   typedef int16_t _x_type;
  _x_type x;

   typedef int16_t _y_type;
  _y_type y;





  typedef boost::shared_ptr< ::smelling_detection::Coord2D_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::smelling_detection::Coord2D_<ContainerAllocator> const> ConstPtr;

}; // struct Coord2D_

typedef ::smelling_detection::Coord2D_<std::allocator<void> > Coord2D;

typedef boost::shared_ptr< ::smelling_detection::Coord2D > Coord2DPtr;
typedef boost::shared_ptr< ::smelling_detection::Coord2D const> Coord2DConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::smelling_detection::Coord2D_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::smelling_detection::Coord2D_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace smelling_detection

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'smelling_detection': ['/home/vision/work/computer_vision_projects/catkin_ws/src/smelling_detection/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::smelling_detection::Coord2D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::smelling_detection::Coord2D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::smelling_detection::Coord2D_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::smelling_detection::Coord2D_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::smelling_detection::Coord2D_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::smelling_detection::Coord2D_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::smelling_detection::Coord2D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d78a6b8c9650c754bf0432d3d1707c3";
  }

  static const char* value(const ::smelling_detection::Coord2D_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d78a6b8c9650c75ULL;
  static const uint64_t static_value2 = 0x4bf0432d3d1707c3ULL;
};

template<class ContainerAllocator>
struct DataType< ::smelling_detection::Coord2D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "smelling_detection/Coord2D";
  }

  static const char* value(const ::smelling_detection::Coord2D_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::smelling_detection::Coord2D_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 x\n\
int16 y\n\
";
  }

  static const char* value(const ::smelling_detection::Coord2D_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::smelling_detection::Coord2D_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Coord2D_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::smelling_detection::Coord2D_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::smelling_detection::Coord2D_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<int16_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int16_t>::stream(s, indent + "  ", v.y);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SMELLING_DETECTION_MESSAGE_COORD2D_H
