--
-- TODO: SDL_GL_*, YUV
--

with interfaces.c;

package SDL.video is
  package c renames interfaces.c;

  -- Surface flags.
  type surface_flags is new uint32;
  pragma convention (c, surface_flags);

  -- Available for SDL_CreateRGBSurface() or SDL_SetVideoMode()
  SWSURFACE:   constant surface_flags := 16#00000000#;
  HWSURFACE:   constant surface_flags := 16#00000001#;
  ASYNCBLIT:   constant surface_flags := 16#00000004#;

  -- Available for SDL_SetVideoMode()
  ANYFORMAT:   constant surface_flags := 16#10000000#;
  HWPALETTE:   constant surface_flags := 16#20000000#;
  DOUBLEBUF:   constant surface_flags := 16#40000000#;
  FULLSCREEN:  constant surface_flags := 16#80000000#;
  OPENGL:      constant surface_flags := 16#00000002#;
  OPENGLBLIT:  constant surface_flags := 16#0000000A#;
  RESIZABLE:   constant surface_flags := 16#00000010#;
  NOFRAME:     constant surface_flags := 16#00000020#;

  -- Used internally (read-only)
  HWACCEL:     constant surface_flags := 16#00000100#;
  SRCCOLORKEY: constant surface_flags := 16#00001000#;
  RLEACCELOK:  constant surface_flags := 16#00002000#;
  RLEACCEL:    constant surface_flags := 16#00004000#;
  SRCALPHA:    constant surface_flags := 16#00010000#;
  PREALLOC:    constant surface_flags := 16#01000000#;

  -- Defines a rectangular area.
  type Rect is record
    x: int16;
    y: int16;
    w: uint16;
    h: uint16;
  end record;
  type Rect_ptr is access all Rect;
  pragma convention (c, Rect);
  pragma convention (c, Rect_ptr);

  -- Format independent color description.
  type Color is record
    r: uint8;
    g: uint8;
    b: uint8;
    a: uint8;
  end record;
  type Color_ptr is access all Color;
  pragma convention (c, Color);
  pragma convention (c, Color_ptr);

  -- Color palette for 8-bit pixel formats.
  type Palette is record
    ncolors: c.int;
     colors: access c.int;
  end record;
  type Palette_ptr is access all Palette;
  pragma convention (c, Palette);
  pragma convention (c, Palette_ptr);

  -- Stores surface format information
  type PixelFormat is record
          palette: Palette_ptr;
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
  type PixelFormat_ptr is access all PixelFormat;
  pragma convention (c, PixelFormat);
  pragma convention (c, PixelFormat_ptr);

  -- Graphical Surface Structure
  type Surface is record
             flags: surface_flags;
            format: PixelFormat_ptr;
                 w: c.int;
                 h: c.int;
             pitch: uint16;
            pixels: void_ptr;
            offset: c.int;
            hwdata: void_ptr;
         clip_rect: Rect;
           unused1: uint32;
            locked: uint32;
               map: void_ptr;
    format_version: c.unsigned;
          refcount: c.int;
  end record;
  type Surface_ptr is access all Surface;
  pragma convention (c, Surface);
  pragma convention (c, Surface_ptr);

  -- bitfield types
  type bitfield_1 is mod 2 ** 1;
  type bitfield_6 is mod 2 ** 6;
   for bitfield_1'size use 1;
   for bitfield_6'size use 6;
  pragma convention (c, bitfield_1);
  pragma convention (c, bitfield_6);

  -- Useful for determining the video hardware capabilities
  type VideoInfo is record
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
            vfmt: PixelFormat_ptr;
       current_w: c.int;
       current_h: c.int;
  end record;
  type VideoInfo_ptr is access all VideoInfo;
  pragma convention (c, VideoInfo);
  pragma convention (c, VideoInfo_ptr);

  --
  -- API functions.
  --

  -- This performs a fast blit from the source surface to the
  -- destination surface.

  function BlitSurface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect_ptr) return c.int;
  function BlitSurface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect_ptr) return c.int;
  function BlitSurface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect) return c.int;
  function BlitSurface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect) return c.int;
  function blit_surface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect_ptr) return c.int;
  function blit_surface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect_ptr) return c.int;
  function blit_surface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect) return c.int;
  function blit_surface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect) return c.int;

  procedure BlitSurface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect_ptr);
  procedure BlitSurface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect_ptr);
  procedure BlitSurface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect);
  procedure BlitSurface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect);
  procedure blit_surface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect_ptr);
  procedure blit_surface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect_ptr);
  procedure blit_surface (src: Surface_ptr; src_rect: Rect_ptr; dst: Surface_ptr; dst_rect: Rect);
  procedure blit_surface (src: Surface_ptr; src_rect: Rect; dst: Surface_ptr; dst_rect: Rect);

  pragma import (c, BlitSurface, "SDL_BlitSurface");
  pragma import (c, blit_surface, "SDL_BlitSurface");

  -- Converts a surface to the same format as another surface.
  function ConvertSurface (src: Surface_ptr; fmt: PixelFormat_ptr;
    flags: uint32) return Surface_ptr;
  function convert_surface (src: Surface_ptr; fmt: PixelFormat_ptr;
    flags: uint32) return Surface_ptr;
  pragma import (c, ConvertSurface, "SDL_ConvertSurface");
  pragma import (c, convert_surface, "SDL_ConvertSurface");

  -- Create an empty SDL_Surface
  function CreateRGBSurface (flags: surface_flags; width, height, bpp: c.int;
    rmask, gmask, bmask, amask: uint32) return Surface_ptr;
  function create_rgb_surface (flags: surface_flags; width, height, bpp: c.int;
    rmask, gmask, bmask, amask: uint32) return Surface_ptr;
  pragma import (c, CreateRGBSurface, "SDL_CreateRGBSurface");
  pragma import (c, create_rgb_surface, "SDL_CreateRGBSurface");

  -- Creates an SDL_Surface from pixel data
  function CreateRGBSurfaceFrom (pixels: void_ptr; width, height, bpp: c.int;
    rmask, gmask, bmask, amask: uint32) return Surface_ptr;
  function create_rgb_surface_from (pixels: void_ptr;
    width, height, bpp, pitch: c.int; rmask, gmask, bmask, amask: uint32)
      return Surface_ptr;
  pragma import (c, CreateRGBSurfaceFrom, "SDL_CreateRGBSurfaceFrom");
  pragma import (c, create_rgb_surface_from, "SDL_CreateRGBSurfaceFrom");

  -- Convert a surface to the display format
  function DisplayFormat (surf: Surface_ptr) return Surface_ptr;
  function display_format (surf: Surface_ptr) return Surface_ptr;
  pragma import (c, DisplayFormat, "SDL_DisplayFormat");
  pragma import (c, display_format, "SDL_DisplayFormat");

  -- Convert a surface to the display format
  function DisplayFormatAlpha (surf: Surface_ptr) return Surface_ptr;
  function display_format_alpha (surf: Surface_ptr) return Surface_ptr;
  pragma import (c, DisplayFormatAlpha, "SDL_DisplayFormatAlpha");
  pragma import (c, display_format_alpha, "SDL_DisplayFormatAlpha");

  -- This function performs a fast fill of the given rectangle with color.
  function FillRect (dst: Surface_ptr; r: Rect_ptr; color: uint32) return c.int;
  function fill_rect (dst: Surface_ptr; r: Rect_ptr; color: uint32) return c.int;
  procedure FillRect (dst: Surface_ptr; r: Rect_ptr; color: uint32);
  procedure fill_rect (dst: Surface_ptr; r: Rect_ptr; color: uint32);
  procedure FillRect (dst: Surface_ptr; r: in out Rect; color: uint32);
  procedure fill_rect (dst: Surface_ptr; r: in out Rect; color: uint32);
  pragma import (c, FillRect, "SDL_FillRect");
  pragma import (c, fill_rect, "SDL_FillRect");

  -- Swaps screen buffers
  function Flip (surf: Surface_ptr) return c.int;
  procedure Flip (surf: Surface_ptr);
  pragma import (c, Flip, "SDL_Flip");

  -- Frees (deletes) a SDL_Surface
  procedure FreeSurface (surf: Surface_ptr);
  procedure free_surface (surf: Surface_ptr);
  pragma import (c, FreeSurface, "SDL_FreeSurface");  
  pragma import (c, free_surface, "SDL_FreeSurface");  

  -- Gets the clipping rectangle for a surface.
  procedure GetClipRect (surf: Surface_ptr; rect: Rect_ptr);
  procedure get_clip_rect (surf: Surface_ptr; rect: Rect_ptr);
  pragma import (c, GetClipRect, "SDL_GetClipRect");
  pragma import (c, get_clip_rect, "SDL_GetClipRect");

  -- Gets the color gamma lookup tables for the display
  function GetGammaRamp (red, green, blue: uint16_ptr) return c.int;
  function get_gamma_ramp (red, green, blue: uint16_ptr) return c.int;
  pragma import (c, GetGammaRamp, "SDL_GetGammaRamp");
  pragma import (c, get_gamma_ramp, "SDL_GetGammaRamp");

  -- Gets RGB values from a pixel in the specified pixel format.
  procedure GetRGB (pixel: uint32; fmt: PixelFormat_ptr;
    r, g, b: uint8_ptr);
  procedure get_rgb (pixel: uint32; fmt: PixelFormat_ptr;
    r, g, b: uint8_ptr);
  pragma import (c, GetRGB, "SDL_GetRGB");
  pragma import (c, get_rgb, "SDL_GetRGB");

  -- Gets RGBA values from a pixel in the specified pixel format.
  procedure GetRGBA (pixel: uint32; fmt: PixelFormat_ptr;
    r, g, b: uint8_ptr);
  procedure get_rgba (pixel: uint32; fmt: PixelFormat_ptr;
    r, g, b, a: uint8_ptr);
  pragma import (c, GetRGBA, "SDL_GetRGBA");
  pragma import (c, get_rgba, "SDL_GetRGBA");

  -- Returns a pointer to information about the video hardware
  function GetVideoInfo return VideoInfo_ptr;
  function get_video_info return VideoInfo_ptr;
  pragma import (c, GetVideoInfo, "SDL_GetVideoInfo");
  pragma import (c, get_video_info, "SDL_GetVideoInfo");

  -- Returns a pointer to the current display surface
  function GetVideoSurface return Surface_ptr;
  function get_video_surface return Surface_ptr;
  pragma import (c, GetVideoSurface, "SDL_GetVideoSurface");
  pragma import (c, get_video_surface, "SDL_GetVideoSurface");
 
  -- Returns a pointer to an array of available screen dimensions for the given
  -- format and video flags.
  function ListModes (fmt: access PixelFormat; flags: uint32)
    return access Rect_ptr;
  function list_modes (fmt: access PixelFormat; flags: uint32)
    return access Rect_ptr;
  pragma import (c, ListModes, "SDL_ListModes");
  pragma import (c, list_modes, "SDL_ListModes");

  -- Locks a surface for direct access.
  function LockSurface (surf: Surface_ptr) return c.int;
  function lock_surface (surf: Surface_ptr) return c.int;
  pragma import (c, LockSurface, "SDL_LockSurface");
  pragma import (c, lock_surface, "SDL_LockSurface");  

  -- Maps a RGB color value to a pixel format.
  function MapRGB (fmt: PixelFormat_ptr; r, g, b: uint8) return uint32;
  function map_rgb (fmt: PixelFormat_ptr; r, g, b: uint8) return uint32;
  pragma import (c, MapRGB, "SDL_MapRGB");
  pragma import (c, map_rgb, "SDL_MapRGB");

  -- Maps a RGBA color value to a pixel format.
  function MapRGBA (fmt: PixelFormat_ptr; r, g, b, a: uint8) return uint32;
  function map_rgba (fmt: PixelFormat_ptr; r, g, b, a: uint8) return uint32;
  pragma import (c, MapRGBA, "SDL_MapRGBA");
  pragma import (c, map_rgba, "SDL_MapRGBA");

  -- Adjusts the alpha properties of a surface.
  function SetAlpha (surf: Surface_ptr; flags: uint32;
    alpha: uint8) return c.int;
  function set_alpha (surf: Surface_ptr; flags: uint32;
    alpha: uint8) return c.int;
  pragma import (c, SetAlpha, "SDL_SetAlpha");
  pragma import (c, set_alpha, "SDL_SetAlpha");

  -- Sets the clipping rectangle for a surface.
  procedure SetClipRect (surf: Surface_ptr; r: access Rect);
  procedure set_clip_rect (surf: Surface_ptr; r: access Rect);
  pragma import (c, SetClipRect, "SDL_SetClipRect");
  pragma import (c, set_clip_rect, "SDL_SetClipRect");

  -- Sets the color key (transparent pixel) in a blittable surface
  -- and RLE acceleration.
  function SetColorKey (surf: Surface_ptr; flag, key: uint32) return c.int;
  function set_color_key (surf: Surface_ptr; flag, key: uint32) return c.int;
  pragma import (c, SetColorKey, "SDL_SetColorKey");
  pragma import (c, set_color_key, "SDL_SetColorKey");

  -- Sets a portion of the colormap for the given 8-bit surface.
  function SetColors (surf: Surface_ptr; colors: access Color;
    color1, ncolors: c.int) return c.int;
  function set_colors (surf: Surface_ptr; colors: access Color;
    color1, ncolors: c.int) return c.int;
  pragma import (c, SetColors, "SDL_SetColors");
  pragma import (c, set_colors, "SDL_SetColors");

  -- Sets the color gamma function for the display
  function SetGamma (red, green, blue: c.c_float) return c.int;
  function set_gamma (red, green, blue: c.c_float) return c.int;
  pragma import (c, SetGamma, "SDL_SetGamma");
  pragma import (c, set_gamma, "SDL_SetGamma");

  -- Sets the color gamma lookup tables for the display.
  function SetGammaRamp (red, green, blue: uint16_ptr) return c.int;
  function set_gamma_ramp (red, green, blue: uint16_ptr) return c.int;
  pragma import (c, SetGammaRamp, "SDL_SetGammaRamp");
  pragma import (c, set_gamma_ramp, "SDL_SetGammaRamp");

  -- Sets the colors in the palette of an 8-bit surface.
  function SetPalette (surf: Surface_ptr; flags: c.int; colors: Color_ptr;
    color1, ncolors: c.int) return c.int;
  function set_palette (surf: Surface_ptr; flags: c.int; colors: Color_ptr;
    color1, ncolors: c.int) return c.int;
  pragma import (c, SetPalette, "SDL_SetPalette");
  pragma import (c, set_palette, "SDL_SetPalette");

  -- Sets up a video mode with the specified width, height and bits-per-pixel.
  function SetVideoMode (width, height, bpp: c.int; flags: surface_flags)
    return Surface_ptr;
  function set_video_mode (width, height, bpp: c.int; flags: surface_flags)
    return Surface_ptr;
  pragma import (c, SetVideoMode, "SDL_SetVideoMode");
  pragma import (c, set_video_mode, "SDL_SetVideoMode");

  -- Unlocks a previously locked surface.
  procedure UnlockSurface (surf: Surface_ptr);
  procedure unlock_surface (surf: Surface_ptr);
  pragma import (c, UnlockSurface, "SDL_UnlockSurface");
  pragma import (c, unlock_surface, "SDL_UnlockSurface");

  -- Makes sure the given area is updated on the given screen.
  procedure UpdateRect (surf: Surface_ptr; x, y, w, h: int32);
  procedure update_rect (surf: Surface_ptr; x, y, w, h: int32);
  pragma import (c, UpdateRect, "SDL_UpdateRect");
  pragma import (c, update_rect, "SDL_UpdateRect");

  -- Makes sure the given list of rectangles is updated on the given screen.
  procedure UpdateRects (surf: Surface_ptr; x, y, w, h: int32);
  procedure update_rects (surf: Surface_ptr; x, y, w, h: int32);
  pragma import (c, UpdateRects, "SDL_UpdateRects");
  pragma import (c, update_rects, "SDL_UpdateRects");

  -- Checks to see if a particular video mode is supported.
  function VideoModeOK (width, height, bpp: c.int; flags: uint32) return c.int;
  function video_mode_ok (width, height, bpp: c.int; flags: uint32) return c.int;
  pragma import (c, VideoModeOK, "SDL_VideoModeOK");
  pragma import (c, video_mode_ok, "SDL_VideoModeOK");

  -- Evaluates to true if the surface needs to be locked before access
  function MUSTLOCK (surf: Surface_ptr) return boolean;
  pragma inline (MUSTLOCK);

end SDL.video;
