package body sdl.video is
  use type c.int;

  function blitsurface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return boolean
  is
    ret : constant c.int := blitsurface (src, src_rect, dst, dst_rect);
  begin
    return ret /= -1;
  end blitsurface;

  function blitsurface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return boolean
  is
    ret : constant c.int := blitsurface (src, src_rect, dst, dst_rect);
  begin
    return ret /= -1;
  end blitsurface;

  function creatergbsurfacefrom
   (pixels : void_ptr_t;
    width  : natural;
    height : natural;
    bpp    : positive;
    pitch  : positive;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t is
  begin
    return creatergbsurfacefrom
     (pixels => pixels,
      width  => c.int (width),
      height => c.int (height),
      bpp    => c.int (bpp),
      pitch  => c.int (pitch),
      rmask  => rmask,
      gmask  => gmask,
      bmask  => bmask,
      amask  => amask);
  end creatergbsurfacefrom;

  function fillrect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t) return boolean
  is
    ret : constant c.int := fillrect (dst, r, color);
  begin
    return ret /= -1;
  end fillrect;

  function flip (surf : surface_access_t) return boolean is
    ret : constant c.int := flip (surf);
  begin
    return ret /= -1;
  end flip;

  function getgammaramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return boolean
  is
    ret : constant c.int := getgammaramp (red, green, blue);
  begin
    return ret /= -1;
  end getgammaramp;

  function locksurface (surf : surface_access_t) return boolean is
    ret : constant c.int := locksurface (surf);
  begin
    return ret /= -1;
  end locksurface;

  function setalpha
   (surf  : surface_access_t;
    flags : uint32_t;
    alpha : uint8_t) return boolean
  is
    ret : constant c.int := setalpha (surf, flags, alpha);
  begin
    return ret /= -1;
  end setalpha;

  function setcolorkey
   (surf : surface_access_t;
    flag : uint32_t;
    key  : uint32_t) return boolean
  is
    ret : constant c.int := setcolorkey (surf, flag, key);
  begin
    return ret /= -1;
  end setcolorkey;

  function sdl_setcolors
   (surf        : surface_access_t;
    colors      : color_array_t;
    first_color : c.int;
    num_colors  : c.int) return c.int;
  pragma import (c, sdl_setcolors, "SDL_SetColors");

  function setcolors
   (surf        : surface_access_t;
    colors      : color_array_t;
    first_color : natural;
    num_colors  : natural) return boolean
  is
    ret : constant c.int := sdl_setcolors
      (surf        => surf,
       colors      => colors,
       first_color => c.int (first_color),
       num_colors  => c.int (num_colors));
  begin
    return ret /= 0;
  end setcolors;

  function setgamma
   (red   : float;
    green : float;
    blue  : float) return boolean
  is
    ret : constant c.int := setgamma
     (red   => c.c_float (red),
      green => c.c_float (green),
      blue  => c.c_float (blue));
  begin
    return ret /= -1;
  end setgamma;

  function sdl_setgammaramp
    (red   : gamma_table_t;
     green : gamma_table_t;
     blue  : gamma_table_t) return c.int;
  pragma import (c, sdl_setgammaramp, "SDL_SetGammaRamp");

  function setgammaramp
    (red   : gamma_table_t;
     green : gamma_table_t;
     blue  : gamma_table_t) return boolean
  is
    ret : constant c.int := sdl_setgammaramp (red, green, blue);
  begin
    return ret /= -1;
  end setgammaramp;

  function sdl_setpalette
   (surf        : surface_access_t;
    flags       : c.int;
    colors      : color_array_t;
    first_color : c.int;
    num_colors  : c.int) return c.int;
  pragma import (c, sdl_setpalette, "SDL_SetPalette");

  function setpalette
   (surf        : surface_access_t;
    flags       : c.int;
    colors      : color_array_t;
    first_color : natural;
    num_colors  : natural) return boolean
  is
    ret : constant c.int := sdl_setpalette
     (surf        => surf,
      flags       => flags,
      colors      => colors,
      first_color => c.int (first_color),
      num_colors  => c.int (num_colors));
  begin
    return ret /= 0;
  end setpalette;

  function setvideomode
   (width  : positive;
    height : positive;
    bpp    : natural;
    flags  : surface_flags_t) return surface_access_t
  is
  begin
    return setvideomode
     (width  => c.int (width),
      height => c.int (height),
      bpp    => c.int (bpp),
      flags  => flags);
  end setvideomode;

  procedure sdl_updaterects
   (surf  : surface_access_t;
    num   : c.int;
    rects : rect_array_t);
  pragma import (c, sdl_updaterects, "SDL_UpdateRects");

  procedure updaterects
   (surf  : surface_access_t;
    rects : rect_array_t) is
  begin
    sdl_updaterects (surf, c.int (rects'length), rects);
  end updaterects;

  function videomodeok
   (width  : natural;
    height : natural;
    bpp    : natural;
    flags  : surface_flags_t) return boolean
  is
    ret : constant c.int := videomodeok
     (width  => c.int (width),
      height => c.int (height),
      bpp    => c.int (bpp),
      flags  => uint32_t (flags));
  begin
    return ret /= 0;
  end videomodeok;

  function mustlock (surf : surface_access_t) return boolean is
    check_flags : constant surface_flags_t := hwsurface or asyncblit or rleaccel;
  begin
    if (surf.offset /= 0) or ((surf.flags and check_flags) /= 0)
    then
      return true;
    else
      return false;
    end if;
  end mustlock;

end sdl.video;
