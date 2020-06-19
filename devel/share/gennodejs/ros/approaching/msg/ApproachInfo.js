// Auto-generated. Do not edit!

// (in-package approaching.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Coord = require('./Coord.js');

//-----------------------------------------------------------

class ApproachInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ids = null;
      this.coords = null;
      this.dists = null;
    }
    else {
      if (initObj.hasOwnProperty('ids')) {
        this.ids = initObj.ids
      }
      else {
        this.ids = [];
      }
      if (initObj.hasOwnProperty('coords')) {
        this.coords = initObj.coords
      }
      else {
        this.coords = [];
      }
      if (initObj.hasOwnProperty('dists')) {
        this.dists = initObj.dists
      }
      else {
        this.dists = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ApproachInfo
    // Serialize message field [ids]
    bufferOffset = _arraySerializer.string(obj.ids, buffer, bufferOffset, null);
    // Serialize message field [coords]
    // Serialize the length for message field [coords]
    bufferOffset = _serializer.uint32(obj.coords.length, buffer, bufferOffset);
    obj.coords.forEach((val) => {
      bufferOffset = Coord.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [dists]
    bufferOffset = _arraySerializer.float32(obj.dists, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ApproachInfo
    let len;
    let data = new ApproachInfo(null);
    // Deserialize message field [ids]
    data.ids = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [coords]
    // Deserialize array length for message field [coords]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.coords = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.coords[i] = Coord.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [dists]
    data.dists = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.ids.forEach((val) => {
      length += 4 + val.length;
    });
    length += 4 * object.coords.length;
    length += 4 * object.dists.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'approaching/ApproachInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f6fccf8aff213da9b738fdf6be5c98c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] ids
    Coord[] coords
    float32[] dists
    
    ================================================================================
    MSG: approaching/Coord
    int16 x
    int16 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ApproachInfo(null);
    if (msg.ids !== undefined) {
      resolved.ids = msg.ids;
    }
    else {
      resolved.ids = []
    }

    if (msg.coords !== undefined) {
      resolved.coords = new Array(msg.coords.length);
      for (let i = 0; i < resolved.coords.length; ++i) {
        resolved.coords[i] = Coord.Resolve(msg.coords[i]);
      }
    }
    else {
      resolved.coords = []
    }

    if (msg.dists !== undefined) {
      resolved.dists = msg.dists;
    }
    else {
      resolved.dists = []
    }

    return resolved;
    }
};

module.exports = ApproachInfo;
