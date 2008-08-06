with SDL.video;
with interfaces;

package SDL.mouse is
  package vid renames SDL.video;
  package i renames interfaces;

  type button_t is new uint8;
  pragma convention (c, button_t);
  type button_mask_t is new uint8;
  pragma convention (c, button_mask_t);
  type mouse_button_state_t is new uint8;
  pragma convention (c, mouse_button_state_t);
  type cursor_area_save_t is array (0 .. 1) of uint8_ptr;
  pragma convention (c, cursor_area_save_t);

  button_left       : constant button_t := 1;
  button_middle     : constant button_t := 2;
  button_right      : constant button_t := 3;
  button_wheel_up   : constant button_t := 4;
  button_wheel_down : constant button_t := 5;
  button_x1         : constant button_t := 6;
  button_x2         : constant button_t := 7;

  button_l_mask : constant button_mask_t := 
    button_mask_t (i.shift_left (i.unsigned_32 (1), integer (button_left)));
  button_m_mask : constant button_mask_t := 
    button_mask_t (i.shift_left (i.unsigned_32 (1), integer (button_middle)));
  button_r_mask : constant button_mask_t := 
    button_mask_t (i.shift_left (i.unsigned_32 (1), integer (button_right)));
  button_x1_mask : constant button_mask_t := 
    button_mask_t (i.shift_left (i.unsigned_32 (1), integer (button_x1)));
  button_x2_mask : constant button_mask_t := 
    button_mask_t (i.shift_left (i.unsigned_32 (1), integer (button_x2)));

  type cursor_t is record
    area  : vid.rect_t;
    hot_x : int16;
    hot_y : int16;
    data  : uint8_ptr;
    mask  : uint8_ptr;
    save  : cursor_area_save_t;
    wm_cursor: void_ptr_t;
  end record;
  type cursor_ptr_t is access all cursor_t;
  pragma convention (c, cursor_t);
  pragma convention (c, cursor_ptr_t);

  -- Set the position of the mouse cursor_t.
  procedure WarpMouse (x, y: uint16);
  procedure warp_mouse (x, y: uint16) renames WarpMouse;
  pragma import (c, WarpMouse, "SDL_WarpMouse");

  -- Creates a new mouse cursor_t.
  function CreateCursor (data, mask: uint8_ptr; width, height, hot_x, hot_y: c.int)
    return cursor_ptr_t;
  function create_cursor (data, mask: uint8_ptr; width, height, hot_x, hot_y: c.int)
    return cursor_ptr_t renames CreateCursor;
  pragma import (c, CreateCursor, "SDL_CreateCursor");

  -- Frees a cursor_t created with SDL_CreateCursor
  procedure FreeCursor (c: cursor_ptr_t);
  procedure free_cursor (c: cursor_ptr_t) renames FreeCursor;
  pragma import (c, FreeCursor, "SDL_FreeCursor");

  -- Set the currently active mouse cursor_t.
  procedure SetCursor (c: cursor_ptr_t);
  procedure set_cursor (c: cursor_ptr_t) renames SetCursor;
  pragma import (c, SetCursor, "SDL_SetCursor");

  -- Get the currently active mouse cursor_t.
  function GetCursor return cursor_ptr_t;
  function get_cursor return cursor_ptr_t renames GetCursor;
  pragma import (c, GetCursor, "SDL_GetCursor");

  -- Toggle whether or not the cursor_t is shown on the screen.
  function ShowCursor (toggle: c.int) return c.int;
  function show_cursor (toggle: c.int) return c.int renames ShowCursor;
  pragma import (c, ShowCursor, "SDL_ShowCursor");

end SDL.mouse;
