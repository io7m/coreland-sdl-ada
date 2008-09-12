with sdl.keysym;
with interfaces.C.strings;

package sdl.keyboard is
  package cs renames interfaces.C.strings;
  package sks renames sdl.keysym;

  type keysym_t is record
    scancode : uint8_t;
    sym      : sks.key_t;
    modkey   : sks.modkey_t;
    unicode  : uint16_t;
  end record;

  for keysym_t'size use 128;
  pragma convention (c, keysym_t);

  type keysym_access_t is access all keysym_t;
  type keysym_const_access_t is access constant keysym_t;
  pragma convention (c, keysym_access_t);
  pragma convention (c, keysym_const_access_t);

  type key_states_array_t is
   array (sks.key_t range sks.k_first .. sks.k_last) of uint8_t;
  pragma convention (c, key_states_array_t);

  all_hotkeys : constant sks.modkey_t := 16#FFFFFFFF#;

  --
  -- API functions.
  --

  default_repeat_delay    : constant integer := 500;
  default_repeat_interval : constant integer := 30;

  -- Sets keyboard repeat rate
  function enablekeyrepeat
   (press_delay : c.int;
    interval    : c.int)
    return c.int;
  function enable_key_repeat
   (press_delay : c.int;
    interval    : c.int)
    return c.int renames enablekeyrepeat;
  procedure enablekeyrepeat
   (press_delay : c.int;
    interval    : c.int);
  procedure enable_key_repeat
   (press_delay : c.int;
    interval    : c.int) renames enablekeyrepeat;
  pragma import (c, enablekeyrepeat, "SDL_EnableKeyRepeat");

  function enableunicode (enable : c.int) return c.int;
  function enable_unicode (enable : c.int) return c.int renames
   enableunicode;
  procedure enableunicode (enable : c.int);
  procedure enable_unicode (enable : c.int) renames
   enableunicode;
  pragma import (c, enableunicode, "SDL_EnableUNICODE");

  -- Gets the name of an SDL virtual keysym
  function getkeyname
   (keyval : sks.key_t)
    return cs.chars_ptr;
  function get_key_name
   (keyval : sks.key_t)
    return cs.chars_ptr renames getkeyname;
  pragma import (c, getkeyname, "SDL_GetKeyName");

  -- Gets a snapshot of the current keyboard state
  function getkeystate (numkeys : int_ptr_t) return uint8_ptr_t;
  function get_key_state (numkeys : int_ptr_t) return uint8_ptr_t
    renames getkeystate;
  pragma import (c, getkeystate, "SDL_GetKeyState");

  -- Gets the state of modifier keys
  function getmodstate return sks.modkey_t;
  function get_mod_state return sks.modkey_t renames
   getmodstate;
  pragma import (c, getmodstate, "SDL_GetModState");

  -- Sets the state of modifier keys
  procedure setmodstate (state : sks.modkey_t);
  procedure set_mod_state (state : sks.modkey_t) renames
   setmodstate;
  pragma import (c, setmodstate, "SDL_SetModState");

end sdl.keyboard;
