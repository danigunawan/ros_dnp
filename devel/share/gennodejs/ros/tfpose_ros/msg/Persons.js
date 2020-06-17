// Auto-generated. Do not edit!

// (in-package tfpose_ros.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Person = require('./Person.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Persons {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.persons = null;
      this.image_w = null;
      this.image_h = null;
      this.header = null;
    }
    else {
      if (initObj.hasOwnProperty('persons')) {
        this.persons = initObj.persons
      }
      else {
        this.persons = [];
      }
      if (initObj.hasOwnProperty('image_w')) {
        this.image_w = initObj.image_w
      }
      else {
        this.image_w = 0;
      }
      if (initObj.hasOwnProperty('image_h')) {
        this.image_h = initObj.image_h
      }
      else {
        this.image_h = 0;
      }
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Persons
    // Serialize message field [persons]
    // Serialize the length for message field [persons]
    bufferOffset = _serializer.uint32(obj.persons.length, buffer, bufferOffset);
    obj.persons.forEach((val) => {
      bufferOffset = Person.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [image_w]
    bufferOffset = _serializer.uint32(obj.image_w, buffer, bufferOffset);
    // Serialize message field [image_h]
    bufferOffset = _serializer.uint32(obj.image_h, buffer, bufferOffset);
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Persons
    let len;
    let data = new Persons(null);
    // Deserialize message field [persons]
    // Deserialize array length for message field [persons]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.persons = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.persons[i] = Person.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [image_w]
    data.image_w = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [image_h]
    data.image_h = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.persons.forEach((val) => {
      length += Person.getMessageSize(val);
    });
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tfpose_ros/Persons';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '599d56444c93fa962e2fbdbd99eb4501';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Person[] persons
    uint32 image_w
    uint32 image_h
    Header header
    ================================================================================
    MSG: tfpose_ros/Person
    BodyPartElm[] body_part
    ================================================================================
    MSG: tfpose_ros/BodyPartElm
    uint32 part_id
    float32 x
    float32 y
    float32 confidence
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    # 0: no frame
    # 1: global frame
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Persons(null);
    if (msg.persons !== undefined) {
      resolved.persons = new Array(msg.persons.length);
      for (let i = 0; i < resolved.persons.length; ++i) {
        resolved.persons[i] = Person.Resolve(msg.persons[i]);
      }
    }
    else {
      resolved.persons = []
    }

    if (msg.image_w !== undefined) {
      resolved.image_w = msg.image_w;
    }
    else {
      resolved.image_w = 0
    }

    if (msg.image_h !== undefined) {
      resolved.image_h = msg.image_h;
    }
    else {
      resolved.image_h = 0
    }

    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    return resolved;
    }
};

module.exports = Persons;
