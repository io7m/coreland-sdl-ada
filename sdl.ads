with interfaces.c;
with system;

package SDL is
  package c renames interfaces.c;

  -- integer types
  type int8 is range -16#7f# .. 16#7f#;
  type int16 is range -16#7fff# .. 16#7fff#;
  type int32 is range -16#7fffffff# .. 16#7fffffff#;
  type uint8 is mod 2 ** 8;
  type uint16 is mod 2 ** 16;
  type uint32 is mod 2 ** 32;

  for int8'size use 8;
  for int16'size use 16;
  for int32'size use 32;
  for uint8'size use 8;
  for uint16'size use 16;
  for uint32'size use 32;

  type int_ptr is access all c.int;
  type int8_ptr is access all int8;
  type int16_ptr is access all int16;
  type int32_ptr is access all int32;
  type uint8_ptr is access all uint8;
  type uint16_ptr is access all uint16;
  type uint32_ptr is access all uint32;

  pragma convention (c, int_ptr);
  pragma convention (c, int8);
  pragma convention (c, int16);
  pragma convention (c, int32);
  pragma convention (c, uint8);
  pragma convention (c, uint16);
  pragma convention (c, uint32);

  pragma convention (c, int8_ptr);
  pragma convention (c, int16_ptr);
  pragma convention (c, int32_ptr);
  pragma convention (c, uint8_ptr);
  pragma convention (c, uint16_ptr);
  pragma convention (c, uint32_ptr);

  -- Pointer types
  type void_ptr_t is new system.address;

  -- bitfield
  type init_flags_t is new uint32;
  pragma convention (c, init_flags_t);

  INIT_TIMER:       constant init_flags_t := 16#00000001#;
  INIT_AUDIO:       constant init_flags_t := 16#00000010#;
  INIT_VIDEO:       constant init_flags_t := 16#00000020#;
  INIT_CDROM:       constant init_flags_t := 16#00000100#;
  INIT_JOYSTICK:    constant init_flags_t := 16#00000200#;
  INIT_NOPARACHUTE: constant init_flags_t := 16#00100000#;
  INIT_EVENTTHREAD: constant init_flags_t := 16#01000000#;
  INIT_EVERYTHING:  constant init_flags_t := 16#0000ffff#;

  -- Initializes SDL
  function Init (flags: init_flags_t) return c.int;
  pragma import (c, init, "SDL_Init");

  -- Initializes subsystems
  function InitSubSystem (flags: init_flags_t) return c.int;
  function init_sub_system (flags: init_flags_t) return c.int renames InitSubSystem;
  pragma import (c, InitSubSystem, "SDL_InitSubSystem");

  function InitSubSystem (flags: init_flags_t) return boolean;
  function init_sub_system (flags: init_flags_t) return boolean renames InitSubSystem;
  pragma inline (InitSubSystem);
 
  -- Shuts down a subsystem
  procedure QuitSubSystem (flags: init_flags_t);
  procedure quit_sub_system (flags: init_flags_t) renames QuitSubSystem;
  pragma import (c, QuitSubSystem, "SDL_QuitSubSystem");

  -- Checks which subsystems are initialized
  function WasInit (flags: init_flags_t) return init_flags_t;
  function was_init (flags: init_flags_t) return init_flags_t renames WasInit;
  pragma import (c, WasInit, "SDL_WasInit");

  function WasInit (flags: init_flags_t) return boolean;
  function was_init (flags: init_flags_t) return boolean renames WasInit;
  pragma inline (WasInit);

  -- Shuts down SDL
  procedure Quit;
  pragma import (c, Quit, "SDL_Quit");

end SDL;
