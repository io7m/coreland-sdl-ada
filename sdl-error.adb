package body SDL.Error is

  -- Gets SDL error string
  function GetError return string is
  begin
    return cs.value (GetError);
  end GetError;

end SDL.Error;
