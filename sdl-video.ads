--
-- TODO: SDL_GL_*, YUV
--

with Interfaces.C;

package SDL.Video is
  package C renames Interfaces.C;

  -- Surface flags.
  type Surface_Flags_t is new Uint32_t;
  pragma Convention (C, Surface_Flags_t);

  -- Available for SDL_CreateRGBSurface() or SDL_SetVideoMode()
  SWSURFACE : constant Surface_Flags_t := 16#00000000#;
  HWSURFACE : constant Surface_Flags_t := 16#00000001#;
  ASYNCBLIT : constant Surface_Flags_t := 16#00000004#;

  Software_Surface      : constant := SWSURFACE;
  Hardware_Surface      : constant := HWSURFACE;
  Asynchronous_Blitting : constant := ASYNCBLIT;

  -- Available for SDL_SetVideoMode()
  ANYFORMAT  : constant Surface_Flags_t := 16#10000000#;
  HWPALETTE  : constant Surface_Flags_t := 16#20000000#;
  DOUBLEBUF  : constant Surface_Flags_t := 16#40000000#;
  Fullscreen : constant Surface_Flags_t := 16#80000000#;
  OpenGL     : constant Surface_Flags_t := 16#00000002#;
  OPENGLBLIT : constant Surface_Flags_t := 16#0000000A#;
  Resizable  : constant Surface_Flags_t := 16#00000010#;
  NOFRAME    : constant Surface_Flags_t := 16#00000020#;

  Any_Format       : constant := ANYFORMAT;
  Hardware_Palette : constant := HWPALETTE;
  Double_Buffering : constant := DOUBLEBUF;
  OpenGL_Blitting  : constant := OPENGLBLIT;
  No_Frame         : constant := NOFRAME;

  -- Used internally (read-only)
  HWACCEL     : constant Surface_Flags_t := 16#00000100#;
  SRCCOLORKEY : constant Surface_Flags_t := 16#00001000#;
  RLEACCELOK  : constant Surface_Flags_t := 16#00002000#;
  RLEACCEL    : constant Surface_Flags_t := 16#00004000#;
  SRCALPHA    : constant Surface_Flags_t := 16#00010000#;
  PREALLOC    : constant Surface_Flags_t := 16#01000000#;

  -- GL attributes
  GL_Red_Size            : constant := 0;
  GL_Green_Size          : constant := 1;
  GL_Blue_Size           : constant := 2;
  GL_Alpha_Size          : constant := 3;
  GL_Buffer_Size         : constant := 4;
  GL_Double_Buffer       : constant := 5;
  GL_Depth_Size          : constant := 6;
  GL_Stencil_Size        : constant := 7;
  GL_Accum_Red_Size      : constant := 8;
  GL_Accum_Green_Size    : constant := 9;
  GL_Accum_Blue_Size     : constant := 10;
  GL_Accum_Alpha_Size    : constant := 11;
  GL_Stereo              : constant := 12;
  GL_Multisample_Buffers : constant := 13;
  GL_Multisample_Samples : constant := 14;
  GL_Accelerated_Visual  : constant := 15;
  GL_Swap_Control        : constant := 16;

  -- Defines a rectangular area.
  type Rect_t is record
    X : Int16_t;
    Y : Int16_t;
    W : Uint16_t;
    H : Uint16_t;
  end record;
  type Rect_Access_t is access all Rect_t;
  pragma Convention (C, Rect_t);
  pragma Convention (C, Rect_Access_t);

  -- Format independent color description.
  type Color_t is record
    R : Uint8_t;
    G : Uint8_t;
    B : Uint8_t;
    A : Uint8_t;
  end record;
  type Color_Access_t is access all Color_t;
  pragma Convention (C, Color_t);
  pragma Convention (C, Color_Access_t);

  -- Color palette for 8-bit pixel formats.
  type Palette_t is record
    Ncolors : C.int;
    Colors  : access C.int;
  end record;
  type Palette_Access_t is access all Palette_t;
  pragma Convention (C, Palette_t);
  pragma Convention (C, Palette_Access_t);

  -- Stores surface format information
  type Pixel_Format_t is record
    Palette       : Palette_Access_t;
    Bitsperpixel  : Uint8_t;
    Bytesperpixel : Uint8_t;
    Rloss         : Uint8_t;
    Gloss         : Uint8_t;
    Bloss         : Uint8_t;
    Aloss         : Uint8_t;
    Rshift        : Uint8_t;
    Gshift        : Uint8_t;
    Bshift        : Uint8_t;
    Ashift        : Uint8_t;
    Rmask         : Uint32_t;
    Gmask         : Uint32_t;
    Bmask         : Uint32_t;
    Amask         : Uint32_t;
    Colorkey      : Uint32_t;
    Alpha         : Uint8_t;
    Unused1       : Uint8_t; -- XXX: c compiler padding
    Unused2       : Uint8_t; -- XXX: c compiler padding
    Unused3       : Uint8_t; -- XXX: c compiler padding
  end record;
  type Pixel_Format_Access_t is access all Pixel_Format_t;
  pragma Convention (C, Pixel_Format_t);
  pragma Convention (C, Pixel_Format_Access_t);

  -- Graphical Surface Structure
  type Surface_t is record
    Flags          : Surface_Flags_t;
    Format         : Pixel_Format_Access_t;
    W              : C.int;
    H              : C.int;
    Pitch          : Uint16_t;
    Pixels         : Void_Ptr_t;
    Offset         : C.int;
    Hwdata         : Void_Ptr_t;
    Clip_Rect      : Rect_t;
    Unused1        : Uint32_t;
    Locked         : Uint32_t;
    Map            : Void_Ptr_t;
    Format_Version : C.unsigned;
    Refcount       : C.int;
  end record;
  type Surface_Access_t is access all Surface_t;
  pragma Convention (C, Surface_t);
  pragma Convention (C, Surface_Access_t);

  -- Useful for determining the video hardware capabilities

  type Video_Info_Bitfield_t is record
    Hw_Available : Integer range 0 .. 1;
    Wm_Available : Integer range 0 .. 1;
    Unusedbits1  : Integer range 0 .. 63;
    Unusedbits2  : Integer range 0 .. 1;
    Blit_Hw      : Integer range 0 .. 1;
    Blit_Hw_Cc   : Integer range 0 .. 1;
    Blit_Hw_A    : Integer range 0 .. 1;
    Blit_Sw      : Integer range 0 .. 1;
    Blit_Sw_Cc   : Integer range 0 .. 1;
    Blit_Sw_A    : Integer range 0 .. 1;
    Blit_Fill    : Integer range 0 .. 1;
    Unusedbits3  : Integer range 0 .. 65535;
  end record;
  for Video_Info_Bitfield_t use record
    Hw_Available at 0 range 0 .. 0;
    Wm_Available at 0 range 1 .. 1;
    Unusedbits1  at 0 range 2 .. 7;
    Unusedbits2  at 0 range 8 .. 8;
    Blit_Hw      at 0 range 9 .. 9;
    Blit_Hw_Cc   at 0 range 10 .. 10;
    Blit_Hw_A    at 0 range 11 .. 11;
    Blit_Sw      at 0 range 12 .. 12;
    Blit_Sw_Cc   at 0 range 13 .. 13;
    Blit_Sw_A    at 0 range 14 .. 14;
    Blit_Fill    at 0 range 15 .. 15;
    Unusedbits3  at 0 range 16 .. 31;
  end record;
  pragma Convention (C, Video_Info_Bitfield_t);

  type Video_Info_t is record
    Bits      : Video_Info_Bitfield_t;
    Video_Mem : Uint32_t;
    Vfmt      : Pixel_Format_Access_t;
    Current_W : C.int;
    Current_H : C.int;
  end record;
  type Video_Info_Access_t is access all Video_Info_t;
  pragma Convention (C, Video_Info_t);
  pragma Convention (C, Video_Info_Access_t);

  -- Table of gamma values for SDL_SetGamma, etc.
  type Gamma_Table_t is array (0 .. 255) of Uint16_t;
  pragma Convention (C, Gamma_Table_t);

  -- Array of color values for SDL_SetPalette, etc.
  type Color_Array_t is array (0 .. 255) of Color_t;
  pragma Convention (C, Color_Array_t);

  -- Array of rectangles for SDL_UpdateRect, etc.
  type Rect_Array_t is array (Positive range <>) of Rect_t;
  pragma Convention (C, Rect_Array_t);

  --
  -- API functions.
  --

