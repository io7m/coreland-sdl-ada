package body SDL.Error is

  -- Gets SDL error string
  function GetError return string is
  begin
    return cs.value (GetError);
  end GetError;

  -- Sets SDL error string
  procedure SetError (msg : string) is
    ch_array : aliased c.char_array := c.to_c (msg);
  begin
    SetError (cs.to_chars_ptr (ch_array'unchecked_access));
  end SetError;

end SDL.Error;
