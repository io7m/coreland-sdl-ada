package body SDL.Error is

  -- Gets SDL error string
  function GetError return String is
  begin
    return CS.Value (GetError);
  end GetError;

  -- Sets SDL error string
  procedure SetError (Message : String) is
    Ch_Array : aliased C.char_array := C.To_C (Message);
  begin
    SetError (CS.To_Chars_Ptr (Ch_Array'Unchecked_Access));
  end SetError;

end SDL.Error;