-- This performs a fast blit from the source surface to the
  -- destination surface.

  function BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     C.int;

  function BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     C.int;

  function Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     C.int renames BlitSurface;

  function Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     C.int renames BlitSurface;

  procedure BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t);

  procedure BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t);

  procedure BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : in out Rect_t);

  procedure BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : in out Rect_t);

  procedure Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t) renames BlitSurface;

  procedure Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t) renames BlitSurface;

  procedure Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : in out Rect_t) renames BlitSurface;

  procedure Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : in out Rect_t) renames BlitSurface;

  pragma Import (C, BlitSurface, "SDL_UpperBlit");

  function BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     Boolean;

  function BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     Boolean;

  function Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     Boolean renames BlitSurface;

  function Blit_Surface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return     Boolean renames BlitSurface;

  pragma Inline (BlitSurface);

  -- Converts a surface to the same format as another surface.
  function ConvertSurface
   (Source   : Surface_Access_t;
    Fmt   : Pixel_Format_Access_t;
    Flags : Surface_Flags_t)
    return  Surface_Access_t;

  function Convert_Surface
   (Source   : Surface_Access_t;
    Fmt   : Pixel_Format_Access_t;
    Flags : Surface_Flags_t)
    return  Surface_Access_t renames ConvertSurface;

  pragma Import (C, ConvertSurface, "SDL_ConvertSurface");

  -- Create an empty SDL_Surface
  function CreateRGBSurface
   (Flags  : Surface_Flags_t;
    Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Rmask  : Uint32_t;
    Gmask  : Uint32_t;
    Bmask  : Uint32_t;
    Amask  : Uint32_t)
    return   Surface_Access_t;

  function Create_RGB_Surface
   (Flags  : Surface_Flags_t;
    Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Rmask  : Uint32_t;
    Gmask  : Uint32_t;
    Bmask  : Uint32_t;
    Amask  : Uint32_t)
    return   Surface_Access_t renames CreateRGBSurface;
  pragma Import (C, CreateRGBSurface, "SDL_CreateRGBSurface");

  -- Creates an SDL_Surface from pixel data
  function CreateRGBSurfacefrom
   (Pixels : Void_Ptr_t;
    Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Pitch  : C.int;
    Rmask  : Uint32_t;
    Gmask  : Uint32_t;
    Bmask  : Uint32_t;
    Amask  : Uint32_t)
    return   Surface_Access_t;

  function Create_RGB_Surface_From
   (Pixels : Void_Ptr_t;
    Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Pitch  : C.int;
    Rmask  : Uint32_t;
    Gmask  : Uint32_t;
    Bmask  : Uint32_t;
    Amask  : Uint32_t)
    return   Surface_Access_t renames CreateRGBSurfacefrom;
  pragma Import (C, CreateRGBSurfacefrom, "SDL_CreateRGBSurfaceFrom");

  function CreateRGBSurfaceFrom
   (Pixels : Void_Ptr_t;
    Width  : Natural;
    Height : Natural;
    Bpp    : Positive;
    Pitch  : Positive;
    Rmask  : Uint32_t;
    Gmask  : Uint32_t;
    Bmask  : Uint32_t;
    Amask  : Uint32_t)
    return   Surface_Access_t;

  function Create_RGB_Surface_From
   (Pixels : Void_Ptr_t;
    Width  : Natural;
    Height : Natural;
    Bpp    : Positive;
    Pitch  : Positive;
    Rmask  : Uint32_t;
    Gmask  : Uint32_t;
    Bmask  : Uint32_t;
    Amask  : Uint32_t)
    return   Surface_Access_t renames CreateRGBSurfacefrom;
  pragma Inline (CreateRGBSurfacefrom);

  -- Convert a surface to the display format
  function DisplayFormat (Surface : Surface_Access_t) return Surface_Access_t;
  function Display_Format (Surface : Surface_Access_t) return Surface_Access_t renames DisplayFormat;
  pragma Import (C, DisplayFormat, "SDL_DisplayFormat");

  -- Convert a surface to the display format
  function DisplayFormatAlpha (Surface : Surface_Access_t) return Surface_Access_t;
  function Display_Format_Alpha (Surface : Surface_Access_t) return Surface_Access_t renames DisplayFormatAlpha;
  pragma Import (C, DisplayFormatAlpha, "SDL_DisplayFormatAlpha");

  -- This function performs a fast fill of the given rectangle with color.
  function FillRect
   (Target   : Surface_Access_t;
    R     : Rect_Access_t;
    Color : Uint32_t)
    return  C.int;

  procedure FillRect (Target : Surface_Access_t; R : Rect_Access_t; Color : Uint32_t);

  procedure FillRect (Target : Surface_Access_t; R : in out Rect_t; Color : Uint32_t);

  function Fill_Rect
   (Target   : Surface_Access_t;
    R     : Rect_Access_t;
    Color : Uint32_t)
    return  C.int renames FillRect;

  procedure Fill_Rect (Target : Surface_Access_t; R : Rect_Access_t; Color : Uint32_t) renames FillRect;

  procedure Fill_Rect (Target : Surface_Access_t; R : in out Rect_t; Color : Uint32_t) renames FillRect;
  pragma Import (C, FillRect, "SDL_FillRect");

  function FillRect
   (Target   : Surface_Access_t;
    R     : Rect_Access_t;
    Color : Uint32_t)
    return  Boolean;

  function Fill_Rect
   (Target   : Surface_Access_t;
    R     : Rect_Access_t;
    Color : Uint32_t)
    return  Boolean renames FillRect;
  pragma Inline (FillRect);

  -- Swaps screen buffers
  function Flip (Surface : Surface_Access_t) return C.int;
  procedure Flip (Surface : Surface_Access_t);
  pragma Import (C, Flip, "SDL_Flip");

  function Flip (Surface : Surface_Access_t) return Boolean;
  pragma Inline (Flip);

  -- Frees (deletes) a SDL_Surface
  procedure FreeSurface (Surface : Surface_Access_t);
  procedure Free_Surface (Surface : Surface_Access_t) renames FreeSurface;
  pragma Import (C, FreeSurface, "SDL_FreeSurface");

  -- Gets the clipping rectangle for a surface.
  procedure GetClipRect (Surface : Surface_Access_t; Rect_t : Rect_Access_t);

  procedure Get_Clip_Rect (Surface : Surface_Access_t; Rect_t : Rect_Access_t) renames GetClipRect;
  pragma Import (C, GetClipRect, "SDL_GetClipRect");

  -- Gets the color gamma loOKup tables for the display
  function GetGammaRamp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  C.int;

  function Get_Gamma_Ramp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  C.int renames GetGammaRamp;
  pragma Import (C, GetGammaRamp, "SDL_GetGammaRamp");

  function GetGammaRamp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  Boolean;

  function Get_Gamma_Ramp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  Boolean renames GetGammaRamp;
  pragma Inline (GetGammaRamp);

  -- Gets RGB values from a pixel in the specified pixel format.
  procedure GetRGB
   (Pixel : Uint32_t;
    Fmt   : Pixel_Format_Access_t;
    R     : Uint8_Ptr_t;
    G     : Uint8_Ptr_t;
    B     : Uint8_Ptr_t);

  procedure Get_RGB
   (Pixel : Uint32_t;
    Fmt   : Pixel_Format_Access_t;
    R     : Uint8_Ptr_t;
    G     : Uint8_Ptr_t;
    B     : Uint8_Ptr_t) renames GetRGB;
  pragma Import (C, GetRGB, "SDL_GetRGB");

  -- Gets RGBA values from a pixel in the specified pixel format.
  procedure GetRGBA
   (Pixel : Uint32_t;
    Fmt   : Pixel_Format_Access_t;
    R     : Uint8_Ptr_t;
    G     : Uint8_Ptr_t;
    B     : Uint8_Ptr_t;
    A     : Uint8_Ptr_t);

  procedure Get_RGBA
   (Pixel : Uint32_t;
    Fmt   : Pixel_Format_Access_t;
    R     : Uint8_Ptr_t;
    G     : Uint8_Ptr_t;
    B     : Uint8_Ptr_t;
    A     : Uint8_Ptr_t) renames GetRGBA;
  pragma Import (C, GetRGBA, "SDL_GetRGBA");

  -- return s a pointer to information about the video hardware
  function GetVideoInfo return Video_Info_Access_t;
  function Get_Video_Info return Video_Info_Access_t renames GetVideoInfo;
  pragma Import (C, GetVideoInfo, "SDL_GetVideoInfo");

  -- return s a pointer to the current display surface
  function GetVideoSurface return Surface_Access_t;
  function Get_Video_Surface return Surface_Access_t renames GetVideoSurface;
  pragma Import (C, GetVideoSurface, "SDL_GetVideoSurface");

  -- return s a pointer to an array of available screen dimensions for the given
  -- format and video flags.
  function ListModes (Fmt : access Pixel_Format_t; Flags : Uint32_t) return access Rect_Access_t;
  function List_Modes (Fmt : access Pixel_Format_t; Flags : Uint32_t) return access Rect_Access_t renames ListModes;
  pragma Import (C, ListModes, "SDL_ListModes");

  -- Locks a surface for direct access.
  function LockSurface (Surface : Surface_Access_t) return C.int;
  function Lock_Surface (Surface : Surface_Access_t) return C.int renames LockSurface;
  pragma Import (C, LockSurface, "SDL_LockSurface");

  function LockSurface (Surface : Surface_Access_t) return Boolean;
  function Lock_Surface (Surface : Surface_Access_t) return Boolean renames LockSurface;
  pragma Inline (LockSurface);

  -- Maps a RGB color value to a pixel format.
  function MapRGB
   (Fmt  : Pixel_Format_Access_t;
    R    : Uint8_t;
    G    : Uint8_t;
    B    : Uint8_t)
    return Uint32_t;

  function Map_Rgb
   (Fmt  : Pixel_Format_Access_t;
    R    : Uint8_t;
    G    : Uint8_t;
    B    : Uint8_t)
    return Uint32_t renames MapRGB;
  pragma Import (C, MapRGB, "SDL_MapRGB");

  -- Maps a RGBA color value to a pixel format.
  function MapRGBA
   (Fmt  : Pixel_Format_Access_t;
    R    : Uint8_t;
    G    : Uint8_t;
    B    : Uint8_t;
    A    : Uint8_t)
    return Uint32_t;
  function Map_RGBA
   (Fmt  : Pixel_Format_Access_t;
    R    : Uint8_t;
    G    : Uint8_t;
    B    : Uint8_t;
    A    : Uint8_t)
    return Uint32_t renames MapRGBA;
  pragma Import (C, MapRGBA, "SDL_MapRGBA");

  -- Adjusts the alpha properties of a surface.
  function SetAlpha
   (Surface  : Surface_Access_t;
    Flags : Uint32_t;
    Alpha : Uint8_t)
    return  C.int;

  function Set_Alpha
   (Surface  : Surface_Access_t;
    Flags : Uint32_t;
    Alpha : Uint8_t)
    return  C.int renames SetAlpha;
  pragma Import (C, SetAlpha, "SDL_SetAlpha");

  function SetAlpha
   (Surface  : Surface_Access_t;
    Flags : Uint32_t;
    Alpha : Uint8_t)
    return  Boolean;

  function Set_Alpha
   (Surface  : Surface_Access_t;
    Flags : Uint32_t;
    Alpha : Uint8_t)
    return  Boolean renames SetAlpha;
  pragma Inline (SetAlpha);

  -- Sets the clipping rectangle for a surface.
  procedure SetClipRect (Surface : Surface_Access_t; R : access Rect_t);

  procedure Set_Clip_Rect (Surface : Surface_Access_t; R : access Rect_t) renames SetClipRect;
  pragma Import (C, SetClipRect, "SDL_SetClipRect");

  -- Sets the color key (transparent pixel) in a blittable surface
  -- and RLE acceleration.
  function SetColorKey
   (Surface : Surface_Access_t;
    Flag : Uint32_t;
    Key  : Uint32_t)
    return C.int;

  function Set_Color_Key
   (Surface : Surface_Access_t;
    Flag : Uint32_t;
    Key  : Uint32_t)
    return C.int renames SetColorKey;
  pragma Import (C, SetColorKey, "SDL_SetColorKey");

  function SetColorKey
   (Surface : Surface_Access_t;
    Flag : Uint32_t;
    Key  : Uint32_t)
    return Boolean;

  function Set_Color_Key
   (Surface : Surface_Access_t;
    Flag : Uint32_t;
    Key  : Uint32_t)
    return Boolean renames SetColorKey;
  pragma Inline (SetColorKey);

  -- Sets a portion of the colormap for the given 8-bit surface.
  function SetColors
   (Surface    : Surface_Access_t;
    Colors  : Color_Access_t;
    Color1  : C.int;
    Ncolors : C.int)
    return    C.int;

  function Set_Colors
   (Surface    : Surface_Access_t;
    Colors  : Color_Access_t;
    Color1  : C.int;
    Ncolors : C.int)
    return    C.int renames SetColors;
  pragma Import (C, SetColors, "SDL_SetColors");

  function SetColors
   (Surface        : Surface_Access_t;
    Colors      : Color_Array_t;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean;

  function Set_Colors
   (Surface        : Surface_Access_t;
    Colors      : Color_Array_t;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean renames SetColors;
  pragma Inline (SetColors);

  -- Sets the color gamma function for the display
  function SetGamma
   (Red   : C.C_float;
    Green : C.C_float;
    Blue  : C.C_float)
    return  C.int;

  function Set_Gamma
   (Red   : C.C_float;
    Green : C.C_float;
    Blue  : C.C_float)
    return  C.int renames SetGamma;
  pragma Import (C, SetGamma, "SDL_SetGamma");

  function SetGamma
   (Red   : Float;
    Green : Float;
    Blue  : Float)
    return  Boolean;

  function Set_Gamma
   (Red   : Float;
    Green : Float;
    Blue  : Float)
    return  Boolean renames SetGamma;
  pragma Inline (SetGamma);

  -- Sets the color gamma loOKup tables for the display.
  function SetGammaRamp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  C.int;

  function Set_Gamma_Ramp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  C.int renames SetGammaRamp;
  pragma Import (C, SetGammaRamp, "SDL_SetGammaRamp");

  function SetGammaRamp
   (Red   : Gamma_Table_t;
    Green : Gamma_Table_t;
    Blue  : Gamma_Table_t)
    return  Boolean;

  function Set_Gamma_Ramp
   (Red   : Gamma_Table_t;
    Green : Gamma_Table_t;
    Blue  : Gamma_Table_t)
    return  Boolean renames SetGammaRamp;
  pragma Inline (SetGammaRamp);

  -- Sets the colors in the palette of an 8-bit surface.
  function SetPalette
   (Surface    : Surface_Access_t;
    Flags   : C.int;
    Colors  : Color_Access_t;
    Color1  : C.int;
    Ncolors : C.int)
    return    C.int;

  function Set_Palette
   (Surface    : Surface_Access_t;
    Flags   : C.int;
    Colors  : Color_Access_t;
    Color1  : C.int;
    Ncolors : C.int)
    return    C.int renames SetPalette;
  pragma Import (C, SetPalette, "SDL_SetPalette");

  function SetPalette
   (Surface        : Surface_Access_t;
    Flags       : C.int;
    Colors      : Color_Array_t;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean;

  function Set_Palette
   (Surface        : Surface_Access_t;
    Flags       : C.int;
    Colors      : Color_Array_t;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean renames SetPalette;
  pragma Inline (SetPalette);

  -- Sets up a video mode with the specified width, height and bits-per-pixel.
  function SetVideoMode
   (Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Flags  : Surface_Flags_t)
    return   Surface_Access_t;

  function Set_Video_Mode
   (Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Flags  : Surface_Flags_t)
    return   Surface_Access_t renames SetVideoMode;
  pragma Import (C, SetVideoMode, "SDL_SetVideoMode");

  function SetVideoMode
   (Width  : Positive;
    Height : Positive;
    Bpp    : Natural;
    Flags  : Surface_Flags_t)
    return   Surface_Access_t;

  function Set_Video_Mode
   (Width  : Positive;
    Height : Positive;
    Bpp    : Natural;
    Flags  : Surface_Flags_t)
    return   Surface_Access_t renames SetVideoMode;

  -- Unlocks a previously locked surface.
  procedure UnlockSurface (Surface : Surface_Access_t);
  procedure Unlock_Surface (Surface : Surface_Access_t) renames UnlockSurface;
  pragma Import (C, UnlockSurface, "SDL_UnlockSurface");

  -- Makes sure the given area is updated on the given screen.
  procedure UpdateRect
   (Surface : Surface_Access_t;
    X    : Int32_t;
    Y    : Int32_t;
    W    : Int32_t;
    H    : Int32_t);

  procedure Update_Rect
   (Surface : Surface_Access_t;
    X    : Int32_t;
    Y    : Int32_t;
    W    : Int32_t;
    H    : Int32_t) renames UpdateRect;
  pragma Import (C, UpdateRect, "SDL_UpdateRect");

  -- Makes sure the given list of rectangles is updated on the given screen.
  procedure UpdateRects (Surface : Surface_Access_t; Rects : Rect_Array_t);

  procedure Update_Rects (Surface : Surface_Access_t; Rects : Rect_Array_t) renames UpdateRects;
  pragma Inline (UpdateRects);

  -- Checks to see if a particular video mode is supported.
  function VideoModeOK
   (Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Flags  : Uint32_t)
    return   C.int;

  function Video_Mode_OK
   (Width  : C.int;
    Height : C.int;
    Bpp    : C.int;
    Flags  : Uint32_t)
    return   C.int renames VideoModeOK;
  pragma Import (C, VideoModeOK, "SDL_VideoModeOK");

  function VideoModeOK
   (Width  : Natural;
    Height : Natural;
    Bpp    : Natural;
    Flags  : Surface_Flags_t)
    return   Boolean;

  function Video_Mode_OK
   (Width  : Natural;
    Height : Natural;
    Bpp    : Natural;
    Flags  : Surface_Flags_t)
    return   Boolean renames VideoModeOK;
  pragma Inline (VideoModeOK);

  -- Evaluates to true if the surface needs to be locked before access
  function MustLock (Surface : Surface_Access_t) return Boolean;
  pragma Inline (MustLock);

end SDL.Video;
