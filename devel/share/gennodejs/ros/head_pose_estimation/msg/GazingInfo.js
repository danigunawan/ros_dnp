// Auto-generated. Do not edit!

// (in-package head_pose_estimation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Coord2D = require('./Coord2D.js');

//-----------------------------------------------------------

class GazingInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.is_gazing = null;
      this.coords = null;
    }
    else {
      if (initObj.hasOwnProperty('is_gazing')) {
        this.is_gazing = initObj.is_gazing
      }
      else {
        this.is_gazing = [];
      }
      if (initObj.hasOwnProperty('coords')) {
        this.coords = initObj.coords
      }
      else {
        this.coords = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GazingInfo
    // Serialize message field [is_gazing]
    bufferOffset = _arraySerializer.bool(obj.is_gazing, buffer, bufferOffset, null);
    // Serialize message field [coords]
    // Serialize the length for message field [coords]
    bufferOffset = _serializer.uint32(obj.coords.length, buffer, bufferOffset);
    obj.coords.forEach((val) => {
      bufferOffset = Coord2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GazingInfo
    let len;
    let data = new GazingInfo(null);
    // Deserialize message field [is_gazing]
    data.is_gazing = _arrayDeserializer.bool(buffer, bufferOffset, null)
    // Deserialize message field [coords]
    // Deserialize array length for message field [coords]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.coords = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.coords[i] = Coord2D.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.is_gazing.length;
    length += 4 * object.coords.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'head_pose_estimation/GazingInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ab56e55ea0d34f912262cded1f939fc7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[] is_gazing
    Coord2D[] coords
    
    ================================================================================
    MSG: head_pose_estimation/Coord2D
    int16 x
    int16 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GazingInfo(null);
    if (msg.is_gazing !== undefined) {
      resolved.is_gazing = msg.is_gazing;
    }
    else {
      resolved.is_gazing = []
    }

    if (msg.coords !== undefined) {
      resolved.coords = new Array(msg.coords.length);
      for (let i = 0; i < resolved.coords.length; ++i) {
        resolved.coords[i] = Coord2D.Resolve(msg.coords[i]);
      }
    }
    else {
      resolved.coords = []
    }

    return resolved;
    }
};

module.exports = GazingInfo;
