"""autogenerated by genpy from dynamixel_msgs/MotorStateList.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import dynamixel_msgs.msg

class MotorStateList(genpy.Message):
  _md5sum = "9e94ccf6563ca78afce19eb097f9343c"
  _type = "dynamixel_msgs/MotorStateList"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """MotorState[] motor_states

================================================================================
MSG: dynamixel_msgs/MotorState
float64 timestamp   # motor state is at this time
int32 id            # motor id
int32 goal          # commanded position (in encoder units)
int32 position      # current position (in encoder units)
int32 error         # difference between current and goal positions
int32 speed         # current speed (0.111 rpm per unit)
float64 load        # current load - ratio of applied torque over maximum torque
float64 voltage     # current voltage (V)
int32 temperature   # current temperature (degrees Celsius)
bool moving         # whether the motor is currently in motion

"""
  __slots__ = ['motor_states']
  _slot_types = ['dynamixel_msgs/MotorState[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       motor_states

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(MotorStateList, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.motor_states is None:
        self.motor_states = []
    else:
      self.motor_states = []

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      length = len(self.motor_states)
      buff.write(_struct_I.pack(length))
      for val1 in self.motor_states:
        _x = val1
        buff.write(_struct_d5i2diB.pack(_x.timestamp, _x.id, _x.goal, _x.position, _x.error, _x.speed, _x.load, _x.voltage, _x.temperature, _x.moving))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.motor_states is None:
        self.motor_states = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.motor_states = []
      for i in range(0, length):
        val1 = dynamixel_msgs.msg.MotorState()
        _x = val1
        start = end
        end += 49
        (_x.timestamp, _x.id, _x.goal, _x.position, _x.error, _x.speed, _x.load, _x.voltage, _x.temperature, _x.moving,) = _struct_d5i2diB.unpack(str[start:end])
        val1.moving = bool(val1.moving)
        self.motor_states.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      length = len(self.motor_states)
      buff.write(_struct_I.pack(length))
      for val1 in self.motor_states:
        _x = val1
        buff.write(_struct_d5i2diB.pack(_x.timestamp, _x.id, _x.goal, _x.position, _x.error, _x.speed, _x.load, _x.voltage, _x.temperature, _x.moving))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.motor_states is None:
        self.motor_states = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.motor_states = []
      for i in range(0, length):
        val1 = dynamixel_msgs.msg.MotorState()
        _x = val1
        start = end
        end += 49
        (_x.timestamp, _x.id, _x.goal, _x.position, _x.error, _x.speed, _x.load, _x.voltage, _x.temperature, _x.moving,) = _struct_d5i2diB.unpack(str[start:end])
        val1.moving = bool(val1.moving)
        self.motor_states.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_d5i2diB = struct.Struct("<d5i2diB")
