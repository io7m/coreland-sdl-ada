--
-- TODO: SDL_GL_*, YUV
--

with interfaces.c;

package sdl.video is
  package c renames interfaces.c;

  -- Surface flags.
  type surface_flags_t is new uint32_t;
  pragma convention (c, surface_flags_t);

  -- Available for SDL_CreateRGBSurface() or SDL_SetVideoMode()
  swsurface : constant surface_flags_t := 16#00000000#;
  hwsurface : constant surface_flags_t := 16#00000001#;
  asyncblit : constant surface_flags_t := 16#00000004#;

  -- Available for SDL_SetVideoMode()
  anyformat  : constant surface_flags_t := 16#10000000#;
  hwpalette  : constant surface_flags_t := 16#20000000#;
  doublebuf  : constant surface_flags_t := 16#40000000#;
  fullscreen : constant surface_flags_t := 16#80000000#;
  opengl     : constant surface_flags_t := 16#00000002#;
  openglblit : constant surface_flags_t := 16#0000000A#;
  resizable  : constant surface_flags_t := 16#00000010#;
  noframe    : constant surface_flags_t := 16#00000020#;

  -- Used internally (read-only)
  hwaccel     : constant surface_flags_t := 16#00000100#;
  srccolorkey : constant surface_flags_t := 16#00001000#;
  rleaccelok  : constant surface_flags_t := 16#00002000#;
  rleaccel    : constant surface_flags_t := 16#00004000#;
  srcalpha    : constant surface_flags_t := 16#00010000#;
  prealloc    : constant surface_flags_t := 16#01000000#;

  -- Defines a rectangular area.
  type rect_t is record
    x : int16_t;
    y : int16_t;
    w : uint16_t;
    h : uint16_t;
  end record;
  type rect_access_t is access all rect_t;
  pragma convention (c, rect_t);
  pragma convention (c, rect_access_t);

  -- Format independent color description.
  type color_t is record
    r : uint8_t;
    g : uint8_t;
    b : uint8_t;
    a : uint8_t;
  end record;
  type color_access_t is access all color_t;
  pragma convention (c, color_t);
  pragma convention (c, color_access_t);

  -- Color palette for 8-bit pixel formats.
  type palette_t is record
    ncolors : c.int;
    colors  : access c.int;
  end record;
  type palette_access_t is access all palette_t;
  pragma convention (c, palette_t);
  pragma convention (c, palette_access_t);

  -- Stores surface format information
  type pixel_format_t is record
    palette       : palette_access_t;
    bitsperpixel  : uint8_t;
    bytesperpixel : uint8_t;
    rloss         : uint8_t;
    gloss         : uint8_t;
    bloss         : uint8_t;
    aloss         : uint8_t;
    rshift        : uint8_t;
    gshift        : uint8_t;
    bshift        : uint8_t;
    ashift        : uint8_t;
    rmask         : uint32_t;
    gmask         : uint32_t;
    bmask         : uint32_t;
    amask         : uint32_t;
    colorkey      : uint32_t;
    alpha         : uint8_t;
    unused1       : uint8_t; -- XXX: c compiler padding
    unused2       : uint8_t; -- XXX: c compiler padding
    unused3       : uint8_t; -- XXX: c compiler padding
  end record;
  type pixel_format_access_t is access all pixel_format_t;
  pragma convention (c, pixel_format_t);
  pragma convention (c, pixel_format_access_t);

  -- Graphical Surface Structure
  type surface_t is record
    flags          : surface_flags_t;
    format         : pixel_format_access_t;
    w              : c.int;
    h              : c.int;
    pitch          : uint16_t;
    pixels         : void_ptr_t;
    offset         : c.int;
    hwdata         : void_ptr_t;
    clip_rect      : rect_t;
    unused1        : uint32_t;
    locked         : uint32_t;
    map            : void_ptr_t;
    format_version : c.unsigned;
    refcount       : c.int;
  end record;
  type surface_access_t is access all surface_t;
  pragma convention (c, surface_t);
  pragma convention (c, surface_access_t);

  -- Useful for determining the video hardware capabilities

  type video_info_bitfield_t is record
    hw_available : integer range 0 .. 1;
    wm_available : integer range 0 .. 1;
    unusedbits1  : integer range 0 .. 63;
    unusedbits2  : integer range 0 .. 1;
    blit_hw      : integer range 0 .. 1;
    blit_hw_cc   : integer range 0 .. 1;
    blit_hw_a    : integer range 0 .. 1;
    blit_sw      : integer range 0 .. 1;
    blit_sw_cc   : integer range 0 .. 1;
    blit_sw_a    : integer range 0 .. 1;
    blit_fill    : integer range 0 .. 1;
    unusedbits3  : integer range 0 .. 65535;
  end record;
  for video_info_bitfield_t use record
    hw_available at 0 range 0 .. 0;
    wm_available at 0 range 1 .. 1;
    unusedbits1  at 0 range 2 .. 7;
    unusedbits2  at 0 range 8 .. 8;
    blit_hw      at 0 range 9 .. 9;
    blit_hw_cc   at 0 range 10 .. 10;
    blit_hw_a    at 0 range 11 .. 11;
    blit_sw      at 0 range 12 .. 12;
    blit_sw_cc   at 0 range 13 .. 13;
    blit_sw_a    at 0 range 14 .. 14;
    blit_fill    at 0 range 15 .. 15;
    unusedbits3  at 0 range 16 .. 31;
  end record;
  pragma convention (c, video_info_bitfield_t);

  type video_info_t is record
    bits      : video_info_bitfield_t;
    video_mem : uint32_t;
    vfmt      : pixel_format_access_t;
    current_w : c.int;
    current_h : c.int;
  end record;
  type video_info_access_t is access all video_info_t;
  pragma convention (c, video_info_t);
  pragma convention (c, video_info_access_t);

  -- Table of gamma values for SDL_SetGamma, etc.
  type gamma_table_t is array (0 .. 255) of uint16_t;
  pragma convention (c, gamma_table_t);

  -- Array of color values for SDL_SetPalette, etc.
  type color_array_t is array (0 .. 255) of color_t;
  pragma convention (c, color_array_t);

  -- Array of rectangles for SDL_UpdateRect, etc.
  type rect_array_t is array (positive range <>) of rect_t;
  pragma convention (c, rect_array_t);

  --
  -- API functions.
  --

