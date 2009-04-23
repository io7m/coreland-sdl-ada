package body SDL is
  use type C.int;

  function InitSubSystem (Flags : Init_Flags_t) return Boolean is
    Ret : constant C.int := InitSubSystem (Flags);
  begin
    return Ret /= -1;
  end InitSubSystem;

  function WasInit (Flags : Init_Flags_t) return Boolean is
    Ret : constant Init_Flags_t := WasInit (Flags);
    Rfa : constant Init_Flags_t := Ret and Flags;
  begin
    if Rfa = Flags then
      return True;
    else
      return False;
    end if;
  end WasInit;

  function Init (Flags : Init_Flags_t) return Boolean is
  begin
    return C.int'(Init (Flags)) /= -1;
  end Init;

end SDL;
