with Interfaces.C;
with System;

package SDL is
  package C renames Interfaces.C;

  -- integer types
  type Int8_t is range -16#7f# .. 16#7f#;
  type Int16_t is range -16#7fff# .. 16#7fff#;
  type Int32_t is range -16#7fffffff# .. 16#7fffffff#;
  type Uint8_t is mod 2 ** 8;
  type Uint16_t is mod 2 ** 16;
  type Uint32_t is mod 2 ** 32;

  for Int8_t'Size use 8;
  for Int16_t'Size use 16;
  for Int32_t'Size use 32;
  for Uint8_t'Size use 8;
  for Uint16_t'Size use 16;
  for Uint32_t'Size use 32;

  type Int_Ptr_t is access all C.int;
  type Int8_Ptr_t is access all Int8_t;
  type Int16_Ptr_t is access all Int16_t;
  type Int32_Ptr_t is access all Int32_t;
  type Uint8_Ptr_t is access all Uint8_t;
  type Uint16_Ptr_t is access all Uint16_t;
  type Uint32_Ptr_t is access all Uint32_t;

  pragma Convention (C, Int_Ptr_t);
  pragma Convention (C, Int8_t);
  pragma Convention (C, Int16_t);
  pragma Convention (C, Int32_t);
  pragma Convention (C, Uint8_t);
  pragma Convention (C, Uint16_t);
  pragma Convention (C, Uint32_t);

  pragma Convention (C, Int8_Ptr_t);
  pragma Convention (C, Int16_Ptr_t);
  pragma Convention (C, Int32_Ptr_t);
  pragma Convention (C, Uint8_Ptr_t);
  pragma Convention (C, Uint16_Ptr_t);
  pragma Convention (C, Uint32_Ptr_t);

  -- Pointer types
  type Void_Ptr_t is new System.Address;

  -- bitfield
  type Init_Flags_t is new Uint32_t;
  pragma Convention (C, Init_Flags_t);

  Init_Timer       : constant Init_Flags_t := 16#00000001#;
  Init_Audio       : constant Init_Flags_t := 16#00000010#;
  Init_Video       : constant Init_Flags_t := 16#00000020#;
  Init_Cdrom       : constant Init_Flags_t := 16#00000100#;
  Init_Joystick    : constant Init_Flags_t := 16#00000200#;
  Init_Noparachute : constant Init_Flags_t := 16#00100000#;
  Init_Eventthread : constant Init_Flags_t := 16#01000000#;
  Init_Everything  : constant Init_Flags_t := 16#0000ffff#;

  -- Initializes SDL
  function Init (Flags : Init_Flags_t) return C.int;
  pragma Import (C, Init, "SDL_Init");

  -- Initializes subsystems
  function InitSubSystem (Flags : Init_Flags_t) return C.int;
  function Init_Sub_System (Flags : Init_Flags_t) return C.int renames InitSubSystem;
  pragma Import (C, InitSubSystem, "SDL_InitSubSystem");

  function InitSubSystem (Flags : Init_Flags_t) return Boolean;
  function Init_Sub_System (Flags : Init_Flags_t) return Boolean renames InitSubSystem;
  pragma Inline (InitSubSystem);

  -- Shuts down a subsystem
  procedure QuitSubSystem (Flags : Init_Flags_t);
  procedure Quit_Sub_System (Flags : Init_Flags_t) renames QuitSubSystem;
  pragma Import (C, QuitSubSystem, "SDL_QuitSubSystem");

  -- Checks which subsystems are initialized
  function WasInit (Flags : Init_Flags_t) return Init_Flags_t;
  function Was_Init (Flags : Init_Flags_t) return Init_Flags_t renames WasInit;
  pragma Import (C, WasInit, "SDL_WasInit");

  function WasInit (Flags : Init_Flags_t) return Boolean;
  function Was_Init (Flags : Init_Flags_t) return Boolean renames WasInit;
  pragma Inline (WasInit);

  -- Shuts down SDL
  procedure Quit;
  pragma Import (C, Quit, "SDL_Quit");

end SDL;
