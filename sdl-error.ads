with interfaces.c;
with interfaces.c.strings;

package SDL.error is
  package c renames interfaces.c;
  package cs renames interfaces.c.strings;

  type code_t is new c.int;

  ENOMEM    : constant code_t := 0;
  EFREAD    : constant code_t := 1;
  EFWRITE   : constant code_t := 2;
  EFSEEK    : constant code_t := 3;
  LASTERROR : constant code_t := 4;

  -- Gets SDL error string
  function GetError return cs.chars_ptr;
  function get_error return cs.chars_ptr renames GetError;
  pragma import (c, GetError, "SDL_GetError");

  function GetError return string;
  function get_error return string renames GetError;
  pragma inline (GetError);

  -- Sets SDL error string
  procedure SetError (msg : cs.chars_ptr);
  procedure set_error (msg : cs.chars_ptr) renames SetError;
  pragma import (c, SetError, "SDL_SetError");

  procedure SetError (msg : string);
  procedure set_error (msg : string) renames SetError;
  pragma inline (SetError);

  -- Sets the SDL error message to one of several predefined strings.
  procedure error (code : code_t);
  pragma import (c, error, "SDL_Error");

  -- Clear the current SDL error
  procedure ClearError;
  procedure clear_error renames ClearError;
  pragma import (c, ClearError, "SDL_ClearError");

end SDL.error;
