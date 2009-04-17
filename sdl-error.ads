with Interfaces.C;
with Interfaces.C.Strings;

package SDL.Error is
  package C renames Interfaces.C;
  package CS renames Interfaces.C.Strings;

  type Code_t is new C.int;

  ENOMEM    : constant Code_t := 0;
  EFREAD    : constant Code_t := 1;
  EFWRITE   : constant Code_t := 2;
  EFSEEK    : constant Code_t := 3;
  LastError : constant Code_t := 4;

  -- Gets SDL error string
  function GetError return  CS.chars_ptr;
  function Get_Error return  CS.chars_ptr renames GetError;
  pragma Import (C, GetError, "SDL_GetError");

  function GetError return String;
  function Get_Error return String renames GetError;
  pragma Inline (GetError);

  -- Sets SDL error string
  procedure SetError (Message : CS.chars_ptr);
  procedure Set_Error (Message : CS.chars_ptr) renames SetError;
  pragma Import (C, SetError, "SDL_SetError");

  procedure SetError (Message : String);
  procedure Set_Error (Message : String) renames SetError;
  pragma Inline (SetError);

  -- Sets the SDL error message to one of several predefined strings.
  procedure Error (Code : Code_t);
  pragma Import (C, Error, "SDL_Error");

  -- Clear the current SDL error
  procedure ClearError;
  procedure Clear_Error renames ClearError;
  pragma Import (C, ClearError, "SDL_ClearError");

end SDL.Error;
