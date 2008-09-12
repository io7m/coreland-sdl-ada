package sdl.audio is

  -- Callback function for filling the audio buffer.
  type callback_t is access procedure
   (userdata : void_ptr_t;
    stream   : uint8_ptr_t;
    length   : c.int);

  -- Audio data format.
  type format_t is new uint16_t;
  pragma convention (c, format_t);

  audio_u8     : constant format_t := 16#0008#;
  audio_s8     : constant format_t := 16#8008#;
  audio_u16lsb : constant format_t := 16#0010#;
  audio_s16lsb : constant format_t := 16#8010#;
  audio_u16msb : constant format_t := 16#1010#;
  audio_s16msb : constant format_t := 16#9010#;
  audio_u16    : constant format_t := audio_u16lsb;
  audio_s16    : constant format_t := audio_s16lsb;

  function audio_u16sys return format_t;
  function audio_s16sys return format_t;

  -- Audio Specification Structure.
  type spec_t is record
    freq     : c.int;
    format   : format_t;
    channels : uint8_t;
    silence  : uint8_t;
    samples  : uint16_t;
    size     : uint32_t;
    callback : callback_t;
    userdata : void_ptr_t;
  end record;
  type spec_access_t is access all spec_t;
  pragma convention (c, spec_t);
  pragma convention (c, spec_access_t);

  -- Get the current audio state.
  type status_t is (audio_stopped, audio_playing, audio_paused);
  for status_t use
   (audio_stopped => 0,
    audio_playing => 1,
    audio_paused  => 2);
  for status_t'size use c.unsigned'size;
  pragma convention (c, status_t);

  type cvt_filter_t is access procedure
   (cvt    : void_ptr_t;
    format : format_t);
  pragma convention (c, cvt_filter_t);
  type cvt_filter_array_t is array (0 .. 9) of cvt_filter_t;
  pragma convention (c, cvt_filter_array_t);

  -- Audio Conversion Structure.
  type cvt_t is record
    needed       : c.int;
    src_format   : format_t;
    dst_format   : format_t;
    rate_incr    : c.double;
    buf          : uint8_ptr_t;
    len          : c.int;
    len_cvt      : c.int;
    len_mult     : c.int;
    len_ratio    : c.double;
    filters      : cvt_filter_array_t;
    filter_index : c.int;
  end record;
  type cvt_access_t is access all cvt_t;
  pragma convention (c, cvt_t);
  pragma convention (c, cvt_access_t);

  -- Shuts down audio processing and closes the audio device.
  procedure close;
  pragma import (c, close, "SDL_CloseAudio");

  -- Initializes an SDL_AudioCVT structure for conversion.
  function buildaudiocvt
   (cvt          : cvt_access_t;
    src_format   : format_t;
    src_channels : uint8_t;
    src_rate     : c.int;
    dst_format   : format_t;
    dst_channels : uint8_t;
    dst_rate     : c.int) return c.int;

  function build_audio_cvt
   (cvt          : cvt_access_t;
    src_format   : format_t;
    src_channels : uint8_t;
    src_rate     : c.int;
    dst_format   : format_t;
    dst_channels : uint8_t;
    dst_rate     : c.int) return c.int renames buildaudiocvt;
  pragma import (c, buildaudiocvt, "SDL_BuildAudioCVT");

  function buildaudiocvt
   (cvt          : cvt_access_t;
    src_format   : format_t;
    src_channels : positive;
    src_rate     : positive;
    dst_format   : format_t;
    dst_channels : positive;
    dst_rate     : positive) return boolean;

  function build_audio_cvt
   (cvt          : cvt_access_t;
    src_format   : format_t;
    src_channels : positive;
    src_rate     : positive;
    dst_format   : format_t;
    dst_channels : positive;
    dst_rate     : positive) return boolean renames buildaudiocvt;
  pragma inline (buildaudiocvt);

  -- Converts audio data to a desired audio format.
  function convertaudio (cvt : cvt_access_t) return c.int;
  function convert_audio (cvt : cvt_access_t) return c.int renames convertaudio;
  pragma import (c, convertaudio, "SDL_ConvertAudio");

  function convertaudio (cvt : cvt_access_t) return boolean;
  function convert_audio (cvt : cvt_access_t) return boolean renames convertaudio;
  pragma inline (convertaudio);

  -- Frees previously opened WAV data.
  procedure freewav (audio_buf : uint8_ptr_t);
  procedure free_wav (audio_buf : uint8_ptr_t) renames freewav;
  pragma import (c, freewav, "SDL_FreeWAV");

  -- Get the current audio state.
  function getaudiostatus return status_t;
  function get_audio_status return status_t renames getaudiostatus;
  pragma import (c, getaudiostatus, "SDL_GetAudioStatus");

  -- missing: LoadWAV (macro wrapper)

  -- Locks out the callback function.
  procedure lockaudio;
  procedure lock_audio renames lockaudio;
  pragma import (c, lockaudio, "SDL_LockAudio");

  -- Mix audio data.
  procedure mixaudio
   (dst    : uint8_ptr_t;
    src    : uint8_ptr_t;
    len    : uint32_t;
    volume : c.int);

  procedure mix_audio
   (dst    : uint8_ptr_t;
    src    : uint8_ptr_t;
    len    : uint32_t;
    volume : c.int) renames mixaudio;
  pragma import (c, mixaudio, "SDL_MixAudio");

  -- Opens the audio device with the desired parameters.
  function openaudio
   (desired  : spec_t;
    obtained : spec_access_t) return c.int;

  function open_audio
   (desired  : spec_t;
    obtained : spec_access_t) return c.int renames openaudio;
  pragma import (c, openaudio, "SDL_OpenAudio");

  function openaudio
   (desired  : spec_t;
    obtained : spec_access_t) return boolean;

  function open_audio
   (desired  : spec_t;
    obtained : spec_access_t) return boolean renames openaudio;
  pragma inline (openaudio);

  -- Pauses and unpauses the audio callback processing.
  procedure pauseaudio (pause_on : c.int);
  procedure pause_audio (pause_on : c.int) renames pauseaudio;
  pragma import (c, pauseaudio, "SDL_PauseAudio");

  procedure pauseaudio (pause_on : boolean);
  procedure pause_audio (pause_on : boolean) renames pauseaudio;
  pragma inline (pauseaudio);

  -- Unlocks the callback function.
  procedure unlockaudio;
  procedure unlock_audio renames unlockaudio;
  pragma import (c, unlockaudio, "SDL_UnlockAudio");

end sdl.audio;
