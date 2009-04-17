package SDL.Timer is

  -- Callback function for AddTimer
  type Add_Timer_Callback_t is access function (Interval : Uint32_t; Param : Void_Ptr_t) return Uint32_t;
  pragma Convention (C, Add_Timer_Callback_t);

  type Set_Timer_Callback_t is access function (Interval : Uint32_t) return Uint32_t;
  pragma Convention (C, Set_Timer_Callback_t);

  -- Timer ID
  type ID_t is new Void_Ptr_t;
  pragma Convention (C, ID_t);

  -- Gets the number of milliseconds since SDL library initialization.
  function GetTicks return Uint32_t;
  function Get_Ticks return Uint32_t renames GetTicks;
  pragma Import (C, GetTicks, "SDL_GetTicks");

  -- NOTE : SDL_Delay is not bound as Ada already has a delay statement.

-- Add a timer which will call a callback after the specified number
  -- of milliseconds has elapsed.
  function AddTimer
   (Interval : Uint32_t;
    Callback : Add_Timer_Callback_t;
    Param    : Void_Ptr_t)
    return     ID_t;
  function Add_Timer
   (Interval : Uint32_t;
    Callback : Add_Timer_Callback_t;
    Param    : Void_Ptr_t)
    return     ID_t renames AddTimer;
  pragma Import (C, AddTimer, "SDL_AddTimer");

  -- Remove a timer which was added with SDL_AddTimer.
  function RemoveTimer (Timer : ID_t) return C.unsigned;
  function Remove_Timer (Timer : ID_t) return C.unsigned renames RemoveTimer;
  pragma Import (C, RemoveTimer, "SDL_RemoveTimer");

  -- Set a callback to run after the specified number of milliseconds has elapsed.
  function SetTimer (Interval : Uint32_t; Callback : Set_Timer_Callback_t) return C.int;
  function Set_Timer (Interval : Uint32_t; Callback : Set_Timer_Callback_t) return C.int renames SetTimer;
  pragma Import (C, SetTimer, "SDL_SetTimer");

end SDL.Timer;
