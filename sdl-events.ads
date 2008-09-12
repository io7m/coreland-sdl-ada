with sdl.mouse;
with sdl.keyboard;
with sdl.joystick;
with interfaces;

package sdl.events is
  package i renames interfaces;

  type type_t is new uint8_t;
  pragma convention (c, type_t);

  -- events
  noevent         : constant type_t := 0;
  isactiveevent   : constant type_t := 1;
  keydown         : constant type_t := 2;
  keyup           : constant type_t := 3;
  mousemotion     : constant type_t := 4;
  mousebuttondown : constant type_t := 5;
  mousebuttonup   : constant type_t := 6;
  joyaxismotion   : constant type_t := 7;
  joyballmotion   : constant type_t := 8;
  joyhatmotion    : constant type_t := 9;
  joybuttondown   : constant type_t := 10;
  joybuttonup     : constant type_t := 11;
  quit            : constant type_t := 12;
  issyswmevent    : constant type_t := 13;
  event_reserveda : constant type_t := 14;
  event_reservedb : constant type_t := 15;
  videoresize     : constant type_t := 16;
  event_reserved1 : constant type_t := 17;
  event_reserved2 : constant type_t := 18;
  event_reserved3 : constant type_t := 19;
  event_reserved4 : constant type_t := 20;
  event_reserved5 : constant type_t := 21;
  event_reserved6 : constant type_t := 22;
  event_reserved7 : constant type_t := 23;
  isuserevent     : constant type_t := 24;
  numevents       : constant type_t := 32;

  -- event masks
  type mask_t is new uint32_t;
  pragma convention (c, mask_t);

  activeeventmask     : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (isactiveevent)));
  keydownmask         : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (keydown)));
  keyupmask           : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (keyup)));
  mousemotionmask     : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (mousemotion)));
  mousebuttondownmask : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (mousebuttondown)));
  mousebuttonupmask   : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (mousebuttonup)));
  mouseeventmask      : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (mousemotion)))
    or mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (mousebuttondown)))
    or mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (mousebuttonup)));
  joyaxismotionmask   : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joyaxismotion)));
  joyballmotionmask   : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joyballmotion)));
  joyhatmotionmask    : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joyhatmotion)));
  joybuttondownmask   : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joybuttondown)));
  joybuttonupmask     : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joybuttonup)));
  joyeventmask        : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joyaxismotion)))
    or mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joyballmotion)))
    or mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joyhatmotion)))
    or mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joybuttondown)))
    or mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (joybuttonup)));
  videoresizemask     : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (videoresize)));
  quitmask            : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (quit)));
  syswmeventmask      : constant mask_t := mask_t (i.Shift_Left (i.Unsigned_32 (1), integer (issyswmevent)));
  allevents           : constant mask_t := 16#FFFFFFFF#;

  type active_state_t is new uint8_t;
  appmousefocus : constant active_state_t := 2#00000001#;
  appinputfocus : constant active_state_t := 2#00000010#;
  appactive     : constant active_state_t := 2#00000100#;

  -- Gets the state of the application
  function getappstate return active_state_t;
  function get_app_state return active_state_t renames getappstate;
  pragma import (c, getappstate, "SDL_GetAppState");

  -- ACTIVEEVENT
  type active_event_t is record
    ev_type : type_t;
    gain    : active_state_t;
    state   : active_state_t;
  end record;
  type active_event_access_t is access all active_event_t;
  pragma convention (c, active_event_t);
  pragma convention (c, active_event_access_t);

  -- Keyboard event
  type keyboard_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    state   : uint8_t;
    keysym  : aliased sdl.keyboard.keysym_t;
  end record;
  type keyboard_event_access_t is access all keyboard_event_t;
  pragma convention (c, keyboard_event_t);
  pragma convention (c, keyboard_event_access_t);

  -- Mouse motion event
  type mouse_motion_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    state   : uint8_t;
    x       : uint16_t;
    y       : uint16_t;
    xrel    : int16_t;
    yrel    : int16_t;
  end record;
  type mouse_motion_event_access_t is access all
   mouse_motion_event_t;
  pragma convention (c, mouse_motion_event_t);
  pragma convention (c, mouse_motion_event_access_t);

  -- Mouse button event
  type mouse_button_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    button  : uint8_t;
    state   : mouse.mouse_button_state_t;
    x       : uint16_t;
    y       : uint16_t;
  end record;
  type mouse_button_event_access_t is access all
   mouse_button_event_t;
  pragma convention (c, mouse_button_event_t);
  pragma convention (c, mouse_button_event_access_t);

  -- Joystick axis motion event
  type joy_axis_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    axis    : uint8_t;
    value   : int16_t;
  end record;
  type joy_axis_event_access_t is access all joy_axis_event_t;
  pragma convention (c, joy_axis_event_t);
  pragma convention (c, joy_axis_event_access_t);

  --  Joystick trackball motion event structure
  type joy_ball_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    ball    : uint8_t;
    xrel    : int16_t;
    yrel    : int16_t;
  end record;
  type joy_ball_event_access_t is access all joy_ball_event_t;
  pragma convention (c, joy_ball_event_t);
  pragma convention (c, joy_ball_event_access_t);

  -- Joystick hat position change event structure
  type joy_hat_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    hat     : uint8_t;
    value   : joystick.hat_state_t;
  end record;
  type joy_hat_event_access_t is access all joy_hat_event_t;
  pragma convention (c, joy_hat_event_t);
  pragma convention (c, joy_hat_event_access_t);

  -- Joystick button event structure
  type joy_button_event_t is record
    ev_type : type_t;
    which   : uint8_t;
    button  : uint8_t;
    state   : uint8_t;
  end record;
  type joy_button_event_access_t is access all joy_button_event_t;
  pragma convention (c, joy_button_event_t);
  pragma convention (c, joy_button_event_access_t);

  -- "Window resized" event.
  type resize_event_t is record
    ev_type : type_t;
    w       : c.int;
    h       : c.int;
  end record;
  type resize_event_access_t is access all resize_event_t;
  pragma convention (c, resize_event_t);
  pragma convention (c, resize_event_access_t);

  -- The "quit requested" event
  type quit_event_t is record
    ev_type : type_t;
  end record;
  type quit_event_access_t is access all quit_event_t;
  pragma convention (c, quit_event_t);
  pragma convention (c, quit_event_access_t);

  -- User event type
  type user_event_t is record
    ev_type : type_t;
    code    : c.int;
    data1   : void_ptr_t;
    data2   : void_ptr_t;
  end record;
  type user_event_access_t is access all user_event_t;
  pragma convention (c, user_event_t);
  pragma convention (c, user_event_access_t);

  type sys_wm_msg_access_t is new void_ptr_t;
  type sys_wm_event_t is record
    ev_type : type_t;
    msg     : sys_wm_msg_access_t;
  end record;
  type sys_wm_event_access_t is access all sys_wm_event_t;
  pragma convention (c, sys_wm_event_t);
  pragma convention (c, sys_wm_event_access_t);

  type event_selector_t is (
    is_event_type,
    is_activeevent,
    is_keyboardevent,
    is_mousemotionevent,
    is_mousebuttonevent,
    is_joyaxisevent,
    is_joyballevent,
    is_joyhatevent,
    is_joybuttonevent,
    is_resizeevent,
    is_quitevent,
    is_userevent,
    is_syswmevent);

  -- event union
  type event_t (ev : event_selector_t := is_event_type) is record
    case ev is
      when is_event_type       => ev_type : type_t;
      when is_activeevent      => active  : active_event_t;
      when is_keyboardevent    => key     : keyboard_event_t;
      when is_mousemotionevent => motion  : mouse_motion_event_t;
      when is_mousebuttonevent => button  : mouse_button_event_t;
      when is_joyaxisevent     => jaxis   : joy_axis_event_t;
      when is_joyballevent     => jball   : joy_ball_event_t;
      when is_joyhatevent      => jhat    : joy_hat_event_t;
      when is_joybuttonevent   => jbutton : joy_button_event_t;
      when is_resizeevent      => resize  : resize_event_t;
      when is_quitevent        => quit    : quit_event_t;
      when is_userevent        => user    : user_event_t;
      when is_syswmevent       => syswm   : sys_wm_event_t;
    end case;
  end record;
  type event_access_t is access all event_t;
  pragma convention (c, event_t);
  pragma convention (c, event_access_t);
  pragma unchecked_union (event_t);

  --
  -- API functions.
  --

  type action_t is new c.int;
  addevent  : constant action_t := 0;
  peekevent : constant action_t := 1;
  getevent  : constant action_t := 2;

  -- Checks the event queue for messages and optionally return s them.
  function peepevents
   (events     : event_access_t;
    num_events : c.int;
    action     : action_t;
    mask       : mask_t) return c.int;

  function peep_events
   (events     : event_access_t;
    num_events : c.int;
    action     : action_t;
    mask       : mask_t) return c.int renames peepevents;
  pragma import (c, peepevents, "SDL_PeepEvents");

  -- Polls for currently pending events.
  function pollevent (event_val : access event_t) return c.int;
  function poll_event (event_val : access event_t) return c.int renames pollevent;
  pragma import (c, pollevent, "SDL_PollEvent");

  -- Pumps the event loop, gathering events from the input devices.
  procedure pumpevents;
  procedure pump_events renames pumpevents;
  pragma import (c, pumpevents, "SDL_PumpEvents");

  --  Add an event to the event queue.
  function pushevent (event : event_access_t) return c.int;
  procedure pushevent (event : event_access_t);
  function pushevent (event_val : event_t) return c.int;
  procedure pushevent (event_val : event_t);
  function push_event (event : event_access_t) return c.int renames pushevent;
  procedure push_event (event : event_access_t) renames pushevent;
  function push_event (event_val : event_t) return c.int renames pushevent;
  procedure push_event (event_val : event_t) renames pushevent;
  pragma import (c, pushevent, "SDL_PushEvent");

  type filter_t is access function (event : event_access_t) return c.int;
  pragma convention (c, filter_t);

  -- Sets up a filter to process all events
  procedure seteventfilter (filter : filter_t);
  procedure set_event_filter (filter : filter_t) renames seteventfilter;
  pragma import (c, seteventfilter, "SDL_SetEventFilter");

  -- Waits indefinitely for the next available event
  function waitevent (event : event_access_t) return c.int;
  procedure waitevent (event : event_access_t);
  function wait_event (event : event_access_t) return c.int renames waitevent;
  procedure wait_event (event : event_access_t) renames waitevent;
  pragma import (c, waitevent, "SDL_WaitEvent");

  -- return the current event filter
  function geteventfilter return filter_t;
  function get_event_filter return filter_t renames geteventfilter;
  pragma import (c, geteventfilter, "SDL_GetEventFilter");

  -- Allows you to set the state of processing certain events.
  query   : constant integer := -1;
  ignore  : constant integer := 0;
  disable : constant integer := 0;
  enable  : constant integer := 1;

  function eventstate
   (event_type : type_t;
    state      : c.int) return uint8_t;

  function event_state
   (event_type : type_t;
    state      : c.int) return uint8_t renames eventstate;

  procedure eventstate (event_type : type_t; state : c.int);
  procedure event_state (event_type : type_t; state : c.int) renames eventstate;
  pragma import (c, eventstate, "SDL_EventState");

end sdl.events;
