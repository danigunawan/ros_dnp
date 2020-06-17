// Generated by gencpp from file tfpose_ros/BodyPartElm.msg
// DO NOT EDIT!


#ifndef TFPOSE_ROS_MESSAGE_BODYPARTELM_H
#define TFPOSE_ROS_MESSAGE_BODYPARTELM_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace tfpose_ros
{
template <class ContainerAllocator>
struct BodyPartElm_
{
  typedef BodyPartElm_<ContainerAllocator> Type;

  BodyPartElm_()
    : part_id(0)
    , x(0.0)
    , y(0.0)
    , confidence(0.0)  {
    }
  BodyPartElm_(const ContainerAllocator& _alloc)
    : part_id(0)
    , x(0.0)
    , y(0.0)
    , confidence(0.0)  {
  (void)_alloc;
    }



   typedef uint32_t _part_id_type;
  _part_id_type part_id;

   typedef float _x_type;
  _x_type x;

   typedef float _y_type;
  _y_type y;

   typedef float _confidence_type;
  _confidence_type confidence;





  typedef boost::shared_ptr< ::tfpose_ros::BodyPartElm_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::tfpose_ros::BodyPartElm_<ContainerAllocator> const> ConstPtr;

}; // struct BodyPartElm_

typedef ::tfpose_ros::BodyPartElm_<std::allocator<void> > BodyPartElm;

typedef boost::shared_ptr< ::tfpose_ros::BodyPartElm > BodyPartElmPtr;
typedef boost::shared_ptr< ::tfpose_ros::BodyPartElm const> BodyPartElmConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::tfpose_ros::BodyPartElm_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace tfpose_ros

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'tfpose_ros': ['/home/vision/work/computer_vision_projects/catkin_ws/src/hand-waving/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::tfpose_ros::BodyPartElm_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::tfpose_ros::BodyPartElm_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::tfpose_ros::BodyPartElm_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "3c847bcc3820e970f5a4eb4a79b2b4d7";
  }

  static const char* value(const ::tfpose_ros::BodyPartElm_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x3c847bcc3820e970ULL;
  static const uint64_t static_value2 = 0xf5a4eb4a79b2b4d7ULL;
};

template<class ContainerAllocator>
struct DataType< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "tfpose_ros/BodyPartElm";
  }

  static const char* value(const ::tfpose_ros::BodyPartElm_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint32 part_id\n\
float32 x\n\
float32 y\n\
float32 confidence\n\
";
  }

  static const char* value(const ::tfpose_ros::BodyPartElm_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.part_id);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.confidence);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BodyPartElm_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::tfpose_ros::BodyPartElm_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::tfpose_ros::BodyPartElm_<ContainerAllocator>& v)
  {
    s << indent << "part_id: ";
    Printer<uint32_t>::stream(s, indent + "  ", v.part_id);
    s << indent << "x: ";
    Printer<float>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<float>::stream(s, indent + "  ", v.y);
    s << indent << "confidence: ";
    Printer<float>::stream(s, indent + "  ", v.confidence);
  }
};

} // namespace message_operations
} // namespace ros

#endif // TFPOSE_ROS_MESSAGE_BODYPARTELM_H
