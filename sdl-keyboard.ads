with SDL.Keysym;
with Interfaces.C.Strings;

package SDL.Keyboard is
  package CS renames Interfaces.C.Strings;

  type Keysym_t is record
    Scancode : Uint8_t;
    Sym      : Keysym.Key_t;
    ModKey   : Keysym.ModKey_t;
    Unicode  : Uint16_t;
  end record;

  for Keysym_t'Size use 128;
  pragma Convention (C, Keysym_t);

  type Keysym_Access_t is access all Keysym_t;
  type Keysym_Const_Access_t is access constant Keysym_t;
  pragma Convention (C, Keysym_Access_t);
  pragma Convention (C, Keysym_Const_Access_t);

  type Key_States_Array_t is array (Keysym.Key_t range Keysym.K_First .. Keysym.K_Last) of Uint8_t;
  pragma Convention (C, Key_States_Array_t);

  All_Hotkeys : constant Keysym.ModKey_t := 16#FFFFFFFF#;

  --
  -- API functions.
  --

  Default_Repeat_Delay    : constant Integer := 500;
  Default_Repeat_Interval : constant Integer := 30;

  -- Sets keyboard repeat rate
  function EnableKeyRepeat (Press_Delay : C.int; Interval : C.int) return C.int;
  function Enable_Key_Repeat (Press_Delay : C.int; Interval : C.int) return C.int renames EnableKeyRepeat;
  procedure EnableKeyRepeat (Press_Delay : C.int; Interval : C.int);
  procedure Enable_Key_Repeat (Press_Delay : C.int; Interval : C.int) renames EnableKeyRepeat;
  pragma Import (C, EnableKeyRepeat, "SDL_EnableKeyRepeat");

  function EnableUnicode (Enable : C.int) return C.int;
  function Enable_Unicode (Enable : C.int) return C.int renames EnableUnicode;
  procedure EnableUnicode (Enable : C.int);
  procedure Enable_Unicode (Enable : C.int) renames EnableUnicode;
  pragma Import (C, EnableUnicode, "SDL_EnableUnicode");

  -- Gets the name of an SDL virtual keysym
  function GetKeyName (Keyval : Keysym.Key_t) return CS.chars_ptr;
  function Get_Key_Name (Keyval : Keysym.Key_t) return CS.chars_ptr renames GetKeyName;
  pragma Import (C, GetKeyName, "SDL_GetKeyName");

  -- Gets a snapshot of the current keyboard state
  function GetKeyState (Numkeys : Int_Ptr_t) return Uint8_Ptr_t;
  function Get_Key_State (Numkeys : Int_Ptr_t) return Uint8_Ptr_t renames GetKeyState;
  pragma Import (C, GetKeyState, "SDL_GetKeyState");

  -- Gets the state of modifier keys
  function GetModState return  Keysym.ModKey_t;
  function Get_Mod_State return  Keysym.ModKey_t renames GetModState;
  pragma Import (C, GetModState, "SDL_GetModState");

  -- Sets the state of modifier keys
  procedure SetModState (State : Keysym.ModKey_t);
  procedure Set_Mod_State (State : Keysym.ModKey_t) renames SetModState;
  pragma Import (C, SetModState, "SDL_SetModState");

end SDL.Keyboard;
