package body SDL.Video is
  use type c.int;

  function BlitSurface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return boolean is
    ret: constant c.int := BlitSurface (src, src_rect, dst, dst_rect);
  begin
    return ret /= -1;
  end BlitSurface;

  function BlitSurface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return boolean is
    ret: constant c.int := BlitSurface (src, src_rect, dst, dst_rect);
  begin
    return ret /= -1;
  end BlitSurface;

  function CreateRGBSurfaceFrom (pixels: void_ptr_t; width, height: natural;
    bpp: positive; pitch: positive; rmask, gmask, bmask, amask: uint32)
      return surface_ptr_t is
  begin
    return CreateRGBSurfaceFrom (pixels, c.int (width), c.int (height),
      c.int (bpp), c.int (pitch), rmask, gmask, bmask, amask);
  end CreateRGBSurfaceFrom;

  function FillRect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32) return boolean is
    ret: constant c.int := FillRect (dst, r, color);
  begin
    return ret /= -1;
  end FillRect;

  function Flip (surf: surface_ptr_t) return boolean is
    ret: constant c.int := Flip (surf);
  begin
    return ret /= -1;
  end Flip;

  function GetGammaRamp (red, green, blue: uint16_ptr) return boolean is
    ret: constant c.int := GetGammaRamp (red, green, blue);
  begin
    return ret /= -1;
  end GetGammaRamp;

  function LockSurface (surf: surface_ptr_t) return boolean is
    ret: constant c.int := LockSurface (surf);
  begin
    return ret /= -1;
  end LockSurface;

  function SetAlpha (surf: surface_ptr_t; flags: uint32; alpha: uint8) return boolean is
    ret: constant c.int := SetAlpha (surf, flags, alpha);
  begin
    return ret /= -1;
  end SetAlpha;

  function SetColorKey (surf: surface_ptr_t; flag, key: uint32) return boolean is
    ret: constant c.int := SetColorKey (surf, flag, key);
  begin
    return ret /= -1;
  end SetColorKey;

  function SDL_SetColors (surf: surface_ptr_t; colors: color_array_t;
    first, ncolors: c.int) return c.int;
  pragma import (c, SDL_SetColors, "SDL_SetColors");

  function SetColors (surf: surface_ptr_t; colors: color_array_t;
    first_color, num_colors: natural) return boolean is
    ret: constant c.int := SDL_SetColors (surf, colors,
      c.int (first_color), c.int (num_colors));
  begin
    return ret /= 0;
  end SetColors;

  function SetGamma (red, green, blue: float) return boolean is
    ret: constant c.int := SetGamma (c.c_float (red), c.c_float (green),
      c.c_float (blue));
  begin
    return ret /= -1;
  end SetGamma;

  function SDL_SetGammaRamp (red, green, blue: gamma_table_t) return c.int;
  pragma import (c, SDL_SetGammaRamp, "SDL_SetGammaRamp");

  function SetGammaRamp (red, green, blue: gamma_table_t) return boolean is
    ret: constant c.int := SDL_SetGammaRamp (red, green, blue);
  begin
    return ret /= -1;
  end SetGammaRamp;

  function SDL_SetPalette (surf: surface_ptr_t; flags: c.int; colors: color_array_t;
    first, ncolors: c.int) return c.int;
  pragma import (c, SDL_SetPalette, "SDL_SetPalette");

  function SetPalette (surf: surface_ptr_t; flags: c.int; colors: color_array_t;
    first_color, num_colors: natural) return boolean is
    ret: constant c.int := SDL_SetPalette (surf, flags, colors,
      c.int (first_color), c.int (num_colors));
  begin
    return ret /= 0;
  end SetPalette;

  function SetVideoMode (width, height: positive; bpp: natural; flags: surface_flags_t)
    return surface_ptr_t is
  begin
    return SetVideoMode (c.int (width), c.int (height), c.int (bpp), flags);
  end SetVideoMode;

  procedure SDL_UpdateRects (surf: surface_ptr_t; num: c.int; rects: rect_array_t);
  pragma import (c, SDL_UpdateRects, "SDL_UpdateRects");

  procedure UpdateRects (surf: surface_ptr_t; rects: rect_array_t) is
  begin
    SDL_UpdateRects (surf, c.int (rects'length), rects);
  end UpdateRects;

  function VideoModeOK (width, height, bpp: natural; flags: surface_flags_t)
    return boolean is
    ret: constant c.int := VideoModeOK (c.int (width), c.int (height),
      c.int (bpp), uint32 (flags));
  begin
    return ret /= 0;
  end VideoModeOK;

  function MUSTLOCK (surf: surface_ptr_t) return boolean is
    check_flags: constant surface_flags_t := HWSURFACE or ASYNCBLIT or RLEACCEL;
  begin
    if (surf.offset /= 0) or ((surf.flags and check_flags) /= 0) then
      return true;
    else
      return false;
    end if;
  end MUSTLOCK;

end SDL.Video;
