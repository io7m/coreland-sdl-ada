with interfaces.C;
with interfaces.C.strings;

package sdl.error is
  package c renames interfaces.C;
  package cs renames interfaces.C.strings;

  type code_t is new c.int;

  enomem    : constant code_t := 0;
  efread    : constant code_t := 1;
  efwrite   : constant code_t := 2;
  efseek    : constant code_t := 3;
  lasterror : constant code_t := 4;

  -- Gets SDL error string
  function geterror return cs.chars_ptr;
  function get_error return cs.chars_ptr renames geterror;
  pragma import (c, geterror, "SDL_GetError");

  function geterror return string;
  function get_error return string renames geterror;
  pragma inline (geterror);

  -- Sets SDL error string
  procedure seterror (msg : cs.chars_ptr);
  procedure set_error (msg : cs.chars_ptr) renames seterror;
  pragma import (c, seterror, "SDL_SetError");

  procedure seterror (msg : string);
  procedure set_error (msg : string) renames seterror;
  pragma inline (seterror);

  -- Sets the SDL error message to one of several predefined strings.
  procedure error (code : code_t);
  pragma import (c, error, "SDL_Error");

  -- Clear the current SDL error
  procedure clearerror;
  procedure clear_error renames clearerror;
  pragma import (c, clearerror, "SDL_ClearError");

end sdl.error;
