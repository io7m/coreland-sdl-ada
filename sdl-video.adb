package body SDL.Video is

  function MUSTLOCK (surf: Surface_ptr) return boolean is
    check_flags: constant surface_flags := HWSURFACE or ASYNCBLIT or RLEACCEL;

    use type c.int;
  begin
    if (surf.offset /= 0) or ((surf.flags and check_flags) /= 0) then
      return true;
    else
      return false;
    end if;
  end MUSTLOCK;

end SDL.Video;
