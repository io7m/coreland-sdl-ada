with System;

package body SDL.Audio is
  use type C.int;

  function Byte_Order return  System.Bit_Order is
  begin
    return System.Default_Bit_Order;
  end Byte_Order;
  pragma Inline (Byte_Order);

  function Audio_U16SYS return Format_t is
    use type System.Bit_Order;
  begin
    if Byte_Order = System.Low_Order_First then
      return Audio_U16LSB;
    else
      return Audio_U16MSB;
    end if;
  end Audio_U16SYS;
  pragma Inline (Audio_U16SYS);

  function Audio_S16SYS return Format_t is
    use type System.Bit_Order;
  begin
    if Byte_Order = System.High_Order_First then
      return Audio_S16LSB;
    else
      return Audio_S16MSB;
    end if;
  end Audio_S16SYS;
  pragma Inline (Audio_S16SYS);

  -- Initializes a SDL_AudioCVT structure for conversion
  function BuildAudioCVT
   (CVT             : CVT_Access_t;
    Source_Format   : Format_t;
    Source_Channels : Positive;
    Source_Rate     : Positive;
    Target_Format   : Format_t;
    Target_Channels : Positive;
    Target_Rate     : Positive)
    return            Boolean
  is
    Return_Code : constant C.int :=
      BuildAudioCVT
       (CVT             => CVT,
        Source_Format   => Source_Format,
        Source_Channels => Uint8_t (Source_Channels),
        Source_Rate     => C.int (Source_Rate),
        Target_Format   => Target_Format,
        Target_Channels => Uint8_t (Target_Channels),
        Target_Rate     => C.int (Target_Rate));
  begin
    return Return_Code /= 0;
  end BuildAudioCVT;

  function ConvertAudio (CVT : CVT_Access_t) return Boolean is
    Return_Code : constant C.int := ConvertAudio (CVT);
  begin
    return Return_Code /= -1;
  end ConvertAudio;

  function OpenAudio (Desired : Spec_t; Obtained : Spec_Access_t) return Boolean is
    Return_Code : constant C.int := OpenAudio (Desired, Obtained);
  begin
    return Return_Code /= -1;
  end OpenAudio;

  procedure PauseAudio (Pause_On : Boolean) is
  begin
    if Pause_On then
      PauseAudio (C.int (1));
    else
      PauseAudio (C.int (0));
    end if;
  end PauseAudio;

end SDL.Audio;
