package sdl.timer is

  -- Callback function for AddTimer
  type add_timer_callback_t is access function
   (interval : uint32_t;
    param    : void_ptr_t) return uint32_t;
  pragma convention (c, add_timer_callback_t);

  type set_timer_callback_t is access function
   (interval : uint32_t) return uint32_t;
  pragma convention (c, set_timer_callback_t);

  -- Timer ID
  type id_t is new void_ptr_t;
  pragma convention (c, id_t);

  -- Gets the number of milliseconds since SDL library initialization.
  function getticks return uint32_t;
  function get_ticks return uint32_t renames getticks;
  pragma import (c, getticks, "SDL_GetTicks");

  -- NOTE : SDL_Delay is not bound as Ada already has a delay statement.

  -- Add a timer which will call a callback after the specified number
  -- of milliseconds has elapsed.
  function addtimer
   (interval : uint32_t;
    callback : add_timer_callback_t;
    param    : void_ptr_t) return id_t;
  function add_timer
   (interval : uint32_t;
    callback : add_timer_callback_t;
    param    : void_ptr_t) return id_t renames addtimer;
  pragma import (c, addtimer, "SDL_AddTimer");

  -- Remove a timer which was added with SDL_AddTimer.
  function removetimer (timer : id_t) return c.unsigned;
  function remove_timer (timer : id_t) return c.unsigned renames removetimer;
  pragma import (c, removetimer, "SDL_RemoveTimer");

  -- Set a callback to run after the specified number of milliseconds has elapsed.
  function settimer
   (interval : uint32_t;
    callback : set_timer_callback_t) return c.int;
  function set_timer
   (interval : uint32_t;
    callback : set_timer_callback_t) return c.int renames settimer;
  pragma import (c, settimer, "SDL_SetTimer");

end sdl.timer;
