with interfaces.c.strings;

package SDL.audio is
  package cs renames interfaces.c.strings;

  -- Callback function for filling the audio buffer.
  type callback_type is
    access procedure (userdata: void_ptr; stream: uint8_ptr; len: c.int);

  -- Audio data format.
  type audio_format is new uint16;
  pragma convention (c, audio_format);

  AUDIO_U8:     constant audio_format := 16#0008#;
  AUDIO_S8:     constant audio_format := 16#8008#;
  AUDIO_U16LSB: constant audio_format := 16#0010#;
  AUDIO_S16LSB: constant audio_format := 16#8010#;
  AUDIO_U16MSB: constant audio_format := 16#1010#;
  AUDIO_S16MSB: constant audio_format := 16#9010#;
  AUDIO_U16:    constant audio_format := AUDIO_U16LSB;
  AUDIO_S16:    constant audio_format := AUDIO_S16LSB;

  function AUDIO_U16SYS return audio_format;
  function AUDIO_S16SYS return audio_format;

  -- Audio Specification Structure.
  type AudioSpec is record
        freq: c.int;
      format: audio_format;
    channels: uint8;
     silence: uint8;
     samples: uint16;
        size: uint32;
    callback: callback_type;
    userdata: void_ptr;
  end record;
  type AudioSpec_ptr is access all AudioSpec;
  pragma convention (c, AudioSpec);
  pragma convention (c, AudioSpec_ptr);

  -- Get the current audio state.
  type audiostatus is (
    AUDIO_STOPPED,
    AUDIO_PLAYING,
    AUDIO_PAUSED
  );
  for audiostatus use (
    AUDIO_STOPPED => 0,
    AUDIO_PLAYING => 1,
    AUDIO_PAUSED => 2
  );
  pragma convention (c, audiostatus);

  type audio_cvt_filter is access procedure (cvt: void_ptr; format: audio_format);
  pragma convention (c, audio_cvt_filter);
  type audio_cvt_filter_array is array (0 .. 9) of audio_cvt_filter;
  pragma convention (c, audio_cvt_filter_array);

  -- Audio Conversion Structure.
  type AudioCVT is record
          needed: c.int;
      src_format: audio_format;
      dst_format: audio_format;
       rate_incr: c.double;
             buf: uint8_ptr;
             len: c.int;
         len_cvt: c.int;
        len_mult: c.int;
       len_ratio: c.double;
         filters: audio_cvt_filter_array;
    filter_index: c.int;
  end record;
  type AudioCVT_ptr is access all AudioCVT;
  pragma convention (c, AudioCVT);
  pragma convention (c, AudioCVT_ptr);

  -- Shuts down audio processing and closes the audio device.
  procedure close;
  pragma import (c, close, "SDL_CloseAudio");

  -- Initializes an SDL_AudioCVT structure for conversion.
  function BuildAudioCVT (cvt: AudioCVT_ptr;
    src_format: audio_format; src_channels: uint8; src_rate: c.int;
    dst_format: audio_format; dst_channels: uint8; dst_rate: c.int) return c.int;
  function build_audio_cvt (cvt: AudioCVT_ptr;
    src_format: audio_format; src_channels: uint8; src_rate: c.int;
    dst_format: audio_format; dst_channels: uint8; dst_rate: c.int) return c.int;
  pragma import (c, BuildAudioCVT, "SDL_BuildAudioCVT");
  pragma import (c, build_audio_cvt, "SDL_BuildAudioCVT");

  -- Converts audio data to a desired audio format.
  function ConvertAudio (cvt: AudioCVT_ptr) return c.int;
  function convert_audio (cvt: AudioCVT_ptr) return c.int;
  pragma import (c, ConvertAudio, "SDL_ConvertAudio");
  pragma import (c, convert_audio, "SDL_ConvertAudio");

  -- Frees previously opened WAV data.
  procedure freewav (audio_buf: uint8_ptr);
  procedure free_wav (audio_buf: uint8_ptr);
  pragma import (c, freewav, "SDL_FreeWAV");
  pragma import (c, free_wav, "SDL_FreeWAV");

  -- Get the current audio state.
  function GetAudioStatus return audiostatus;
  function get_audio_status return audiostatus;
  pragma import (c, GetAudioStatus, "SDL_GetAudioStatus");
  pragma import (c, get_audio_status, "SDL_GetAudioStatus");

  -- Loads a WAVE file.
  function loadwav (file: cs.chars_ptr; spec: audiospec_ptr;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr;
  function loadwav (file: cs.chars_ptr; spec: audiospec;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr;
  function load_wav (file: cs.chars_ptr; spec: audiospec_ptr;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr;
  function load_wav (file: cs.chars_ptr; spec: audiospec;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr;
  pragma import (c, loadwav, "SDL_LoadWAV");
  pragma import (c, load_wav, "SDL_LoadWAV");

  function load_wav (file: string; spec: audiospec;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr;
  function loadwav (file: string; spec: audiospec;
    audio_buf: access uint8_ptr; len: access uint32) return AudioSpec_ptr;

  -- Locks out the callback function.
  procedure LockAudio;
  procedure lock_audio;
  pragma import (c, LockAudio, "SDL_LockAudio");
  pragma import (c, lock_audio, "SDL_LockAudio");

  -- Mix audio data.
  procedure MixAudio (dst, src: uint8_ptr; len: uint32; volume: c.int);
  procedure mix_audio (dst, src: uint8_ptr; len: uint32; volume: c.int);
  pragma import (c, MixAudio, "SDL_MixAudio");
  pragma import (c, mix_audio, "SDL_MixAudio");

  -- Opens the audio device with the desired parameters.
  function OpenAudio (desired, obtained: AudioSpec_ptr) return c.int;
  function open_audio (desired, obtained: AudioSpec_ptr) return c.int;
  function OpenAudio (desired, obtained: AudioSpec) return c.int;
  function open_audio (desired, obtained: AudioSpec) return c.int;
  pragma import (c, OpenAudio, "SDL_OpenAudio");
  pragma import (c, open_audio, "SDL_OpenAudio");

  -- Pauses and unpauses the audio callback processing.
  procedure PauseAudio (pause_on: c.int);
  procedure pause_audio (pause_on: c.int);
  pragma import (c, PauseAudio, "SDL_PauseAudio");
  pragma import (c, pause_audio, "SDL_PauseAudio");

  -- Unlocks the callback function.
  procedure UnlockAudio;
  procedure unlock_audio;
  pragma import (c, UnlockAudio, "SDL_UnlockAudio");
  pragma import (c, unlock_audio, "SDL_UnlockAudio");

end SDL.audio;
