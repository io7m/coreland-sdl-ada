with SDL.video;
with interfaces;

package SDL.mouse is
  package vid renames SDL.video;
  package i renames interfaces;

  type button is new uint8;
  pragma convention (c, button);
  type button_mask is new uint8;
  pragma convention (c, button_mask);
  type mouse_button_state is new uint8;
  pragma convention (c, mouse_button_state);
  type cursor_area_save is array (0 .. 1) of uint8_ptr;
  pragma convention (c, cursor_area_save);

  button_left: constant button := 1;
  button_middle: constant button := 2;
  button_right: constant button := 3;
  button_wheel_up: constant button := 4;
  button_wheel_down: constant button := 5;
  button_x1: constant button := 6;
  button_x2: constant button := 7;

  button_l_mask: constant button_mask := 
    button_mask (i.shift_left (i.unsigned_32 (1), integer (button_left)));
  button_m_mask: constant button_mask := 
    button_mask (i.shift_left (i.unsigned_32 (1), integer (button_middle)));
  button_r_mask: constant button_mask := 
    button_mask (i.shift_left (i.unsigned_32 (1), integer (button_right)));
  button_x1_mask: constant button_mask := 
    button_mask (i.shift_left (i.unsigned_32 (1), integer (button_x1)));
  button_x2_mask: constant button_mask := 
    button_mask (i.shift_left (i.unsigned_32 (1), integer (button_x2)));

  type Cursor is record
    area: vid.rect;
    hot_x: int16;
    hot_y: int16;
    data: uint8_ptr;
    mask: uint8_ptr;
    save: cursor_area_save;
    wm_cursor: void_ptr;
  end record;
  type Cursor_ptr is access all Cursor;
  pragma convention (c, Cursor);
  pragma convention (c, Cursor_ptr);

  -- Set the position of the mouse cursor.
  procedure WarpMouse (x, y: uint16);
  procedure warp_mouse (x, y: uint16);
  pragma import (c, WarpMouse, "SDL_WarpMouse");
  pragma import (c, warp_mouse, "SDL_WarpMouse");

  -- Creates a new mouse cursor.
  function CreateCursor (data, mask: uint8_ptr; w, h, hot_x, hot_y: c.int)
    return Cursor_ptr;
  function create_cursor (data, mask: uint8_ptr; w, h, hot_x, hot_y: c.int)
    return Cursor_ptr;
  pragma import (c, CreateCursor, "SDL_CreateCursor");
  pragma import (c, create_cursor, "SDL_CreateCursor");

  -- Frees a cursor created with SDL_CreateCursor
  procedure FreeCursor (c: Cursor_ptr);
  procedure free_cursor (c: Cursor_ptr);
  pragma import (c, FreeCursor, "SDL_FreeCursor");
  pragma import (c, free_cursor, "SDL_FreeCursor");

  -- Set the currently active mouse cursor.
  procedure SetCursor (c: Cursor_ptr);
  procedure set_cursor (c: Cursor_ptr);
  pragma import (c, SetCursor, "SDL_SetCursor");
  pragma import (c, Set_cursor, "SDL_SetCursor");

  -- Get the currently active mouse cursor.
  function GetCursor return Cursor_ptr;
  function get_cursor return Cursor_ptr;
  pragma import (c, GetCursor, "SDL_GetCursor");
  pragma import (c, get_cursor, "SDL_GetCursor");

  -- Toggle whether or not the cursor is shown on the screen.
  function ShowCursor (toggle: c.int) return c.int;
  function show_cursor (toggle: c.int) return c.int;
  pragma import (c, ShowCursor, "SDL_ShowCursor");
  pragma import (c, show_cursor, "SDL_ShowCursor");

end SDL.mouse;
