package body SDL is
  use type c.int;

  function InitSubSystem (flags: init_flags_t) return boolean is
    ret: constant c.int := InitSubSystem (flags);
  begin
    return ret /= -1;
  end InitSubSystem;

  function WasInit (flags: init_flags_t) return boolean is
    ret: constant init_flags_t := WasInit (flags);
    rfa: constant init_flags_t := ret and flags;
  begin
    if rfa = flags then
      return true;
    else
      return false;
    end if;
  end WasInit;

end SDL;
