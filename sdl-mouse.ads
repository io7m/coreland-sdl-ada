with sdl.video;
with interfaces;

package sdl.mouse is
  package vid renames sdl.video;
  package i renames interfaces;

  type button_t is new uint8_t;
  pragma convention (c, button_t);
  type button_mask_t is new uint8_t;
  pragma convention (c, button_mask_t);
  type mouse_button_state_t is new uint8_t;
  pragma convention (c, mouse_button_state_t);
  type cursor_area_save_t is array (0 .. 1) of uint8_ptr_t;
  pragma convention (c, cursor_area_save_t);

  button_left       : constant button_t := 1;
  button_middle     : constant button_t := 2;
  button_right      : constant button_t := 3;
  button_wheel_up   : constant button_t := 4;
  button_wheel_down : constant button_t := 5;
  button_x1         : constant button_t := 6;
  button_x2         : constant button_t := 7;

  button_l_mask  : constant button_mask_t := button_mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (button_left)));
  button_m_mask  : constant button_mask_t := button_mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (button_middle)));
  button_r_mask  : constant button_mask_t := button_mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (button_right)));
  button_x1_mask : constant button_mask_t := button_mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (button_x1)));
  button_x2_mask : constant button_mask_t := button_mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (button_x2)));

  type cursor_t is record
    area      : vid.rect_t;
    hot_x     : int16_t;
    hot_y     : int16_t;
    data      : uint8_ptr_t;
    mask      : uint8_ptr_t;
    save      : cursor_area_save_t;
    wm_cursor : void_ptr_t;
  end record;
  type cursor_access_t is access all cursor_t;
  pragma convention (c, cursor_t);
  pragma convention (c, cursor_access_t);

  -- Set the position of the mouse cursor_t.
  procedure warpmouse (x, y : uint16_t);
  procedure warp_mouse (x, y : uint16_t) renames warpmouse;
  pragma import (c, warpmouse, "SDL_WarpMouse");

  -- Creates a new mouse cursor_t.
  function createcursor
   (data   : uint8_ptr_t;
    mask   : uint8_ptr_t;
    width  : c.int;
    height : c.int;
    hot_x  : c.int;
    hot_y  : c.int) return cursor_access_t;

  function create_cursor
   (data   : uint8_ptr_t;
    mask   : uint8_ptr_t;
    width  : c.int;
    height : c.int;
    hot_x  : c.int;
    hot_y  : c.int) return cursor_access_t renames createcursor;
  pragma import (c, createcursor, "SDL_CreateCursor");

  -- Frees a cursor_t created with SDL_CreateCursor
  procedure freecursor (c : cursor_access_t);
  procedure free_cursor (c : cursor_access_t) renames freecursor;
  pragma import (c, freecursor, "SDL_FreeCursor");

  -- Set the currently active mouse cursor_t.
  procedure setcursor (c : cursor_access_t);
  procedure set_cursor (c : cursor_access_t) renames setcursor;
  pragma import (c, setcursor, "SDL_SetCursor");

  -- Get the currently active mouse cursor_t.
  function getcursor return cursor_access_t;
  function get_cursor return cursor_access_t renames getcursor;
  pragma import (c, getcursor, "SDL_GetCursor");

  -- Toggle whether or not the cursor_t is shown on the screen.
  function showcursor (toggle : c.int) return c.int;
  function show_cursor (toggle : c.int) return c.int renames showcursor;
  pragma import (c, showcursor, "SDL_ShowCursor");

end sdl.mouse;
