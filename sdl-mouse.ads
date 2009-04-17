with SDL.Video;
with Interfaces;

package SDL.Mouse is
  package I renames Interfaces;

  type Button_t is new Uint8_t;
  pragma Convention (C, Button_t);
  type Button_Mask_t is new Uint8_t;
  pragma Convention (C, Button_Mask_t);
  type Mouse_Button_State_t is new Uint8_t;
  pragma Convention (C, Mouse_Button_State_t);
  type Cursor_Area_Save_t is array (0 .. 1) of Uint8_Ptr_t;
  pragma Convention (C, Cursor_Area_Save_t);

  Button_Left       : constant Button_t := 1;
  Button_Middle     : constant Button_t := 2;
  Button_Right      : constant Button_t := 3;
  Button_Wheel_Up   : constant Button_t := 4;
  Button_Wheel_Down : constant Button_t := 5;
  Button_X1         : constant Button_t := 6;
  Button_X2         : constant Button_t := 7;

  Button_L_Mask  : constant Button_Mask_t := Button_Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Button_Left)));
  Button_M_Mask  : constant Button_Mask_t := Button_Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Button_Middle)));
  Button_R_Mask  : constant Button_Mask_t := Button_Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Button_Right)));
  Button_X1_Mask : constant Button_Mask_t := Button_Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Button_X1)));
  Button_X2_Mask : constant Button_Mask_t := Button_Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Button_X2)));

  type Cursor_t is record
    Area      : Video.Rect_t;
    Hot_X     : Int16_t;
    Hot_Y     : Int16_t;
    Data      : Uint8_Ptr_t;
    Mask      : Uint8_Ptr_t;
    Save      : Cursor_Area_Save_t;
    Wm_Cursor : Void_Ptr_t;
  end record;
  type Cursor_Access_t is access all Cursor_t;
  pragma Convention (C, Cursor_t);
  pragma Convention (C, Cursor_Access_t);

  -- Set the position of the mouse cursor_t.
  procedure WarpMouse (X, Y : Uint16_t);
  procedure Warp_Mouse (X, Y : Uint16_t) renames WarpMouse;
  pragma Import (C, WarpMouse, "SDL_WarpMouse");

  -- Creates a new mouse cursor_t.
  function CreateCursor
   (Data   : Uint8_Ptr_t;
    Mask   : Uint8_Ptr_t;
    Width  : C.int;
    Height : C.int;
    Hot_X  : C.int;
    Hot_Y  : C.int)
    return   Cursor_Access_t;

  function Create_Cursor
   (Data   : Uint8_Ptr_t;
    Mask   : Uint8_Ptr_t;
    Width  : C.int;
    Height : C.int;
    Hot_X  : C.int;
    Hot_Y  : C.int)
    return   Cursor_Access_t renames CreateCursor;
  pragma Import (C, CreateCursor, "SDL_CreateCursor");

  -- Frees a cursor_t created with SDL_CreateCursor
  procedure FreeCursor (C : Cursor_Access_t);
  procedure Free_Cursor (C : Cursor_Access_t) renames FreeCursor;
  pragma Import (C, FreeCursor, "SDL_FreeCursor");

  -- Set the currently active mouse cursor_t.
  procedure SetCursor (C : Cursor_Access_t);
  procedure Set_Cursor (C : Cursor_Access_t) renames SetCursor;
  pragma Import (C, SetCursor, "SDL_SetCursor");

  -- Get the currently active mouse cursor_t.
  function GetCursor return Cursor_Access_t;
  function Get_Cursor return Cursor_Access_t renames GetCursor;
  pragma Import (C, GetCursor, "SDL_GetCursor");

  -- Toggle whether or not the cursor_t is shown on the screen.
  function ShowCursor (Toggle : C.int) return C.int;
  function Show_Cursor (Toggle : C.int) return C.int renames ShowCursor;
  pragma Import (C, ShowCursor, "SDL_ShowCursor");

end SDL.Mouse;
