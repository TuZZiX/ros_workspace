"""autogenerated by genpy from my_commander/commandGoal.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class commandGoal(genpy.Message):
  _md5sum = "53cd9af5df1979f7569a863ed25939dc"
  _type = "my_commander/commandGoal"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#Goal messages
float64 amplitude	#magnitude of the sine wave
float64 frequency	#frequency of the sine wave
uint32 cycles		#numbers of cycles to run

"""
  __slots__ = ['amplitude','frequency','cycles']
  _slot_types = ['float64','float64','uint32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       amplitude,frequency,cycles

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(commandGoal, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.amplitude is None:
        self.amplitude = 0.
      if self.frequency is None:
        self.frequency = 0.
      if self.cycles is None:
        self.cycles = 0
    else:
      self.amplitude = 0.
      self.frequency = 0.
      self.cycles = 0

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
      _x = self
      buff.write(_struct_2dI.pack(_x.amplitude, _x.frequency, _x.cycles))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.amplitude, _x.frequency, _x.cycles,) = _struct_2dI.unpack(str[start:end])
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
      _x = self
      buff.write(_struct_2dI.pack(_x.amplitude, _x.frequency, _x.cycles))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 20
      (_x.amplitude, _x.frequency, _x.cycles,) = _struct_2dI.unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_2dI = struct.Struct("<2dI")
