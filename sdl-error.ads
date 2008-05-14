with interfaces.c;
with interfaces.c.strings;

package SDL.error is
  package c renames interfaces.c;
  package cs renames interfaces.c.strings;

  -- Gets SDL error string
  function GetError return cs.chars_ptr;
  function get_error return string;
  pragma import (c, GetError, "SDL_GetError");
  pragma inline (get_error);

  type errorcode is new c.int;

  ENOMEM:    constant errorcode := 0;
  EFREAD:    constant errorcode := 1;
  EFWRITE:   constant errorcode := 2;
  EFSEEK:    constant errorcode := 3;
  LASTERROR: constant errorcode := 4;

  -- Sets the SDL error message to one of several predefined strings.
  procedure error (code: errorcode);
  pragma import (c, error, "SDL_Error");

  -- Clear the current SDL error
  procedure ClearError;
  procedure clear_error;
  pragma import (c, ClearError, "SDL_ClearError");
  pragma import (c, clear_error, "SDL_ClearError");

end SDL.error;
