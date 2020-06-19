// Auto-generated. Do not edit!

// (in-package smelling_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Rectangle = require('./Rectangle.js');

//-----------------------------------------------------------

class ObjectStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.exists = null;
      this.objects = null;
      this.object_rect = null;
    }
    else {
      if (initObj.hasOwnProperty('exists')) {
        this.exists = initObj.exists
      }
      else {
        this.exists = [];
      }
      if (initObj.hasOwnProperty('objects')) {
        this.objects = initObj.objects
      }
      else {
        this.objects = [];
      }
      if (initObj.hasOwnProperty('object_rect')) {
        this.object_rect = initObj.object_rect
      }
      else {
        this.object_rect = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ObjectStatus
    // Serialize message field [exists]
    bufferOffset = _arraySerializer.bool(obj.exists, buffer, bufferOffset, null);
    // Serialize message field [objects]
    bufferOffset = _arraySerializer.string(obj.objects, buffer, bufferOffset, null);
    // Serialize message field [object_rect]
    // Serialize the length for message field [object_rect]
    bufferOffset = _serializer.uint32(obj.object_rect.length, buffer, bufferOffset);
    obj.object_rect.forEach((val) => {
      bufferOffset = Rectangle.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ObjectStatus
    let len;
    let data = new ObjectStatus(null);
    // Deserialize message field [exists]
    data.exists = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [objects]
    data.objects = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [object_rect]
    // Deserialize array length for message field [object_rect]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.object_rect = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.object_rect[i] = Rectangle.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.exists.length;
    object.objects.forEach((val) => {
      length += 4 + val.length;
    });
    length += 8 * object.object_rect.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'smelling_detection/ObjectStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ec083db445abfdb1937e2845ae57c0ea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[] exists
    string[] objects
    Rectangle[] object_rect
    
    ================================================================================
    MSG: smelling_detection/Rectangle
    int16 x1
    int16 y1
    int16 x2
    int16 y2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ObjectStatus(null);
    if (msg.exists !== undefined) {
      resolved.exists = msg.exists;
    }
    else {
      resolved.exists = []
    }

    if (msg.objects !== undefined) {
      resolved.objects = msg.objects;
    }
    else {
      resolved.objects = []
    }

    if (msg.object_rect !== undefined) {
      resolved.object_rect = new Array(msg.object_rect.length);
      for (let i = 0; i < resolved.object_rect.length; ++i) {
        resolved.object_rect[i] = Rectangle.Resolve(msg.object_rect[i]);
      }
    }
    else {
      resolved.object_rect = []
    }

    return resolved;
    }
};

module.exports = ObjectStatus;