-- This performs a fast blit from the source surface to the
  -- destination surface.

  function blitsurface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return c.int;

  function blitsurface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return c.int;

  function blit_surface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return c.int renames blitsurface;

  function blit_surface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return c.int renames blitsurface;

  procedure blitsurface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t);

  procedure blitsurface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t);

  procedure blitsurface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : in out rect_t);

  procedure blitsurface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : in out rect_t);

  procedure blit_surface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) renames blitsurface;

  procedure blit_surface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) renames blitsurface;

  procedure blit_surface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : in out rect_t) renames blitsurface;

  procedure blit_surface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : in out rect_t) renames blitsurface;

  pragma import (c, blitsurface, "SDL_UpperBlit");

  function blitsurface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return boolean;

  function blitsurface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return boolean;

  function blit_surface
   (src      : surface_access_t;
    src_rect : rect_access_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return boolean renames blitsurface;

  function blit_surface
   (src      : surface_access_t;
    src_rect : rect_t;
    dst      : surface_access_t;
    dst_rect : rect_access_t) return boolean renames blitsurface;

  pragma inline (blitsurface);

  -- Converts a surface to the same format as another surface.
  function convertsurface
   (src   : surface_access_t;
    fmt   : pixel_format_access_t;
    flags : surface_flags_t) return surface_access_t;

  function convert_surface
   (src   : surface_access_t;
    fmt   : pixel_format_access_t;
    flags : surface_flags_t) return surface_access_t renames convertsurface;

  pragma import (c, convertsurface, "SDL_ConvertSurface");

  -- Create an empty SDL_Surface
  function creatergbsurface
   (flags  : surface_flags_t;
    width  : c.int;
    height : c.int;
    bpp    : c.int;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t;

  function create_rgb_surface
   (flags  : surface_flags_t;
    width  : c.int;
    height : c.int;
    bpp    : c.int;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t renames creatergbsurface;
  pragma import (c, creatergbsurface, "SDL_CreateRGBSurface");

  -- Creates an SDL_Surface from pixel data
  function creatergbsurfacefrom
   (pixels : void_ptr_t;
    width  : c.int;
    height : c.int;
    bpp    : c.int;
    pitch  : c.int;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t;

  function create_rgb_surface_from
   (pixels : void_ptr_t;
    width  : c.int; 
    height : c.int;
    bpp    : c.int;
    pitch  : c.int;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t renames creatergbsurfacefrom;
  pragma import (c, creatergbsurfacefrom, "SDL_CreateRGBSurfaceFrom");

  function creatergbsurfacefrom
   (pixels : void_ptr_t;
    width  : natural;
    height : natural;
    bpp    : positive;
    pitch  : positive;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t;

  function create_rgb_surface_from
   (pixels : void_ptr_t;
    width  : natural;
    height : natural;
    bpp    : positive;
    pitch  : positive;
    rmask  : uint32_t;
    gmask  : uint32_t;
    bmask  : uint32_t;
    amask  : uint32_t) return surface_access_t renames creatergbsurfacefrom;
  pragma inline (creatergbsurfacefrom);

  -- Convert a surface to the display format
  function displayformat (surf : surface_access_t) return surface_access_t;
  function display_format (surf : surface_access_t) return surface_access_t renames displayformat;
  pragma import (c, displayformat, "SDL_DisplayFormat");

  -- Convert a surface to the display format
  function displayformatalpha (surf : surface_access_t) return surface_access_t;
  function display_format_alpha (surf : surface_access_t) return surface_access_t renames displayformatalpha;
  pragma import (c, displayformatalpha, "SDL_DisplayFormatAlpha");

  -- This function performs a fast fill of the given rectangle with color.
  function fillrect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t) return c.int;

  procedure fillrect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t);

  procedure fillrect
   (dst   : surface_access_t;
    r     : in out rect_t;
    color : uint32_t);

  function fill_rect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t) return c.int renames fillrect;

  procedure fill_rect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t) renames fillrect;

  procedure fill_rect
   (dst   : surface_access_t;
    r     : in out rect_t;
    color : uint32_t) renames fillrect;
  pragma import (c, fillrect, "SDL_FillRect");

  function fillrect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t) return boolean;

  function fill_rect
   (dst   : surface_access_t;
    r     : rect_access_t;
    color : uint32_t) return boolean renames fillrect;
  pragma inline (fillrect);

  -- Swaps screen buffers
  function flip (surf : surface_access_t) return c.int;
  procedure flip (surf : surface_access_t);
  pragma import (c, flip, "SDL_Flip");

  function flip (surf : surface_access_t) return boolean;
  pragma inline (flip);

  -- Frees (deletes) a SDL_Surface
  procedure freesurface (surf : surface_access_t);
  procedure free_surface (surf : surface_access_t) renames freesurface;
  pragma import (c, freesurface, "SDL_FreeSurface");

  -- Gets the clipping rectangle for a surface.
  procedure getcliprect
   (surf   : surface_access_t;
    rect_t : rect_access_t);

  procedure get_clip_rect
   (surf   : surface_access_t;
    rect_t : rect_access_t) renames getcliprect;
  pragma import (c, getcliprect, "SDL_GetClipRect");

  -- Gets the color gamma lookup tables for the display
  function getgammaramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return c.int;

  function get_gamma_ramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return c.int renames getgammaramp;
  pragma import (c, getgammaramp, "SDL_GetGammaRamp");

  function getgammaramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return boolean;

  function get_gamma_ramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return boolean renames getgammaramp;
  pragma inline (getgammaramp);

  -- Gets RGB values from a pixel in the specified pixel format.
  procedure getrgb
   (pixel : uint32_t;
    fmt   : pixel_format_access_t;
    r     : uint8_ptr_t;
    g     : uint8_ptr_t;
    b     : uint8_ptr_t);

  procedure get_rgb
   (pixel : uint32_t;
    fmt   : pixel_format_access_t;
    r     : uint8_ptr_t;
    g     : uint8_ptr_t;
    b     : uint8_ptr_t) renames getrgb;
  pragma import (c, getrgb, "SDL_GetRGB");

  -- Gets RGBA values from a pixel in the specified pixel format.
  procedure getrgba
   (pixel : uint32_t;
    fmt   : pixel_format_access_t;
    r     : uint8_ptr_t;
    g     : uint8_ptr_t;
    b     : uint8_ptr_t;
    a     : uint8_ptr_t);

  procedure get_rgba
   (pixel : uint32_t;
    fmt   : pixel_format_access_t;
    r     : uint8_ptr_t;
    g     : uint8_ptr_t;
    b     : uint8_ptr_t;
    a     : uint8_ptr_t) renames getrgba;
  pragma import (c, getrgba, "SDL_GetRGBA");

  -- return s a pointer to information about the video hardware
  function getvideoinfo return video_info_access_t;
  function get_video_info return video_info_access_t renames getvideoinfo;
  pragma import (c, getvideoinfo, "SDL_GetVideoInfo");

  -- return s a pointer to the current display surface
  function getvideosurface return surface_access_t;
  function get_video_surface return surface_access_t renames getvideosurface;
  pragma import (c, getvideosurface, "SDL_GetVideoSurface");

  -- return s a pointer to an array of available screen dimensions for the given
  -- format and video flags.
  function listmodes
   (fmt   : access pixel_format_t;
    flags : uint32_t) return access rect_access_t;
  function list_modes
   (fmt   : access pixel_format_t;
    flags : uint32_t) return access rect_access_t renames listmodes;
  pragma import (c, listmodes, "SDL_ListModes");

  -- Locks a surface for direct access.
  function locksurface (surf : surface_access_t) return c.int;
  function lock_surface (surf : surface_access_t) return c.int renames locksurface;
  pragma import (c, locksurface, "SDL_LockSurface");

  function locksurface (surf : surface_access_t) return boolean;
  function lock_surface (surf : surface_access_t) return boolean renames locksurface;
  pragma inline (locksurface);

  -- Maps a RGB color value to a pixel format.
  function maprgb
   (fmt : pixel_format_access_t;
    r   : uint8_t;
    g   : uint8_t;
    b   : uint8_t) return uint32_t;

  function map_rgb
   (fmt : pixel_format_access_t;
    r   : uint8_t;
    g   : uint8_t;
    b   : uint8_t) return uint32_t renames maprgb;
  pragma import (c, maprgb, "SDL_MapRGB");

  -- Maps a RGBA color value to a pixel format.
  function maprgba
   (fmt : pixel_format_access_t;
    r   : uint8_t;
    g   : uint8_t;
    b   : uint8_t;
    a   : uint8_t) return uint32_t;
  function map_rgba
   (fmt : pixel_format_access_t;
    r   : uint8_t;
    g   : uint8_t;
    b   : uint8_t;
    a   : uint8_t) return uint32_t renames maprgba;
  pragma import (c, maprgba, "SDL_MapRGBA");

  -- Adjusts the alpha properties of a surface.
  function setalpha
   (surf  : surface_access_t;
    flags : uint32_t;
    alpha : uint8_t) return c.int;

  function set_alpha
   (surf  : surface_access_t;
    flags : uint32_t;
    alpha : uint8_t) return c.int renames setalpha;
  pragma import (c, setalpha, "SDL_SetAlpha");

  function setalpha
   (surf  : surface_access_t;
    flags : uint32_t;
    alpha : uint8_t) return boolean;

  function set_alpha
   (surf  : surface_access_t;
    flags : uint32_t;
    alpha : uint8_t) return boolean renames setalpha;
  pragma inline (setalpha);

  -- Sets the clipping rectangle for a surface.
  procedure setcliprect
   (surf : surface_access_t;
    r    : access rect_t);

  procedure set_clip_rect
   (surf : surface_access_t;
    r    : access rect_t) renames setcliprect;
  pragma import (c, setcliprect, "SDL_SetClipRect");

  -- Sets the color key (transparent pixel) in a blittable surface
  -- and RLE acceleration.
  function setcolorkey
   (surf : surface_access_t;
    flag : uint32_t;
    key  : uint32_t) return c.int;

  function set_color_key
   (surf : surface_access_t;
    flag : uint32_t;
    key  : uint32_t) return c.int renames setcolorkey;
  pragma import (c, setcolorkey, "SDL_SetColorKey");

  function setcolorkey
   (surf : surface_access_t;
    flag : uint32_t;
    key  : uint32_t) return boolean;

  function set_color_key
   (surf : surface_access_t;
    flag : uint32_t;
    key  : uint32_t)
    return boolean renames setcolorkey;
  pragma inline (setcolorkey);

  -- Sets a portion of the colormap for the given 8-bit surface.
  function setcolors
   (surf    : surface_access_t;
    colors  : color_access_t;
    color1  : c.int;
    ncolors : c.int) return c.int;

  function set_colors
   (surf    : surface_access_t;
    colors  : color_access_t;
    color1  : c.int;
    ncolors : c.int) return c.int renames setcolors;
  pragma import (c, setcolors, "SDL_SetColors");

  function setcolors
   (surf        : surface_access_t;
    colors      : color_array_t;
    first_color : natural;
    num_colors  : natural) return boolean;

  function set_colors
   (surf        : surface_access_t;
    colors      : color_array_t;
    first_color : natural;
    num_colors  : natural) return boolean renames setcolors;
  pragma inline (setcolors);

  -- Sets the color gamma function for the display
  function setgamma
   (red   : c.c_float;
    green : c.c_float;
    blue  : c.c_float) return c.int;

  function set_gamma
   (red   : c.c_float;
    green : c.c_float;
    blue  : c.c_float) return c.int renames setgamma;
  pragma import (c, setgamma, "SDL_SetGamma");

  function setgamma
    (red   : float;
     green : float;
     blue  : float) return boolean;

  function set_gamma
   (red   : float;
    green : float;
    blue  : float) return boolean renames setgamma;
  pragma inline (setgamma);

  -- Sets the color gamma lookup tables for the display.
  function setgammaramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return c.int;

  function set_gamma_ramp
   (red   : uint16_ptr_t;
    green : uint16_ptr_t;
    blue  : uint16_ptr_t) return c.int renames setgammaramp;
  pragma import (c, setgammaramp, "SDL_SetGammaRamp");

  function setgammaramp
   (red   : gamma_table_t;
    green : gamma_table_t;
    blue  : gamma_table_t) return boolean;

  function set_gamma_ramp
   (red   : gamma_table_t;
    green : gamma_table_t;
    blue  : gamma_table_t) return boolean renames setgammaramp;
  pragma inline (setgammaramp);

  -- Sets the colors in the palette of an 8-bit surface.
  function setpalette
   (surf    : surface_access_t;
    flags   : c.int;
    colors  : color_access_t;
    color1  : c.int;
    ncolors : c.int) return c.int;

  function set_palette
   (surf    : surface_access_t;
    flags   : c.int;
    colors  : color_access_t;
    color1  : c.int;
    ncolors : c.int) return c.int renames setpalette;
  pragma import (c, setpalette, "SDL_SetPalette");

  function setpalette
   (surf        : surface_access_t;
    flags       : c.int;
    colors      : color_array_t;
    first_color : natural;
    num_colors  : natural) return boolean;

  function set_palette
   (surf        : surface_access_t;
    flags       : c.int;
    colors      : color_array_t;
    first_color : natural;
     num_colors : natural) return boolean renames setpalette;
  pragma inline (setpalette);

  -- Sets up a video mode with the specified width, height and bits-per-pixel.
  function setvideomode
   (width  : c.int;
    height : c.int;
    bpp    : c.int;
    flags  : surface_flags_t) return surface_access_t;

  function set_video_mode
   (width  : c.int;
    height : c.int;
    bpp    : c.int;
    flags  : surface_flags_t) return surface_access_t renames setvideomode;
  pragma import (c, setvideomode, "SDL_SetVideoMode");

  function setvideomode
   (width  : positive;
    height : positive;
    bpp    : natural;
    flags  : surface_flags_t) return surface_access_t;

  function set_video_mode
   (width  : positive;
    height : positive;
    bpp    : natural;
    flags  : surface_flags_t)
    return surface_access_t renames setvideomode;

  -- Unlocks a previously locked surface.
  procedure unlocksurface (surf : surface_access_t);
  procedure unlock_surface (surf : surface_access_t) renames unlocksurface;
  pragma import (c, unlocksurface, "SDL_UnlockSurface");

  -- Makes sure the given area is updated on the given screen.
  procedure updaterect
   (surf : surface_access_t;
    x    : int32_t;
    y    : int32_t;
    w    : int32_t;
    h    : int32_t);

  procedure update_rect
   (surf : surface_access_t;
    x    : int32_t;
    y    : int32_t;
    w    : int32_t;
    h    : int32_t) renames updaterect;
  pragma import (c, updaterect, "SDL_UpdateRect");

  -- Makes sure the given list of rectangles is updated on the given screen.
  procedure updaterects
   (surf  : surface_access_t;
    rects : rect_array_t);

  procedure update_rects
   (surf  : surface_access_t;
    rects : rect_array_t) renames updaterects;
  pragma inline (updaterects);

  -- Checks to see if a particular video mode is supported.
  function videomodeok
   (width  : c.int;
    height : c.int;
    bpp    : c.int;
    flags  : uint32_t) return c.int;

  function video_mode_ok
   (width  : c.int;
    height : c.int;
    bpp    : c.int;
    flags  : uint32_t) return c.int renames videomodeok;
  pragma import (c, videomodeok, "SDL_VideoModeOK");

  function videomodeok
   (width  : natural;
    height : natural;
    bpp    : natural;
    flags  : surface_flags_t) return boolean;

  function video_mode_ok
   (width  : natural;
    height : natural;
    bpp    : natural;
    flags  : surface_flags_t) return boolean renames videomodeok;
  pragma inline (videomodeok);

  -- Evaluates to true if the surface needs to be locked before access
  function mustlock (surf : surface_access_t) return boolean;
  pragma inline (mustlock);

end sdl.video;
