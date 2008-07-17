with interfaces.c;
with interfaces.c.strings;

package SDL.error is
  package c renames interfaces.c;
  package cs renames interfaces.c.strings;

  -- Gets SDL error string
  function GetError return cs.chars_ptr;
  function get_error return cs.chars_ptr renames GetError;
  pragma import (c, GetError, "SDL_GetError");

  function GetError return string;
  function get_error return string renames GetError;
  pragma inline (GetError);

  type errorcode_t is new c.int;

  ENOMEM:    constant errorcode_t := 0;
  EFREAD:    constant errorcode_t := 1;
  EFWRITE:   constant errorcode_t := 2;
  EFSEEK:    constant errorcode_t := 3;
  LASTERROR: constant errorcode_t := 4;

  -- Sets the SDL error message to one of several predefined strings.
  procedure error (code: errorcode_t);
  pragma import (c, error, "SDL_Error");

  -- Clear the current SDL error
  procedure ClearError;
  procedure clear_error renames ClearError;
  pragma import (c, ClearError, "SDL_ClearError");

end SDL.error;
