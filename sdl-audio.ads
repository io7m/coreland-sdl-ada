with interfaces.c.strings;

package SDL.audio is
  package cs renames interfaces.c.strings;

  -- Callback function for filling the audio buffer.
  type callback_t is
    access procedure (userdata: void_ptr_t; stream: uint8_ptr; len: c.int);

  -- Audio data format.
  type audio_format_t is new uint16;
  pragma convention (c, audio_format_t);

  AUDIO_U8:     constant audio_format_t := 16#0008#;
  AUDIO_S8:     constant audio_format_t := 16#8008#;
  AUDIO_U16LSB: constant audio_format_t := 16#0010#;
  AUDIO_S16LSB: constant audio_format_t := 16#8010#;
  AUDIO_U16MSB: constant audio_format_t := 16#1010#;
  AUDIO_S16MSB: constant audio_format_t := 16#9010#;
  AUDIO_U16:    constant audio_format_t := AUDIO_U16LSB;
  AUDIO_S16:    constant audio_format_t := AUDIO_S16LSB;

  function AUDIO_U16SYS return audio_format_t;
  function AUDIO_S16SYS return audio_format_t;

  -- Audio Specification Structure.
  type audio_spec_t is record
        freq: c.int;
      format: audio_format_t;
    channels: uint8;
     silence: uint8;
     samples: uint16;
        size: uint32;
    callback: callback_t;
    userdata: void_ptr_t;
  end record;
  type audio_spec_ptr_t is access all audio_spec_t;
  pragma convention (c, audio_spec_t);
  pragma convention (c, audio_spec_ptr_t);

  -- Get the current audio state.
  type audio_status_t is (
    AUDIO_STOPPED,
    AUDIO_PLAYING,
    AUDIO_PAUSED
  );
  for audio_status_t use (
    AUDIO_STOPPED => 0,
    AUDIO_PLAYING => 1,
    AUDIO_PAUSED => 2
  );
  pragma convention (c, audio_status_t);

  type audio_cvt_filter_t is access procedure (cvt: void_ptr_t; format: audio_format_t);
  pragma convention (c, audio_cvt_filter_t);
  type audio_cvt_filter_array_t is array (0 .. 9) of audio_cvt_filter_t;
  pragma convention (c, audio_cvt_filter_array_t);

  -- Audio Conversion Structure.
  type audio_cvt_t is record
          needed: c.int;
      src_format: audio_format_t;
      dst_format: audio_format_t;
       rate_incr: c.double;
             buf: uint8_ptr;
             len: c.int;
         len_cvt: c.int;
        len_mult: c.int;
       len_ratio: c.double;
         filters: audio_cvt_filter_array_t;
    filter_index: c.int;
  end record;
  type audio_cvt_ptr_t is access all audio_cvt_t;
  pragma convention (c, audio_cvt_t);
  pragma convention (c, audio_cvt_ptr_t);

  -- Shuts down audio processing and closes the audio device.
  procedure close;
  pragma import (c, close, "SDL_CloseAudio");

  -- Initializes an SDL_AudioCVT structure for conversion.
  function BuildAudioCVT (cvt: audio_cvt_ptr_t;
    src_format: audio_format_t; src_channels: uint8; src_rate: c.int;
    dst_format: audio_format_t; dst_channels: uint8; dst_rate: c.int) return c.int;
  function build_audio_cvt (cvt: audio_cvt_ptr_t;
    src_format: audio_format_t; src_channels: uint8; src_rate: c.int;
    dst_format: audio_format_t; dst_channels: uint8; dst_rate: c.int) return c.int renames BuildAudioCVT;
  pragma import (c, BuildAudioCVT, "SDL_BuildAudioCVT");

  function BuildAudioCVT (cvt: audio_cvt_ptr_t;
    src_format: audio_format_t; src_channels, src_rate: positive;
    dst_format: audio_format_t; dst_channels, dst_rate: positive) return boolean;
  function build_audio_cvt (cvt: audio_cvt_ptr_t;
    src_format: audio_format_t; src_channels, src_rate: positive;
    dst_format: audio_format_t; dst_channels, dst_rate: positive) return boolean renames BuildAudioCVT;
  pragma inline (BuildAudioCVT);

  -- Converts audio data to a desired audio format.
  function ConvertAudio (cvt: audio_cvt_ptr_t) return c.int;
  function convert_audio (cvt: audio_cvt_ptr_t) return c.int renames ConvertAudio;
  pragma import (c, ConvertAudio, "SDL_ConvertAudio");

  function ConvertAudio (cvt: audio_cvt_ptr_t) return boolean;
  function convert_audio (cvt: audio_cvt_ptr_t) return boolean renames ConvertAudio;
  pragma inline (ConvertAudio);

  -- Frees previously opened WAV data.
  procedure FreeWAV (audio_buf: uint8_ptr);
  procedure free_wav (audio_buf: uint8_ptr) renames FreeWAV;
  pragma import (c, FreeWAV, "SDL_FreeWAV");

  -- Get the current audio state.
  function GetAudioStatus return audio_status_t;
  function get_audio_status return audio_status_t renames GetAudioStatus;
  pragma import (c, GetAudioStatus, "SDL_GetAudioStatus");

  -- Loads a WAVE file.
  function LoadWAV (file: cs.chars_ptr; spec: audio_spec_ptr_t;
    audio_buf: access uint8_ptr; len: access uint32) return audio_spec_ptr_t;
  function LoadWAV (file: cs.chars_ptr; spec: audio_spec_t;
    audio_buf: access uint8_ptr; len: access uint32) return audio_spec_ptr_t;
  function load_wav (file: cs.chars_ptr; spec: audio_spec_ptr_t;
    audio_buf: access uint8_ptr; len: access uint32) return audio_spec_ptr_t renames LoadWAV;
  function load_wav (file: cs.chars_ptr; spec: audio_spec_t;
    audio_buf: access uint8_ptr; len: access uint32) return audio_spec_ptr_t renames LoadWAV;
  pragma import (c, LoadWAV, "SDL_LoadWAV");

  function load_wav (file: string; spec: audio_spec_t;
    audio_buf: access uint8_ptr; len: access uint32) return audio_spec_ptr_t;
  function LoadWAV (file: string; spec: audio_spec_t;
    audio_buf: access uint8_ptr; len: access uint32) return audio_spec_ptr_t;

  -- Locks out the callback function.
  procedure LockAudio;
  procedure lock_audio renames LockAudio;
  pragma import (c, LockAudio, "SDL_LockAudio");

  -- Mix audio data.
  procedure MixAudio (dst, src: uint8_ptr; len: uint32; volume: c.int);
  procedure mix_audio (dst, src: uint8_ptr; len: uint32; volume: c.int) renames MixAudio;
  pragma import (c, MixAudio, "SDL_MixAudio");

  -- Opens the audio device with the desired parameters.
  function OpenAudio (desired: audio_spec_t; obtained: audio_spec_ptr_t) return c.int;
  function open_audio (desired: audio_spec_t; obtained: audio_spec_ptr_t) return c.int renames OpenAudio;
  pragma import (c, OpenAudio, "SDL_OpenAudio");

  function OpenAudio (desired: audio_spec_t; obtained: audio_spec_ptr_t) return boolean;
  function open_audio (desired: audio_spec_t; obtained: audio_spec_ptr_t) return boolean renames OpenAudio;
  pragma inline (OpenAudio);
 
  -- Pauses and unpauses the audio callback processing.
  procedure PauseAudio (pause_on: c.int);
  procedure pause_audio (pause_on: c.int) renames PauseAudio;
  pragma import (c, PauseAudio, "SDL_PauseAudio");

  procedure PauseAudio (pause_on: boolean);
  procedure pause_audio (pause_on: boolean) renames PauseAudio;
  pragma inline (PauseAudio);

  -- Unlocks the callback function.
  procedure UnlockAudio;
  procedure unlock_audio renames UnlockAudio;
  pragma import (c, UnlockAudio, "SDL_UnlockAudio");

end SDL.audio;
