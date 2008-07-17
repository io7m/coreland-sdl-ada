--
-- TODO: SDL_GL_*, YUV
--

with interfaces.c;

package SDL.video is
  package c renames interfaces.c;

  -- Surface flags.
  type surface_flags_t is new uint32;
  pragma convention (c, surface_flags_t);

  -- Available for SDL_CreateRGBSurface() or SDL_SetVideoMode()
  SWSURFACE:   constant surface_flags_t := 16#00000000#;
  HWSURFACE:   constant surface_flags_t := 16#00000001#;
  ASYNCBLIT:   constant surface_flags_t := 16#00000004#;

  -- Available for SDL_SetVideoMode()
  ANYFORMAT:   constant surface_flags_t := 16#10000000#;
  HWPALETTE:   constant surface_flags_t := 16#20000000#;
  DOUBLEBUF:   constant surface_flags_t := 16#40000000#;
  FULLSCREEN:  constant surface_flags_t := 16#80000000#;
  OPENGL:      constant surface_flags_t := 16#00000002#;
  OPENGLBLIT:  constant surface_flags_t := 16#0000000A#;
  RESIZABLE:   constant surface_flags_t := 16#00000010#;
  NOFRAME:     constant surface_flags_t := 16#00000020#;

  -- Used internally (read-only)
  HWACCEL:     constant surface_flags_t := 16#00000100#;
  SRCCOLORKEY: constant surface_flags_t := 16#00001000#;
  RLEACCELOK:  constant surface_flags_t := 16#00002000#;
  RLEACCEL:    constant surface_flags_t := 16#00004000#;
  SRCALPHA:    constant surface_flags_t := 16#00010000#;
  PREALLOC:    constant surface_flags_t := 16#01000000#;

  -- Defines a rectangular area.
  type rect_t is record
    x: int16;
    y: int16;
    w: uint16;
    h: uint16;
  end record;
  type rect_ptr_t is access all rect_t;
  pragma convention (c, rect_t);
  pragma convention (c, rect_ptr_t);

  -- Format independent color description.
  type color_t is record
    r: uint8;
    g: uint8;
    b: uint8;
    a: uint8;
  end record;
  type color_ptr_t is access all color_t;
  pragma convention (c, color_t);
  pragma convention (c, color_ptr_t);

  -- Color palette for 8-bit pixel formats.
  type palette_t is record
    ncolors: c.int;
     colors: access c.int;
  end record;
  type palette_ptr_t is access all palette_t;
  pragma convention (c, palette_t);
  pragma convention (c, palette_ptr_t);

  -- Stores surface format information
  type pixel_format_t is record
          palette: palette_ptr_t;
     BitsPerPixel: uint8;
    BytesPerPixel: uint8;
            Rloss: uint8;
            Gloss: uint8;
            Bloss: uint8;
            Aloss: uint8;
           Rshift: uint8;
           Gshift: uint8;
           Bshift: uint8;
           Ashift: uint8;
            Rmask: uint32;
            Gmask: uint32;
            Bmask: uint32;
            Amask: uint32;
         colorkey: uint32;
            alpha: uint8;
  end record;
  type pixel_format_ptr_t is access all pixel_format_t;
  pragma convention (c, pixel_format_t);
  pragma convention (c, pixel_format_ptr_t);

  -- Graphical Surface Structure
  type surface_t is record
             flags: surface_flags_t;
            format: pixel_format_ptr_t;
                 w: c.int;
                 h: c.int;
             pitch: uint16;
            pixels: void_ptr_t;
            offset: c.int;
            hwdata: void_ptr_t;
         clip_rect: rect_t;
           unused1: uint32;
            locked: uint32;
               map: void_ptr_t;
    format_version: c.unsigned;
          refcount: c.int;
  end record;
  type surface_ptr_t is access all surface_t;
  pragma convention (c, surface_t);
  pragma convention (c, surface_ptr_t);

  -- bitfield types
  type bitfield_1 is mod 2 ** 1;
  type bitfield_6 is mod 2 ** 6;
   for bitfield_1'size use 1;
   for bitfield_6'size use 6;
  pragma convention (c, bitfield_1);
  pragma convention (c, bitfield_6);

  -- Useful for determining the video hardware capabilities
  type video_info_t is record
    hw_available: bitfield_1;
    wm_available: bitfield_1;
     unusedbits1: bitfield_6;
     unusedbits2: bitfield_1;
         blit_hw: bitfield_1;
      blit_hw_cc: bitfield_1;
       blit_hw_a: bitfield_1;
         blit_sw: bitfield_1;
      blit_sw_cc: bitfield_1;
       blit_sw_a: bitfield_1;
       blit_fill: bitfield_1;
     unusedbits3: uint16;
       video_mem: uint32;
            vfmt: pixel_format_ptr_t;
       current_w: c.int;
       current_h: c.int;
  end record;
  type video_info_ptr_t is access all video_info_t;
  pragma convention (c, video_info_t);
  pragma convention (c, video_info_ptr_t);

  -- Table of gamma values for SDL_SetGamma, etc.
  type gamma_table_t is array (0 .. 255) of uint16;
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

  function BlitSurface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return c.int;
  function BlitSurface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return c.int;
  function blit_surface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return c.int renames BlitSurface;
  function blit_surface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return c.int renames BlitSurface;

  procedure BlitSurface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t);
  procedure BlitSurface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t);
  procedure BlitSurface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: in out rect_t);
  procedure BlitSurface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: in out rect_t);
  procedure blit_surface (src: surface_ptr_t; src_rect: rect_ptr_t;
    dst: surface_ptr_t; dst_rect: rect_ptr_t) renames BlitSurface;
  procedure blit_surface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) renames BlitSurface;
  procedure blit_surface (src: surface_ptr_t; src_rect: rect_ptr_t;
    dst: surface_ptr_t; dst_rect: in out rect_t) renames BlitSurface;
  procedure blit_surface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: in out rect_t) renames BlitSurface;

  pragma import (c, BlitSurface, "SDL_UpperBlit");

  function BlitSurface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return boolean;
  function BlitSurface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return boolean;
  function blit_surface (src: surface_ptr_t; src_rect: rect_ptr_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return boolean renames BlitSurface;
  function blit_surface (src: surface_ptr_t; src_rect: rect_t; dst: surface_ptr_t;
    dst_rect: rect_ptr_t) return boolean renames BlitSurface;

  pragma inline (BlitSurface);

  -- Converts a surface to the same format as another surface.
  function ConvertSurface (src: surface_ptr_t; fmt: pixel_format_ptr_t;
    flags: surface_flags_t) return surface_ptr_t;
  function convert_surface (src: surface_ptr_t; fmt: pixel_format_ptr_t;
    flags: surface_flags_t) return surface_ptr_t renames ConvertSurface;
  pragma import (c, ConvertSurface, "SDL_ConvertSurface");

  -- Create an empty SDL_Surface
  function CreateRGBSurface (flags: surface_flags_t; width, height, bpp: c.int;
    rmask, gmask, bmask, amask: uint32) return surface_ptr_t;
  function create_rgb_surface (flags: surface_flags_t; width, height, bpp: c.int;
    rmask, gmask, bmask, amask: uint32) return surface_ptr_t renames CreateRGBSurface;
  pragma import (c, CreateRGBSurface, "SDL_CreateRGBSurface");

  -- Creates an SDL_Surface from pixel data
  function CreateRGBSurfaceFrom (pixels: void_ptr_t; width, height, bpp, pitch: c.int;
    rmask, gmask, bmask, amask: uint32) return surface_ptr_t;
  function create_rgb_surface_from (pixels: void_ptr_t; width, height, bpp, pitch: c.int;
    rmask, gmask, bmask, amask: uint32) return surface_ptr_t renames CreateRGBSurfaceFrom;
  pragma import (c, CreateRGBSurfaceFrom, "SDL_CreateRGBSurfaceFrom");

  function CreateRGBSurfaceFrom (pixels: void_ptr_t; width, height: natural;
    bpp: positive; pitch: positive; rmask, gmask, bmask, amask: uint32)
      return surface_ptr_t;
  function create_rgb_surface_from (pixels: void_ptr_t; width, height: natural;
    bpp: positive; pitch: positive; rmask, gmask, bmask, amask: uint32)
      return surface_ptr_t renames CreateRGBSurfaceFrom;
  pragma inline (CreateRGBSurfaceFrom);

  -- Convert a surface to the display format
  function DisplayFormat (surf: surface_ptr_t) return surface_ptr_t;
  function display_format (surf: surface_ptr_t) return surface_ptr_t renames DisplayFormat;
  pragma import (c, DisplayFormat, "SDL_DisplayFormat");

  -- Convert a surface to the display format
  function DisplayFormatAlpha (surf: surface_ptr_t) return surface_ptr_t;
  function display_format_alpha (surf: surface_ptr_t) return surface_ptr_t renames DisplayFormatAlpha;
  pragma import (c, DisplayFormatAlpha, "SDL_DisplayFormatAlpha");

  -- This function performs a fast fill of the given rectangle with color.
  function FillRect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32) return c.int;
  procedure FillRect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32);
  procedure FillRect (dst: surface_ptr_t; r: in out rect_t; color: uint32);
  function fill_rect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32) return c.int renames FillRect;
  procedure fill_rect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32) renames FillRect;
  procedure fill_rect (dst: surface_ptr_t; r: in out rect_t; color: uint32) renames FillRect;
  pragma import (c, FillRect, "SDL_FillRect");

  function FillRect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32) return boolean;
  function fill_rect (dst: surface_ptr_t; r: rect_ptr_t; color: uint32) return boolean renames FillRect;
  pragma inline (FillRect);

  -- Swaps screen buffers
  function Flip (surf: surface_ptr_t) return c.int;
  procedure Flip (surf: surface_ptr_t);
  pragma import (c, Flip, "SDL_Flip");

  function Flip (surf: surface_ptr_t) return boolean;
  pragma inline (Flip);

  -- Frees (deletes) a SDL_Surface
  procedure FreeSurface (surf: surface_ptr_t);
  procedure free_surface (surf: surface_ptr_t) renames FreeSurface;
  pragma import (c, FreeSurface, "SDL_FreeSurface");  

  -- Gets the clipping rectangle for a surface.
  procedure GetClipRect (surf: surface_ptr_t; rect_t: rect_ptr_t);
  procedure get_clip_rect (surf: surface_ptr_t; rect_t: rect_ptr_t) renames GetClipRect;
  pragma import (c, GetClipRect, "SDL_GetClipRect");

  -- Gets the color gamma lookup tables for the display
  function GetGammaRamp (red, green, blue: uint16_ptr) return c.int;
  function get_gamma_ramp (red, green, blue: uint16_ptr) return c.int renames GetGammaRamp;
  pragma import (c, GetGammaRamp, "SDL_GetGammaRamp");

  function GetGammaRamp (red, green, blue: uint16_ptr) return boolean;
  function get_gamma_ramp (red, green, blue: uint16_ptr) return boolean renames GetGammaRamp;
  pragma inline (GetGammaRamp);

  -- Gets RGB values from a pixel in the specified pixel format.
  procedure GetRGB (pixel: uint32; fmt: pixel_format_ptr_t; r, g, b: uint8_ptr);
  procedure get_rgb (pixel: uint32; fmt: pixel_format_ptr_t; r, g, b: uint8_ptr) renames GetRGB;
  pragma import (c, GetRGB, "SDL_GetRGB");

  -- Gets RGBA values from a pixel in the specified pixel format.
  procedure GetRGBA (pixel: uint32; fmt: pixel_format_ptr_t; r, g, b, a: uint8_ptr);
  procedure get_rgba (pixel: uint32; fmt: pixel_format_ptr_t; r, g, b, a: uint8_ptr) renames GetRGBA;
  pragma import (c, GetRGBA, "SDL_GetRGBA");

  -- Returns a pointer to information about the video hardware
  function GetVideoInfo return video_info_ptr_t;
  function get_video_info return video_info_ptr_t renames GetVideoInfo;
  pragma import (c, GetVideoInfo, "SDL_GetVideoInfo");

  -- Returns a pointer to the current display surface
  function GetVideoSurface return surface_ptr_t;
  function get_video_surface return surface_ptr_t renames GetVideoSurface;
  pragma import (c, GetVideoSurface, "SDL_GetVideoSurface");
 
  -- Returns a pointer to an array of available screen dimensions for the given
  -- format and video flags.
  function ListModes (fmt: access pixel_format_t; flags: uint32)
    return access rect_ptr_t;
  function list_modes (fmt: access pixel_format_t; flags: uint32)
    return access rect_ptr_t renames ListModes;
  pragma import (c, ListModes, "SDL_ListModes");

  -- Locks a surface for direct access.
  function LockSurface (surf: surface_ptr_t) return c.int;
  function lock_surface (surf: surface_ptr_t) return c.int renames LockSurface;
  pragma import (c, LockSurface, "SDL_LockSurface");

  function LockSurface (surf: surface_ptr_t) return boolean;
  function lock_surface (surf: surface_ptr_t) return boolean renames LockSurface;
  pragma inline (LockSurface);
 
  -- Maps a RGB color value to a pixel format.
  function MapRGB (fmt: pixel_format_ptr_t; r, g, b: uint8) return uint32;
  function map_rgb (fmt: pixel_format_ptr_t; r, g, b: uint8) return uint32 renames MapRGB;
  pragma import (c, MapRGB, "SDL_MapRGB");

  -- Maps a RGBA color value to a pixel format.
  function MapRGBA (fmt: pixel_format_ptr_t; r, g, b, a: uint8) return uint32;
  function map_rgba (fmt: pixel_format_ptr_t; r, g, b, a: uint8) return uint32 renames MapRGBA;
  pragma import (c, MapRGBA, "SDL_MapRGBA");

  -- Adjusts the alpha properties of a surface.
  function SetAlpha (surf: surface_ptr_t; flags: uint32; alpha: uint8) return c.int;
  function set_alpha (surf: surface_ptr_t; flags: uint32; alpha: uint8) return c.int renames SetAlpha;
  pragma import (c, SetAlpha, "SDL_SetAlpha");

  function SetAlpha (surf: surface_ptr_t; flags: uint32; alpha: uint8) return boolean;
  function set_alpha (surf: surface_ptr_t; flags: uint32; alpha: uint8) return boolean renames SetAlpha;
  pragma inline (SetAlpha);
 
  -- Sets the clipping rectangle for a surface.
  procedure SetClipRect (surf: surface_ptr_t; r: access rect_t);
  procedure set_clip_rect (surf: surface_ptr_t; r: access rect_t) renames SetClipRect;
  pragma import (c, SetClipRect, "SDL_SetClipRect");

  -- Sets the color key (transparent pixel) in a blittable surface
  -- and RLE acceleration.
  function SetColorKey (surf: surface_ptr_t; flag, key: uint32) return c.int;
  function set_color_key (surf: surface_ptr_t; flag, key: uint32) return c.int renames SetColorKey;
  pragma import (c, SetColorKey, "SDL_SetColorKey");

  function SetColorKey (surf: surface_ptr_t; flag, key: uint32) return boolean;
  function set_color_key (surf: surface_ptr_t; flag, key: uint32) return boolean renames SetColorKey;
  pragma inline (SetColorKey); 

  -- Sets a portion of the colormap for the given 8-bit surface.
  function SetColors (surf: surface_ptr_t; colors: color_ptr_t;
    color1, ncolors: c.int) return c.int;
  function set_colors (surf: surface_ptr_t; colors: color_ptr_t;
    color1, ncolors: c.int) return c.int renames SetColors;
  pragma import (c, SetColors, "SDL_SetColors");

  function SetColors (surf: surface_ptr_t; colors: color_array_t;
    first_color, num_colors: natural) return boolean;
  function set_colors (surf: surface_ptr_t; colors: color_array_t;
    first_color, num_colors: natural) return boolean renames SetColors;
  pragma inline (SetColors);
 
  -- Sets the color gamma function for the display
  function SetGamma (red, green, blue: c.c_float) return c.int;
  function set_gamma (red, green, blue: c.c_float) return c.int renames SetGamma;
  pragma import (c, SetGamma, "SDL_SetGamma");

  function SetGamma (red, green, blue: float) return boolean;
  function set_gamma (red, green, blue: float) return boolean renames SetGamma;
  pragma inline (SetGamma);

  -- Sets the color gamma lookup tables for the display.
  function SetGammaRamp (red, green, blue: uint16_ptr) return c.int;
  function set_gamma_ramp (red, green, blue: uint16_ptr) return c.int renames SetGammaRamp;
  pragma import (c, SetGammaRamp, "SDL_SetGammaRamp");

  function SetGammaRamp (red, green, blue: gamma_table_t) return boolean;
  function set_gamma_ramp (red, green, blue: gamma_table_t) return boolean renames SetGammaRamp;
  pragma inline (SetGammaRamp);

  -- Sets the colors in the palette of an 8-bit surface.
  function SetPalette (surf: surface_ptr_t; flags: c.int; colors: color_ptr_t;
    color1, ncolors: c.int) return c.int;
  function set_palette (surf: surface_ptr_t; flags: c.int; colors: color_ptr_t;
    color1, ncolors: c.int) return c.int renames SetPalette;
  pragma import (c, SetPalette, "SDL_SetPalette");

  function SetPalette (surf: surface_ptr_t; flags: c.int; colors: color_array_t;
    first_color, num_colors: natural) return boolean;
  function set_palette (surf: surface_ptr_t; flags: c.int; colors: color_array_t;
    first_color, num_colors: natural) return boolean renames SetPalette;
  pragma inline (SetPalette); 

  -- Sets up a video mode with the specified width, height and bits-per-pixel.
  function SetVideoMode (width, height, bpp: c.int; flags: surface_flags_t) return surface_ptr_t;
  function set_video_mode (width, height, bpp: c.int; flags: surface_flags_t) return surface_ptr_t renames SetVideoMode;
  pragma import (c, SetVideoMode, "SDL_SetVideoMode");

  function SetVideoMode (width, height: positive; bpp: natural; flags: surface_flags_t) return surface_ptr_t;
  function set_video_mode (width, height: positive; bpp: natural; flags: surface_flags_t) return surface_ptr_t renames SetVideoMode;

  -- Unlocks a previously locked surface.
  procedure UnlockSurface (surf: surface_ptr_t);
  procedure unlock_surface (surf: surface_ptr_t) renames UnlockSurface;
  pragma import (c, UnlockSurface, "SDL_UnlockSurface");

  -- Makes sure the given area is updated on the given screen.
  procedure UpdateRect (surf: surface_ptr_t; x, y, w, h: int32);
  procedure update_rect (surf: surface_ptr_t; x, y, w, h: int32) renames UpdateRect;
  pragma import (c, UpdateRect, "SDL_UpdateRect");

  -- Makes sure the given list of rectangles is updated on the given screen.
  procedure UpdateRects (surf: surface_ptr_t; rects: rect_array_t);
  procedure update_rects (surf: surface_ptr_t; rects: rect_array_t) renames UpdateRects;
  pragma inline (UpdateRects);

  -- Checks to see if a particular video mode is supported.
  function VideoModeOK (width, height, bpp: c.int; flags: uint32) return c.int;
  function video_mode_ok (width, height, bpp: c.int; flags: uint32) return c.int renames VideoModeOK;
  pragma import (c, VideoModeOK, "SDL_VideoModeOK");

  function VideoModeOK (width, height, bpp: natural; flags: surface_flags_t) return boolean;
  function video_mode_ok (width, height, bpp: natural; flags: surface_flags_t) return boolean renames VideoModeOK;
  pragma inline (VideoModeOK);
 
  -- Evaluates to true if the surface needs to be locked before access
  function MUSTLOCK (surf: surface_ptr_t) return boolean;
  pragma inline (MUSTLOCK);

end SDL.video;
