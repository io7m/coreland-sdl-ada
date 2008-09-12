package body sdl.error is

  -- Gets SDL error string
  function geterror return string is
  begin
    return cs.value (geterror);
  end geterror;

  -- Sets SDL error string
  procedure seterror (msg : string) is
    ch_array : aliased c.char_array := c.to_c (msg);
  begin
    seterror (cs.to_chars_ptr (ch_array'unchecked_access));
  end seterror;

end sdl.error;
