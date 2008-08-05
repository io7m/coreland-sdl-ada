with system;

package body SDL.audio is
  use type c.int;

  function byte_order return system.bit_order is
  begin
    return system.default_bit_order;
  end byte_order;
  pragma inline (byte_order);

  function AUDIO_U16SYS return audio_format_t is
    use type system.bit_order;
  begin
    if byte_order = system.low_order_first then
      return AUDIO_U16LSB;
    else
      return AUDIO_U16MSB;
    end if;
  end AUDIO_U16SYS;
  pragma inline (AUDIO_U16SYS);

  function AUDIO_S16SYS return audio_format_t is
    use type system.bit_order;
  begin
    if byte_order = system.high_order_first then
      return AUDIO_S16LSB;
    else
      return AUDIO_S16MSB;
    end if;
  end AUDIO_S16SYS;
  pragma inline (AUDIO_S16SYS);

  -- Initializes a SDL_AudioCVT structure for conversion
  function BuildAudioCVT
    (cvt         : audio_cvt_ptr_t;
    src_format   : audio_format_t;
    src_channels : positive;
    src_rate     : positive;
    dst_format   : audio_format_t;
    dst_channels : positive;
    dst_rate     : positive) return boolean
  is
    ret: constant c.int :=
      BuildAudioCVT (cvt, src_format, uint8 (src_channels), c.int (src_rate), 
                          dst_format, uint8 (dst_channels), c.int (dst_rate));
  begin
    return ret /= 0;
  end BuildAudioCVT;

  function ConvertAudio (cvt: audio_cvt_ptr_t) return boolean is
    ret: constant c.int := ConvertAudio (cvt);
  begin
    return ret /= -1;
  end ConvertAudio;

  -- load wav with string param
  function load_wav
   (file      : string;
    spec      : audio_spec_t;
    audio_buf : access uint8_ptr;
    len       : access uint32) return audio_spec_ptr_t
  is
    ch_array : aliased c.char_array := c.to_c (file);
  begin
    return load_wav (cs.to_chars_ptr (ch_array'unchecked_access),
      spec, audio_buf, len);
  end load_wav;

  function OpenAudio
   (desired  : audio_spec_t;
    obtained : audio_spec_ptr_t) return boolean
  is
    ret : constant c.int := OpenAudio (desired, obtained);
  begin
    return ret /= -1;
  end OpenAudio;

  procedure PauseAudio (pause_on: boolean) is
  begin
    if pause_on then
      PauseAudio (c.int (1));
    else
      PauseAudio (c.int (0));
    end if;
  end PauseAudio;

end SDL.audio;
