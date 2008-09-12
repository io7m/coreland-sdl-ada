with interfaces.c;
with system;

package sdl is
  package c renames interfaces.c;

  -- integer types
  type int8_t is range -16#7f# .. 16#7f#;
  type int16_t is range -16#7fff# .. 16#7fff#;
  type int32_t is range -16#7fffffff# .. 16#7fffffff#;
  type uint8_t is mod 2 ** 8;
  type uint16_t is mod 2 ** 16;
  type uint32_t is mod 2 ** 32;

  for int8_t'size use 8;
  for int16_t'size use 16;
  for int32_t'size use 32;
  for uint8_t'size use 8;
  for uint16_t'size use 16;
  for uint32_t'size use 32;

  type int_ptr_t is access all c.int;
  type int8_ptr_t is access all int8_t;
  type int16_ptr_t is access all int16_t;
  type int32_ptr_t is access all int32_t;
  type uint8_ptr_t is access all uint8_t;
  type uint16_ptr_t is access all uint16_t;
  type uint32_ptr_t is access all uint32_t;

  pragma convention (c, int_ptr_t);
  pragma convention (c, int8_t);
  pragma convention (c, int16_t);
  pragma convention (c, int32_t);
  pragma convention (c, uint8_t);
  pragma convention (c, uint16_t);
  pragma convention (c, uint32_t);

  pragma convention (c, int8_ptr_t);
  pragma convention (c, int16_ptr_t);
  pragma convention (c, int32_ptr_t);
  pragma convention (c, uint8_ptr_t);
  pragma convention (c, uint16_ptr_t);
  pragma convention (c, uint32_ptr_t);

  -- Pointer types
  type void_ptr_t is new system.address;

  -- bitfield
  type init_flags_t is new uint32_t;
  pragma convention (c, init_flags_t);

  init_timer       : constant init_flags_t := 16#00000001#;
  init_audio       : constant init_flags_t := 16#00000010#;
  init_video       : constant init_flags_t := 16#00000020#;
  init_cdrom       : constant init_flags_t := 16#00000100#;
  init_joystick    : constant init_flags_t := 16#00000200#;
  init_noparachute : constant init_flags_t := 16#00100000#;
  init_eventthread : constant init_flags_t := 16#01000000#;
  init_everything  : constant init_flags_t := 16#0000ffff#;

  -- Initializes SDL
  function init (flags : init_flags_t) return c.int;
  pragma import (c, init, "SDL_Init");

  -- Initializes subsystems
  function initsubsystem (flags : init_flags_t) return c.int;
  function init_sub_system
   (flags : init_flags_t) return c.int renames initsubsystem;
  pragma import (c, initsubsystem, "SDL_InitSubSystem");

  function initsubsystem (flags : init_flags_t) return boolean;
  function init_sub_system (flags : init_flags_t) return boolean renames initsubsystem;
  pragma inline (initsubsystem);

  -- Shuts down a subsystem
  procedure quitsubsystem (flags : init_flags_t);
  procedure quit_sub_system (flags : init_flags_t) renames quitsubsystem;
  pragma import (c, quitsubsystem, "SDL_QuitSubSystem");

  -- Checks which subsystems are initialized
  function wasinit (flags : init_flags_t) return init_flags_t;
  function was_init (flags : init_flags_t) return init_flags_t renames wasinit;
  pragma import (c, wasinit, "SDL_WasInit");

  function wasinit (flags : init_flags_t) return boolean;
  function was_init (flags : init_flags_t) return boolean renames wasinit;
  pragma inline (wasinit);

  -- Shuts down SDL
  procedure quit;
  pragma import (c, quit, "SDL_Quit");

end sdl;
