package SDL.timer is

  -- Callback function for AddTimer
  type add_timer_callback_t is
    access function (interval : uint32; param : void_ptr_t) return uint32;
  pragma convention (c, add_timer_callback_t);
  type set_timer_callback_t is
    access function (interval : uint32) return uint32;
  pragma convention (c, set_timer_callback_t);

  -- Timer ID
  type id_t is new void_ptr_t;
  pragma convention (c, id_t);

  -- Gets the number of milliseconds since SDL library initialization.
  function GetTicks return uint32;
  function get_ticks return uint32 renames GetTicks;
  pragma import (c, GetTicks, "SDL_GetTicks");

  -- NOTE : SDL_Delay is not bound as Ada already has a delay statement.

  -- Add a timer which will call a callback after the specified number
  -- of milliseconds has elapsed.
  function AddTimer (interval : uint32; callback : add_timer_callback_t;
    param : void_ptr_t) return id_t;
  function add_timer (interval : uint32; callback : add_timer_callback_t;
    param : void_ptr_t) return id_t renames AddTimer;
  pragma import (c, AddTimer, "SDL_AddTimer");

  -- Remove a timer which was added with SDL_AddTimer.
  function RemoveTimer (timer : id_t) return boolean;
  function remove_timer (timer : id_t) return boolean renames RemoveTimer;
  pragma import (c, RemoveTimer, "SDL_RemoveTimer");

  -- Set a callback to run after the specified number of milliseconds has elapsed.
  function SetTimer (interval : uint32; callback : set_timer_callback_t) return c.int;
  function set_timer (interval : uint32; callback : set_timer_callback_t) return c.int renames SetTimer;
  pragma import (c, SetTimer, "SDL_SetTimer");

end SDL.timer;
