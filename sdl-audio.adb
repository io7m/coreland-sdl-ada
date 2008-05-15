with system;

package body SDL.audio is

  function byte_order return system.bit_order is
  begin
    return system.default_bit_order;
  end byte_order;
  pragma inline (byte_order);

  function AUDIO_U16SYS return audio_format is
    use type system.bit_order;
  begin
    if byte_order = system.low_order_first then
      return AUDIO_U16LSB;
    else
      return AUDIO_U16MSB;
    end if;
  end AUDIO_U16SYS;
  pragma inline (AUDIO_U16SYS);

  function AUDIO_S16SYS return audio_format is
    use type system.bit_order;
  begin
    if byte_order = system.high_order_first then
      return AUDIO_S16LSB;
    else
      return AUDIO_S16MSB;
    end if;
  end AUDIO_S16SYS;
  pragma inline (AUDIO_S16SYS);

  -- load wav with string param
  function load_wav (file: string; spec: audiospec;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr is
  begin
    return load_wav (cs.new_string (file), spec, audio_buf, len);
  end load_wav;

  -- load wav with string param
  function LoadWAV (file: string; spec: audiospec;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr is
  begin
    return LoadWAV (cs.new_string (file), spec, audio_buf, len);
  end LoadWAV;

end SDL.audio;
