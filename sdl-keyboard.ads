with SDL.keysym;
with interfaces.c.strings;

package SDL.keyboard is
  package cs renames interfaces.c.strings;
  package sks renames SDL.keysym;

  type keysym_t is record
    scancode: uint8;
         sym: sks.key_t;
      modkey: sks.modkey_t;
     unicode: uint16;
  end record;

  for keysym_t'size use 128;
  pragma convention (c, keysym_t);

  type keysym_ptr_t is access all keysym_t;
  type keysym_const_ptr_t is access constant keysym_t;
  pragma convention (c, keysym_ptr_t);
  pragma convention (c, keysym_const_ptr_t);

  type key_states_array_t is array (sks.key_t range sks.K_FIRST .. sks.K_LAST) of uint8;
  pragma convention (c, key_states_array_t);

  ALL_HOTKEYS : constant sks.modkey_t := 16#FFFFFFFF#;
  
  --
  -- API functions.
  --

  DEFAULT_REPEAT_DELAY:    constant integer := 500;
  DEFAULT_REPEAT_INTERVAL: constant integer := 30;
 
  -- Sets keyboard repeat rate
  function EnableKeyRepeat (press_delay: c.int; interval: c.int) return c.int;
  function enable_key_repeat (press_delay: c.int; interval: c.int) return c.int renames EnableKeyRepeat;
  procedure EnableKeyRepeat (press_delay: c.int; interval: c.int);
  procedure enable_key_repeat (press_delay: c.int; interval: c.int) renames EnableKeyRepeat;
  pragma import (c, EnableKeyRepeat, "SDL_EnableKeyRepeat");
 
  function EnableUNICODE (enable: c.int) return c.int;
  function enable_unicode (enable: c.int) return c.int renames EnableUNICODE;
  procedure EnableUNICODE (enable: c.int);
  procedure enable_unicode (enable: c.int) renames EnableUNICODE;
  pragma import (c, EnableUNICODE, "SDL_EnableUNICODE");

  -- Gets the name of an SDL virtual keysym
  function GetKeyName (keyval: sks.key_t) return cs.chars_ptr;
  function get_key_name (keyval: sks.key_t) return cs.chars_ptr renames GetKeyName;
  pragma import (c, GetKeyName, "SDL_GetKeyName");
 
  -- Gets a snapshot of the current keyboard state
  function GetKeyState (numkeys: int_ptr) return uint8_ptr;
  function get_key_state (numkeys: int_ptr) return uint8_ptr renames GetKeyState;
  pragma import (c, GetKeyState, "SDL_GetKeyState");

  -- Gets the state of modifier keys
  function GetModState return sks.modkey_t;
  function get_mod_state return sks.modkey_t renames GetModState;
  pragma import (c, GetModState, "SDL_GetModState");

  -- Sets the state of modifier keys
  procedure SetModState (state: sks.modkey_t);
  procedure set_mod_state (state: sks.modkey_t) renames SetModState;
  pragma import (c, SetModState, "SDL_SetModState");
 
end SDL.Keyboard;
