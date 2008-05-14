with SDL.keysym;
with interfaces.c.strings;

package SDL.keyboard is
  package cs renames interfaces.c.strings;
  package sks renames SDL.keysym;

  type keysym is record
    scancode: uint8;
         sym: sks.key;
      modkey: sks.modkey;
     unicode: uint16;
  end record;

  for keysym'Size use 128;
  pragma convention (c, keysym);

  type keysym_ptr is access all keysym;
  type keysym_const_ptr is access constant keysym;
  pragma convention (c, keysym_ptr);
  pragma convention (c, keysym_const_ptr);

  ALL_HOTKEYS : constant sks.modkey := 16#FFFFFFFF#;
  
  --
  -- API functions.
  --

  DEFAULT_REPEAT_DELAY:    constant integer := 500;
  DEFAULT_REPEAT_INTERVAL: constant integer := 30;
 
  -- Sets keyboard repeat rate
  function EnableKeyRepeat (press_delay: c.int; interval: c.int) return c.int;
  function enable_key_repeat (press_delay: c.int; interval: c.int) return c.int;
  procedure EnableKeyRepeat (press_delay: c.int; interval: c.int);
  procedure enable_key_repeat (press_delay: c.int; interval: c.int);
  pragma import (c, EnableKeyRepeat, "SDL_EnableKeyRepeat");
  pragma import (c, enable_key_repeat, "SDL_EnableKeyRepeat");
 
  function EnableUNICODE (enable: c.int) return c.int;
  function enable_unicode (enable: c.int) return c.int;
  procedure EnableUNICODE (enable: c.int);
  procedure enable_unicode (enable: c.int);
  pragma import (c, EnableUNICODE, "SDL_EnableUNICODE");
  pragma import (c, enable_unicode, "SDL_EnableUNICODE");

  -- Gets the name of an SDL virtual keysym
  function GetKeyName (keyval: sks.key) return cs.chars_ptr;
  function get_key_name (keyval: sks.key) return cs.chars_ptr;
  pragma import (c, GetKeyName, "SDL_GetKeyName");
  pragma import (c, get_key_name, "SDL_GetKeyName");
 
  type KeyStates_Array is array (sks.key range sks.K_FIRST .. sks.K_LAST) of uint8;
  pragma convention (c, KeyStates_Array);

  -- Gets a snapshot of the current keyboard state
  function GetKeyState (numkeys: int_ptr) return uint8_ptr;
  function get_key_state (numkeys: int_ptr) return uint8_ptr;
  pragma import (c, GetKeyState, "SDL_GetKeyState");
  pragma import (c, get_key_state, "SDL_GetKeyState");

  -- Gets the state of modifier keys
  function GetModState return sks.modkey;
  function get_mod_state return sks.modkey;
  pragma import (c, GetModState, "SDL_GetModState");
  pragma import (c, get_mod_state, "SDL_GetModState");

  -- Sets the state of modifier keys
  procedure SetModState (state: sks.modkey);
  procedure set_mod_state (state: sks.modkey);
  pragma import (c, SetModState, "SDL_SetModState");
  pragma import (c, set_mod_state, "SDL_SetModState");
 
end SDL.Keyboard;
