package body sdl is
  use type c.int;

  function initsubsystem
   (flags : init_flags_t) return boolean
  is
    ret : constant c.int := initsubsystem (flags);
  begin
    return ret /= -1;
  end initsubsystem;

  function wasinit (flags : init_flags_t) return boolean is
    ret : constant init_flags_t := wasinit (flags);
    rfa : constant init_flags_t := ret and flags;
  begin
    if rfa = flags then
      return true;
    else
      return false;
    end if;
  end wasinit;

end sdl;
