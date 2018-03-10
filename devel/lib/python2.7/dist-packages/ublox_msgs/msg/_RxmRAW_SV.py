# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ublox_msgs/RxmRAW_SV.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class RxmRAW_SV(genpy.Message):
  _md5sum = "4b32efd29577416a2c280e629abcb69a"
  _type = "ublox_msgs/RxmRAW_SV"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# see message RxmRAW
#

float64 cpMes             # Carrier phase measurement [L1 cycles]
float64 prMes             # Pseudorange measurement [m]
float32 doMes             # Doppler measurement [Hz]

uint8 sv                  # Space Vehicle Number
int8 mesQI                # Nav Measurements Quality Indicator
                          #  >=4 : PR+DO OK
                          #  >=5 : PR+DO+CP OK
                          #  <6 : likely loss of carrier lock in previous interval
int8 cno                  # Signal strength C/No. [dbHz]
uint8 lli                 # Loss of lock indicator (RINEX definition)
"""
  __slots__ = ['cpMes','prMes','doMes','sv','mesQI','cno','lli']
  _slot_types = ['float64','float64','float32','uint8','int8','int8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       cpMes,prMes,doMes,sv,mesQI,cno,lli

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(RxmRAW_SV, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.cpMes is None:
        self.cpMes = 0.
      if self.prMes is None:
        self.prMes = 0.
      if self.doMes is None:
        self.doMes = 0.
      if self.sv is None:
        self.sv = 0
      if self.mesQI is None:
        self.mesQI = 0
      if self.cno is None:
        self.cno = 0
      if self.lli is None:
        self.lli = 0
    else:
      self.cpMes = 0.
      self.prMes = 0.
      self.doMes = 0.
      self.sv = 0
      self.mesQI = 0
      self.cno = 0
      self.lli = 0

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
      buff.write(_get_struct_2dfB2bB().pack(_x.cpMes, _x.prMes, _x.doMes, _x.sv, _x.mesQI, _x.cno, _x.lli))
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
      end += 24
      (_x.cpMes, _x.prMes, _x.doMes, _x.sv, _x.mesQI, _x.cno, _x.lli,) = _get_struct_2dfB2bB().unpack(str[start:end])
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
      buff.write(_get_struct_2dfB2bB().pack(_x.cpMes, _x.prMes, _x.doMes, _x.sv, _x.mesQI, _x.cno, _x.lli))
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
      end += 24
      (_x.cpMes, _x.prMes, _x.doMes, _x.sv, _x.mesQI, _x.cno, _x.lli,) = _get_struct_2dfB2bB().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_2dfB2bB = None
def _get_struct_2dfB2bB():
    global _struct_2dfB2bB
    if _struct_2dfB2bB is None:
        _struct_2dfB2bB = struct.Struct("<2dfB2bB")
    return _struct_2dfB2bB
