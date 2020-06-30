// Auto-generated. Do not edit!

// (in-package smelling_detection.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Coord2D = require('./Coord2D.js');

//-----------------------------------------------------------

class PickingInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.is_pick = null;
      this.coords = null;
    }
    else {
      if (initObj.hasOwnProperty('is_pick')) {
        this.is_pick = initObj.is_pick
      }
      else {
        this.is_pick = [];
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
    // Serializes a message object of type PickingInfo
    // Serialize message field [is_pick]
    bufferOffset = _arraySerializer.bool(obj.is_pick, buffer, bufferOffset, null);
    // Serialize message field [coords]
    // Serialize the length for message field [coords]
    bufferOffset = _serializer.uint32(obj.coords.length, buffer, bufferOffset);
    obj.coords.forEach((val) => {
      bufferOffset = Coord2D.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PickingInfo
    let len;
    let data = new PickingInfo(null);
    // Deserialize message field [is_pick]
    data.is_pick = _arrayDeserializer.bool(buffer, bufferOffset, null)
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
    length += object.is_pick.length;
    length += 4 * object.coords.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'smelling_detection/PickingInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4cd6626278c83bec5ea5cc54e9e1e510';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool[] is_pick
    Coord2D[] coords
    
    ================================================================================
    MSG: smelling_detection/Coord2D
    int16 x
    int16 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PickingInfo(null);
    if (msg.is_pick !== undefined) {
      resolved.is_pick = msg.is_pick;
    }
    else {
      resolved.is_pick = []
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

module.exports = PickingInfo;
