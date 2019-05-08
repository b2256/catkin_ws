# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ublox_msgs/RxmSVSI_SV.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class RxmSVSI_SV(genpy.Message):
  _md5sum = "b58fccf5178b8e0d3921f5737e017cc6"
  _type = "ublox_msgs/RxmSVSI_SV"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# see message RxmSVSI
#

uint8 svid            # Satellite ID

uint8 svFlag          # Information Flags
uint8 FLAG_URA_MASK = 15      # Figure of Merit (URA) range 0..15
uint8 FLAG_HEALTHY = 16       # SV healthy flag
uint8 FLAG_EPH_VAL = 32       # Ephemeris valid
uint8 FLAG_ALM_VAL = 64       # Almanach valid
uint8 FLAG_NOT_AVAIL = 128    # SV not available

int16 azi             # Azimuth
int8 elev             # Elevation

uint8 age             # Age of Almanach and Ephemeris
uint8 AGE_ALM_MASK = 15       # Age of ALM in days offset by 4
                              # i.e. the reference time may be in the future:
                              # ageOfAlm = (age & 0x0f) - 4
uint8 AGE_EPH_MASK = 240      # Age of EPH in hours offset by 4.
                              # i.e. the reference time may be in the future:
                              # ageOfEph = ((age & 0xf0) >> 4) - 4
"""
  # Pseudo-constants
  FLAG_URA_MASK = 15
  FLAG_HEALTHY = 16
  FLAG_EPH_VAL = 32
  FLAG_ALM_VAL = 64
  FLAG_NOT_AVAIL = 128
  AGE_ALM_MASK = 15
  AGE_EPH_MASK = 240

  __slots__ = ['svid','svFlag','azi','elev','age']
  _slot_types = ['uint8','uint8','int16','int8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       svid,svFlag,azi,elev,age

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(RxmSVSI_SV, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.svid is None:
        self.svid = 0
      if self.svFlag is None:
        self.svFlag = 0
      if self.azi is None:
        self.azi = 0
      if self.elev is None:
        self.elev = 0
      if self.age is None:
        self.age = 0
    else:
      self.svid = 0
      self.svFlag = 0
      self.azi = 0
      self.elev = 0
      self.age = 0

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
      buff.write(_get_struct_2BhbB().pack(_x.svid, _x.svFlag, _x.azi, _x.elev, _x.age))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 6
      (_x.svid, _x.svFlag, _x.azi, _x.elev, _x.age,) = _get_struct_2BhbB().unpack(str[start:end])
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
      buff.write(_get_struct_2BhbB().pack(_x.svid, _x.svFlag, _x.azi, _x.elev, _x.age))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

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
      end += 6
      (_x.svid, _x.svFlag, _x.azi, _x.elev, _x.age,) = _get_struct_2BhbB().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2BhbB = None
def _get_struct_2BhbB():
    global _struct_2BhbB
    if _struct_2BhbB is None:
        _struct_2BhbB = struct.Struct("<2BhbB")
    return _struct_2BhbB
