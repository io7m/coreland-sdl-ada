package SDL.Audio is

  -- Callback function for filling the audio buffer.
  type Callback_t is access procedure (User_Data : Void_Ptr_t; Stream : Uint8_Ptr_t; Length : C.int);

  -- Audio data format.
  type Format_t is new Uint16_t;
  pragma Convention (C, Format_t);

  Audio_U8     : constant Format_t := 16#0008#;
  Audio_S8     : constant Format_t := 16#8008#;
  Audio_U16LSB : constant Format_t := 16#0010#;
  Audio_S16LSB : constant Format_t := 16#8010#;
  Audio_U16MSB : constant Format_t := 16#1010#;
  Audio_S16MSB : constant Format_t := 16#9010#;
  Audio_U16    : constant Format_t := Audio_U16LSB;
  Audio_S16    : constant Format_t := Audio_S16LSB;

  function Audio_U16SYS return Format_t;
  function Audio_S16SYS return Format_t;

  -- Audio Specification Structure.
  type Spec_t is record
    Freq      : C.int;
    Format    : Format_t;
    Channels  : Uint8_t;
    Silence   : Uint8_t;
    Samples   : Uint16_t;
    Size      : Uint32_t;
    Callback  : Callback_t;
    User_Data : Void_Ptr_t;
  end record;
  type Spec_Access_t is access all Spec_t;
  pragma Convention (C, Spec_t);
  pragma Convention (C, Spec_Access_t);

  -- Get the current audio state.
  type Status_t is (Audio_Stopped, Audio_Playing, Audio_Paused);
  for Status_t use (Audio_Stopped => 0, Audio_Playing => 1, Audio_Paused => 2);
  for Status_t'Size use C.unsigned'Size;
  pragma Convention (C, Status_t);

  type CVT_Filter_t is access procedure (CVT : Void_Ptr_t; Format : Format_t);
  pragma Convention (C, CVT_Filter_t);

  type CVT_Filter_Array_t is array (0 .. 9) of CVT_Filter_t;
  pragma Convention (C, CVT_Filter_Array_t);

  -- Audio Conversion Structure.
  type CVT_t is record
    Needed        : C.int;
    Source_Format : Format_t;
    Target_Format : Format_t;
    Rate_Incr     : C.double;
    Buf           : Uint8_Ptr_t;
    Len           : C.int;
    Len_CVT       : C.int;
    Len_Mult      : C.int;
    Len_Ratio     : C.double;
    Filters       : CVT_Filter_Array_t;
    Filter_Index  : C.int;
  end record;
  type CVT_Access_t is access all CVT_t;
  pragma Convention (C, CVT_t);
  pragma Convention (C, CVT_Access_t);

  -- Shuts down audio processing and closes the audio device.
  procedure Close;
  pragma Import (C, Close, "SDL_CloseAudio");

  -- Initializes an SDL_AudioCVT structure for conversion.
  function BuildAudioCVT
   (CVT             : CVT_Access_t;
    Source_Format   : Format_t;
    Source_Channels : Uint8_t;
    Source_Rate     : C.int;
    Target_Format   : Format_t;
    Target_Channels : Uint8_t;
    Target_Rate     : C.int)
    return            C.int;

  function Build_Audio_CVT
   (CVT             : CVT_Access_t;
    Source_Format   : Format_t;
    Source_Channels : Uint8_t;
    Source_Rate     : C.int;
    Target_Format   : Format_t;
    Target_Channels : Uint8_t;
    Target_Rate     : C.int)
    return            C.int renames BuildAudioCVT;
  pragma Import (C, BuildAudioCVT, "SDL_BuildAudioCVT");

  function BuildAudioCVT
   (CVT             : CVT_Access_t;
    Source_Format   : Format_t;
    Source_Channels : Positive;
    Source_Rate     : Positive;
    Target_Format   : Format_t;
    Target_Channels : Positive;
    Target_Rate     : Positive)
    return            Boolean;

  function Build_Audio_CVT
   (CVT             : CVT_Access_t;
    Source_Format   : Format_t;
    Source_Channels : Positive;
    Source_Rate     : Positive;
    Target_Format   : Format_t;
    Target_Channels : Positive;
    Target_Rate     : Positive)
    return            Boolean renames BuildAudioCVT;
  pragma Inline (Buildaudiocvt);

  -- Converts audio data to a desired audio format.
  function ConvertAudio (CVT : CVT_Access_t) return C.int;
  function Convert_Audio (CVT : CVT_Access_t) return C.int renames ConvertAudio;
  pragma Import (C, ConvertAudio, "SDL_ConvertAudio");

  function ConvertAudio (CVT : CVT_Access_t) return Boolean;
  function Convert_Audio (CVT : CVT_Access_t) return Boolean renames ConvertAudio;
  pragma Inline (Convertaudio);

  -- Frees previously opened WAV data.
  procedure FreeWAV (Audio_Buf : Uint8_Ptr_t);
  procedure Free_Wav (Audio_Buf : Uint8_Ptr_t) renames FreeWAV;
  pragma Import (C, FreeWAV, "SDL_FreeWAV");

  -- Get the current audio state.
  function GetAudioStatus return Status_t;
  function Get_Audio_Status return Status_t renames GetAudioStatus;
  pragma Import (C, GetAudioStatus, "SDL_GetAudioStatus");

  -- missing: LoadWAV (macro wrapper)

-- Locks out the callback function.
  procedure LockAudio;
  procedure Lock_Audio renames LockAudio;
  pragma Import (C, LockAudio, "SDL_LockAudio");

  -- Mix audio data.
  procedure Mixaudio
   (Target : Uint8_Ptr_t;
    Source : Uint8_Ptr_t;
    Len    : Uint32_t;
    Volume : C.int);

  procedure Mix_Audio
   (Target : Uint8_Ptr_t;
    Source : Uint8_Ptr_t;
    Len    : Uint32_t;
    Volume : C.int) renames Mixaudio;
  pragma Import (C, Mixaudio, "SDL_MixAudio");

  -- Opens the audio device with the desired parameters.
  function OpenAudio (Desired : Spec_t; Obtained : Spec_Access_t) return C.int;

  function Open_Audio (Desired : Spec_t; Obtained : Spec_Access_t) return C.int renames OpenAudio;
  pragma Import (C, OpenAudio, "SDL_OpenAudio");

  function OpenAudio (Desired : Spec_t; Obtained : Spec_Access_t) return Boolean;

  function Open_Audio (Desired : Spec_t; Obtained : Spec_Access_t) return Boolean renames OpenAudio;
  pragma Inline (Openaudio);

  -- Pauses and unpauses the audio callback processing.
  procedure PauseAudio (Pause_On : C.int);
  procedure Pause_Audio (Pause_On : C.int) renames PauseAudio;
  pragma Import (C, PauseAudio, "SDL_PauseAudio");

  procedure PauseAudio (Pause_On : Boolean);
  procedure Pause_Audio (Pause_On : Boolean) renames PauseAudio;
  pragma Inline (Pauseaudio);

  -- Unlocks the callback function.
  procedure UnlockAudio;
  procedure Unlock_Audio renames UnlockAudio;
  pragma Import (C, UnlockAudio, "SDL_UnlockAudio");

end SDL.Audio;
