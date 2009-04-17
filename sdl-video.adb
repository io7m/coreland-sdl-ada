package body SDL.Video is
  use type C.int;

  function BlitSurface
   (Src      : Surface_Access_T;
    Src_Rect : Rect_Access_T;
    Dst      : Surface_Access_T;
    Dst_Rect : Rect_Access_T)
    return     Boolean
  is
    Return_Code : constant C.int := BlitSurface (Src, Src_Rect, Dst, Dst_Rect);
  begin
    return Return_Code /= -1;
  end BlitSurface;

  function BlitSurface
   (Src      : Surface_Access_T;
    Src_Rect : Rect_T;
    Dst      : Surface_Access_T;
    Dst_Rect : Rect_Access_T)
    return     Boolean
  is
    Return_Code : constant C.int := BlitSurface (Src, Src_Rect, Dst, Dst_Rect);
  begin
    return Return_Code /= -1;
  end BlitSurface;

  function CreateRGBSurfaceFrom
   (Pixels : Void_Ptr_T;
    Width  : Natural;
    Height : Natural;
    Bpp    : Positive;
    Pitch  : Positive;
    Rmask  : Uint32_T;
    Gmask  : Uint32_T;
    Bmask  : Uint32_T;
    Amask  : Uint32_T)
    return   Surface_Access_T is
  begin
    return CreateRGBSurfaceFrom
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
   (Dst   : Surface_Access_T;
    R     : Rect_Access_T;
    Color : Uint32_T)
    return  Boolean
  is
    Return_Code : constant C.int := FillRect (Dst, R, Color);
  begin
    return Return_Code /= -1;
  end FillRect;

  function Flip (Surface : Surface_Access_T) return Boolean is
    Return_Code : constant C.int := Flip (Surface);
  begin
    return Return_Code /= -1;
  end Flip;

  function GetGammaRamp
   (Red   : Uint16_Ptr_T;
    Green : Uint16_Ptr_T;
    Blue  : Uint16_Ptr_T)
    return  Boolean
  is
    Return_Code : constant C.int := GetGammaRamp (Red, Green, Blue);
  begin
    return Return_Code /= -1;
  end GetGammaRamp;

  function LockSurface (Surface : Surface_Access_T) return Boolean is
    Return_Code : constant C.int := LockSurface (Surface);
  begin
    return Return_Code /= -1;
  end LockSurface;

  function SetAlpha
   (Surface  : Surface_Access_T;
    Flags : Uint32_T;
    Alpha : Uint8_T)
    return  Boolean
  is
    Return_Code : constant C.int := SetAlpha (Surface, Flags, Alpha);
  begin
    return Return_Code /= -1;
  end SetAlpha;

  function SetColorKey
   (Surface : Surface_Access_T;
    Flag : Uint32_T;
    Key  : Uint32_T)
    return Boolean
  is
    Return_Code : constant C.int := SetColorKey (Surface, Flag, Key);
  begin
    return Return_Code /= -1;
  end SetColorKey;

  function SDL_SetColors
   (Surface        : Surface_Access_T;
    Colors      : Color_Array_T;
    First_Color : C.int;
    Num_Colors  : C.int)
    return        C.int;
  pragma Import (C, SDL_SetColors, "SDL_SetColors");

  function SetColors
   (Surface        : Surface_Access_T;
    Colors      : Color_Array_T;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean
  is
    Return_Code : constant C.int :=
      SDL_SetColors (Surface => Surface, Colors => Colors, First_Color => C.int (First_Color), Num_Colors => C.int (Num_Colors));
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
   (Red   : Gamma_Table_T;
    Green : Gamma_Table_T;
    Blue  : Gamma_Table_T)
    return  C.int;
  pragma Import (C, SDL_SetGammaRamp, "SDL_SetGammaRamp");

  function SetGammaRamp
   (Red   : Gamma_Table_T;
    Green : Gamma_Table_T;
    Blue  : Gamma_Table_T)
    return  Boolean
  is
    Return_Code : constant C.int := SDL_SetGammaRamp (Red, Green, Blue);
  begin
    return Return_Code /= -1;
  end SetGammaRamp;

  function SDL_SetPalette
   (Surface        : Surface_Access_T;
    Flags       : C.int;
    Colors      : Color_Array_T;
    First_Color : C.int;
    Num_Colors  : C.int)
    return        C.int;
  pragma Import (C, SDL_SetPalette, "SDL_SetPalette");

  function SetPalette
   (Surface        : Surface_Access_T;
    Flags       : C.int;
    Colors      : Color_Array_T;
    First_Color : Natural;
    Num_Colors  : Natural)
    return        Boolean
  is
    Return_Code : constant C.int :=
      SDL_SetPalette
       (Surface        => Surface,
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
    Flags  : Surface_Flags_T)
    return   Surface_Access_T
  is
  begin
    return SetVideoMode (Width => C.int (Width), Height => C.int (Height), Bpp => C.int (Bpp), Flags => Flags);
  end SetVideoMode;

  procedure SDL_UpdateRects (Surface : Surface_Access_T; Num : C.int; Rects : Rect_Array_T);
  pragma Import (C, SDL_UpdateRects, "SDL_UpdateRects");

  procedure UpdateRects (Surface : Surface_Access_T; Rects : Rect_Array_T) is
  begin
    SDL_UpdateRects (Surface, C.int (Rects'Length), Rects);
  end UpdateRects;

  function VideoModeOK
   (Width  : Natural;
    Height : Natural;
    Bpp    : Natural;
    Flags  : Surface_Flags_T)
    return   Boolean
  is
    Return_Code : constant C.int :=
      VideoModeOK (Width => C.int (Width), Height => C.int (Height), Bpp => C.int (Bpp), Flags => Uint32_T (Flags));
  begin
    return Return_Code /= 0;
  end VideoModeOK;

  function MustLock (Surface : Surface_Access_T) return Boolean is
    Check_Flags : constant Surface_Flags_T := Hwsurface or Asyncblit or Rleaccel;
  begin
    if (Surface.all.Offset /= 0) or ((Surface.all.Flags and Check_Flags) /= 0) then
      return True;
    else
      return False;
    end if;
  end MustLock;

end SDL.Video;
