package body SDL.Error is

  -- Gets SDL error string
  function get_error return string is
  begin
    return cs.value (GetError);
  end get_error;

end SDL.Error;
