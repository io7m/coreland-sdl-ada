package body SDL.Video is
  use type C.int;

  function BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_Access_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return        Boolean
  is
    Return_Code : constant C.int := BlitSurface (Source, Source_Rect, Target, Target_Rect);
  begin
    return Return_Code /= -1;
  end BlitSurface;

  function BlitSurface
   (Source      : Surface_Access_t;
    Source_Rect : Rect_t;
    Target      : Surface_Access_t;
    Target_Rect : Rect_Access_t)
    return        Boolean
  is
    Return_Code : constant C.int := BlitSurface (Source, Source_Rect, Target, Target_Rect);
  begin
    return Return_Code /= -1;
  end BlitSurface;

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
    return   Surface_Access_t
  is
  begin
    return CreateRGBSurfacefrom
            (Pixels => Pixels,
             Width  => C.int (Width),
             Height => C.int (Height),
             Bpp    => C.int (Bpp),
             Pitch  => C.int (Pitch),
             Rmask  => Rmask,
             Gmask  => Gmask,
             Bmask  => Bmask,
             Amask  => Amask);
  end CreateRGBSurfaceFrom;

  function FillRect
   (Target : Surface_Access_t;
    R      : Rect_Access_t;
    Color  : Uint32_t)
    return   Boolean
  is
    Return_Code : constant C.int := FillRect (Target, R, Color);
  begin
    return Return_Code /= -1;
  end FillRect;

  function Flip (Surface : Surface_Access_t) return Boolean is
    Return_Code : constant C.int := Flip (Surface);
  begin
    return Return_Code /= -1;
  end Flip;

  function GetGammaRamp
   (Red   : Uint16_Ptr_t;
    Green : Uint16_Ptr_t;
    Blue  : Uint16_Ptr_t)
    return  Boolean
  is
    Return_Code : constant C.int := GetGammaRamp (Red, Green, Blue);
  begin
    return Return_Code /= -1;
  end GetGammaRamp;

  function LockSurface (Surface : Surface_Access_t) return Boolean is
    Return_Code : constant C.int := LockSurface (Surface);
  begin
    return Return_Code /= -1;
  end LockSurface;

  function SetAlpha
   (Surface : Surface_Access_t;
    Flags   : Uint32_t;
    Alpha   : Uint8_t)
    return    Boolean
  is
    Return_Code : constant C.int := SetAlpha (Surface, Flags, Alpha);
  begin
    return Return_Code /= -1;
  end SetAlpha;

  function SetColorKey
   (Surface : Surface_Access_t;
    Flag    : Uint32_t;
    Key     : Uint32_t)
    return    Boolean
  is
    Return_Code : constant C.int := SetColorKey (Surface, Flag, Key);
  begin
    return Return_Code /= -1;
  end SetColorKey;

  function SDL_SetColors
   (Surface     : Surface_Access_t;
    Colors      : Color_Array_t;
    First_Color : C.int;
    Num_Colors  : C.int)
    return        C.int;
  pragma Import (C, SDL_SetColors, "SDL_SetColors");

  function SetColors
   (Surface     : Surface_Access_t;
    Colors      : Color_Array_t;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean
  is
    Return_Code : constant C.int :=
      SDL_SetColors
       (Surface     => Surface,
        Colors      => Colors,
        First_Color => C.int (First_Color),
        Num_Colors  => C.int (Num_Colors));
  begin
    return Return_Code /= 0;
  end SetColors;

  function SetGamma
   (Red   : Float;
    Green : Float;
    Blue  : Float)
    return  Boolean
  is
    Return_Code : constant C.int := SetGamma (Red => C.C_float (Red), Green => C.C_float (Green), Blue => C.C_float (Blue));
  begin
    return Return_Code /= -1;
  end SetGamma;

  function SDL_SetGammaRamp
   (Red   : Gamma_Table_t;
    Green : Gamma_Table_t;
    Blue  : Gamma_Table_t)
    return  C.int;
  pragma Import (C, SDL_SetGammaRamp, "SDL_SetGammaRamp");

  function SetGammaRamp
   (Red   : Gamma_Table_t;
    Green : Gamma_Table_t;
    Blue  : Gamma_Table_t)
    return  Boolean
  is
    Return_Code : constant C.int := SDL_SetGammaRamp (Red, Green, Blue);
  begin
    return Return_Code /= -1;
  end SetGammaRamp;

  function SDL_SetPalette
   (Surface     : Surface_Access_t;
    Flags       : C.int;
    Colors      : Color_Array_t;
    First_Color : C.int;
    Num_Colors  : C.int)
    return        C.int;
  pragma Import (C, SDL_SetPalette, "SDL_SetPalette");

  function SetPalette
   (Surface     : Surface_Access_t;
    Flags       : C.int;
    Colors      : Color_Array_t;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean
  is
    Return_Code : constant C.int :=
      SDL_SetPalette
       (Surface     => Surface,
        Flags       => Flags,
        Colors      => Colors,
        First_Color => C.int (First_Color),
        Num_Colors  => C.int (Num_Colors));
  begin
    return Return_Code /= 0;
  end SetPalette;

  function SetVideoMode
   (Width  : Positive;
    Height : Positive;
    Bpp    : Natural;
    Flags  : Surface_Flags_t)
    return   Surface_Access_t
  is
  begin
    return SetVideoMode (Width => C.int (Width), Height => C.int (Height), Bpp => C.int (Bpp), Flags => Flags);
  end SetVideoMode;

  procedure SDL_UpdateRects (Surface : Surface_Access_t; Num : C.int; Rects : Rect_Array_t);
  pragma Import (C, SDL_UpdateRects, "SDL_UpdateRects");

  procedure UpdateRects (Surface : Surface_Access_t; Rects : Rect_Array_t) is
  begin
    SDL_UpdateRects (Surface, C.int (Rects'Length), Rects);
  end UpdateRects;

  function VideoModeOK
   (Width  : Natural;
    Height : Natural;
    Bpp    : Natural;
    Flags  : Surface_Flags_t)
    return   Boolean
  is
    Return_Code : constant C.int :=
      VideoModeOK (Width => C.int (Width), Height => C.int (Height), Bpp => C.int (Bpp), Flags => Uint32_t (Flags));
  begin
    return Return_Code /= 0;
  end VideoModeOK;

  function MustLock (Surface : Surface_Access_t) return Boolean is
    Check_Flags : constant Surface_Flags_t := HWSURFACE or ASYNCBLIT or RLEACCEL;
  begin
    if (Surface.all.Offset /= 0) or ((Surface.all.Flags and Check_Flags) /= 0) then
      return True;
    else
      return False;
    end if;
  end MustLock;

end SDL.Video;
