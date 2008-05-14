package SDL.timer is

  -- Callback function for AddTimer
  type add_timer_callback is
    access function (interval: uint32; param: void_ptr) return uint32;
  pragma convention (c, add_timer_callback);
  type set_timer_callback is
    access function (interval: uint32) return uint32;
  pragma convention (c, set_timer_callback);

  -- Timer ID
  type id is new void_ptr;
  pragma convention (c, id);

  -- Gets the number of milliseconds since SDL library initialization.
  function GetTicks return uint32;
  function get_ticks return uint32;
  pragma import (c, GetTicks, "SDL_GetTicks");
  pragma import (c, get_ticks, "SDL_GetTicks");

  -- NOTE: SDL_Delay is not bound as Ada already has a delay statement.

  -- Add a timer which will call a callback after the specified number
  -- of milliseconds has elapsed.
  function AddTimer (interval: uint32; func: add_timer_callback;
    param: void_ptr) return id;
  function add_timer (interval: uint32; func: add_timer_callback;
    param: void_ptr) return id;
  pragma import (c, AddTimer, "SDL_AddTimer");
  pragma import (c, add_timer, "SDL_AddTimer");

  -- Remove a timer which was added with SDL_AddTimer.
  function RemoveTimer (timer: id) return boolean;
  function remove_timer (timer: id) return boolean;
  pragma import (c, RemoveTimer, "SDL_RemoveTimer");
  pragma import (c, remove_timer, "SDL_RemoveTimer");

  -- Set a callback to run after the specified number of milliseconds has elapsed.
  function SetTimer (interval: uint32; func: set_timer_callback) return c.int;
  function set_timer (interval: uint32; func: set_timer_callback) return c.int;
  pragma import (c, SetTimer, "SDL_SetTimer");
  pragma import (c, set_timer, "SDL_SetTimer");

end SDL.timer;
