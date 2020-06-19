// Auto-generated. Do not edit!

// (in-package smelling_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Rectangle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x1 = null;
      this.y1 = null;
      this.x2 = null;
      this.y2 = null;
    }
    else {
      if (initObj.hasOwnProperty('x1')) {
        this.x1 = initObj.x1
      }
      else {
        this.x1 = 0;
      }
      if (initObj.hasOwnProperty('y1')) {
        this.y1 = initObj.y1
      }
      else {
        this.y1 = 0;
      }
      if (initObj.hasOwnProperty('x2')) {
        this.x2 = initObj.x2
      }
      else {
        this.x2 = 0;
      }
      if (initObj.hasOwnProperty('y2')) {
        this.y2 = initObj.y2
      }
      else {
        this.y2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Rectangle
    // Serialize message field [x1]
    bufferOffset = _serializer.int16(obj.x1, buffer, bufferOffset);
    // Serialize message field [y1]
    bufferOffset = _serializer.int16(obj.y1, buffer, bufferOffset);
    // Serialize message field [x2]
    bufferOffset = _serializer.int16(obj.x2, buffer, bufferOffset);
    // Serialize message field [y2]
    bufferOffset = _serializer.int16(obj.y2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Rectangle
    let len;
    let data = new Rectangle(null);
    // Deserialize message field [x1]
    data.x1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [y1]
    data.y1 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [x2]
    data.x2 = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [y2]
    data.y2 = _deserializer.int16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'smelling_detection/Rectangle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '941a022bd67bae4c5b403bdabd31e17c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new Rectangle(null);
    if (msg.x1 !== undefined) {
      resolved.x1 = msg.x1;
    }
    else {
      resolved.x1 = 0
    }

    if (msg.y1 !== undefined) {
      resolved.y1 = msg.y1;
    }
    else {
      resolved.y1 = 0
    }

    if (msg.x2 !== undefined) {
      resolved.x2 = msg.x2;
    }
    else {
      resolved.x2 = 0
    }

    if (msg.y2 !== undefined) {
      resolved.y2 = msg.y2;
    }
    else {
      resolved.y2 = 0
    }

    return resolved;
    }
};

module.exports = Rectangle;
