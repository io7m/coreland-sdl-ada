with system;

package body sdl.audio is
  use type c.int;

  function byte_order return system.bit_order is
  begin
    return system.default_bit_order;
  end byte_order;
  pragma inline (byte_order);

  function audio_u16sys return format_t is
    use type system.bit_order;
  begin
    if byte_order = system.low_order_first then
      return audio_u16lsb;
    else
      return audio_u16msb;
    end if;
  end audio_u16sys;
  pragma inline (audio_u16sys);

  function audio_s16sys return format_t is
    use type system.bit_order;
  begin
    if byte_order = system.high_order_first then
      return audio_s16lsb;
    else
      return audio_s16msb;
    end if;
  end audio_s16sys;
  pragma inline (audio_s16sys);

  -- Initializes a SDL_AudioCVT structure for conversion
  function buildaudiocvt
   (cvt          : cvt_access_t;
    src_format   : format_t;
    src_channels : positive;
    src_rate     : positive;
    dst_format   : format_t;
    dst_channels : positive;
    dst_rate     : positive) return boolean
  is
    ret : constant c.int := buildaudiocvt
      (cvt          => cvt,
       src_format   => src_format,
       src_channels => uint8_t (src_channels),
       src_rate     => c.int (src_rate),
       dst_format   => dst_format,
       dst_channels => uint8_t (dst_channels),
       dst_rate     => c.int (dst_rate));
  begin
    return ret /= 0;
  end buildaudiocvt;

  function convertaudio (cvt : cvt_access_t) return boolean is
    ret : constant c.int := convertaudio (cvt);
  begin
    return ret /= -1;
  end convertaudio;

  function openaudio
   (desired  : spec_t;
    obtained : spec_access_t) return boolean
  is
    ret : constant c.int := openaudio (desired, obtained);
  begin
    return ret /= -1;
  end openaudio;

  procedure pauseaudio (pause_on : boolean) is
  begin
    if pause_on then
      pauseaudio (c.int (1));
    else
      pauseaudio (c.int (0));
    end if;
  end pauseaudio;

end sdl.audio;
