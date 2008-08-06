with SDL.mouse;
with SDL.keyboard;
with SDL.joystick;
with interfaces;

package SDL.events is
  package i renames interfaces;

  type event_type_t is new uint8;
  pragma convention (c, event_type_t);

  -- events
  NOEVENT         : constant event_type_t := 0;
  ISACTIVEEVENT   : constant event_type_t := 1;
  KEYDOWN         : constant event_type_t := 2;
  KEYUP           : constant event_type_t := 3;
  MOUSEMOTION     : constant event_type_t := 4;
  MOUSEBUTTONDOWN : constant event_type_t := 5;
  MOUSEBUTTONUP   : constant event_type_t := 6;
  JOYAXISMOTION   : constant event_type_t := 7;
  JOYBALLMOTION   : constant event_type_t := 8;
  JOYHATMOTION    : constant event_type_t := 9;
  JOYBUTTONDOWN   : constant event_type_t := 10;
  JOYBUTTONUP     : constant event_type_t := 11;
  QUIT            : constant event_type_t := 12;
  ISSYSWMEVENT    : constant event_type_t := 13;
  EVENT_RESERVEDA : constant event_type_t := 14;
  EVENT_RESERVEDB : constant event_type_t := 15;
  VIDEORESIZE     : constant event_type_t := 16;
  EVENT_RESERVED1 : constant event_type_t := 17;
  EVENT_RESERVED2 : constant event_type_t := 18;
  EVENT_RESERVED3 : constant event_type_t := 19;
  EVENT_RESERVED4 : constant event_type_t := 20;
  EVENT_RESERVED5 : constant event_type_t := 21;
  EVENT_RESERVED6 : constant event_type_t := 22;
  EVENT_RESERVED7 : constant event_type_t := 23;
  ISUSEREVENT     : constant event_type_t := 24;
  NUMEVENTS       : constant event_type_t := 32;

  -- event masks
  type event_mask_t is new uint32;
  pragma convention (c, event_mask_t);

  ACTIVEEVENTMASK     : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (ISACTIVEEVENT)));
  KEYDOWNMASK         : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (KEYDOWN)));
  KEYUPMASK           : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (KEYUP)));
  MOUSEMOTIONMASK     : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (MOUSEMOTION)));
  MOUSEBUTTONDOWNMASK : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONDOWN)));
  MOUSEBUTTONUPMASK   : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONUP)));
  MOUSEEVENTMASK      : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (MOUSEMOTION))) or
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONDOWN))) or
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONUP)));
  JOYAXISMOTIONMASK   : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYAXISMOTION)));
  JOYBALLMOTIONMASK   : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYBALLMOTION)));
  JOYHATMOTIONMASK    : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYHATMOTION)));
  JOYBUTTONDOWNMASK   : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONDOWN)));
  JOYBUTTONUPMASK     : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONUP)));
  JOYEVENTMASK : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYAXISMOTION))) or
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYBALLMOTION))) or
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYHATMOTION)))  or
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONDOWN))) or
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONUP)));
  VIDEORESIZEMASK    : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (VIDEORESIZE)));
  QUITMASK           : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (QUIT)));
  SYSWMEVENTMASK     : constant event_mask_t :=
    event_mask_t (i.shift_left (i.unsigned_32 (1), integer (ISSYSWMEVENT)));
  ALLEVENTS          : constant event_mask_t := 16#FFFFFFFF#;

  type active_state_t is new uint8;
  APPMOUSEFOCUS : constant active_state_t := 2#00000001#;
  APPINPUTFOCUS : constant active_state_t := 2#00000010#;
  APPACTIVE     : constant active_state_t := 2#00000100#;

  -- Gets the state of the application
  function GetAppState return active_state_t;
  function get_app_state return active_state_t renames GetAppState;
  pragma import (c, GetAppState, "SDL_GetAppState");

  -- ACTIVEEVENT
  type active_event_t is record
    ev_type : event_type_t;
    gain    : active_state_t;
    state   : active_state_t;
  end record;
  type active_event_ptr_t is access all active_event_t;
  pragma convention (c, active_event_t);
  pragma convention (c, active_event_ptr_t);

  -- Keyboard event
  type keyboard_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    state   : uint8;
    keysym  : aliased SDL.Keyboard.keysym_t;
  end record;
  type keyboard_event_ptr_t is access all keyboard_event_t;
  pragma convention (c, keyboard_event_t);
  pragma convention (c, keyboard_event_ptr_t);

  -- Mouse motion event
  type mouse_motion_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    state   : uint8;
    x       : uint16;
    y       : uint16;
    xrel    : int16;
    yrel    : int16;
  end record;
  type mouse_motion_event_ptr_t is access all mouse_motion_event_t;
  pragma convention (c, mouse_motion_event_t);
  pragma convention (c, mouse_motion_event_ptr_t);

  -- Mouse button event
  type mouse_button_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    button  : uint8;
    state   : mouse.mouse_button_state_t;
    x       : uint16;
    y       : uint16;
  end record;
  type mouse_button_event_ptr_t is access all mouse_button_event_t;
  pragma convention (c, mouse_button_event_t);
  pragma convention (c, mouse_button_event_ptr_t);

  -- Joystick axis motion event
  type joy_axis_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    axis    : uint8;
    value   : int16;
  end record;
  type joy_axis_event_ptr_t is access all joy_axis_event_t;
  pragma convention (c, joy_axis_event_t);
  pragma convention (c, joy_axis_event_ptr_t);

  --  Joystick trackball motion event structure
  type joy_ball_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    ball    : uint8;
    xrel    : int16;
    yrel    : int16;
  end record;
  type joy_ball_event_ptr_t is access all joy_ball_event_t;
  pragma convention (c, joy_ball_event_t);
  pragma convention (c, joy_ball_event_ptr_t);

  -- Joystick hat position change event structure
  type joy_hat_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    hat     : uint8;
    value   : joystick.hat_state_t;
  end record;
  type joy_hat_event_ptr_t is access all joy_hat_event_t;
  pragma convention (c, joy_hat_event_t);
  pragma convention (c, joy_hat_event_ptr_t);

  -- Joystick button event structure
  type joy_button_event_t is record
    ev_type : event_type_t;
    which   : uint8;
    button  : uint8;
    state   : uint8;
  end record;
  type joy_button_event_ptr_t is access all joy_button_event_t;
  pragma convention (c, joy_button_event_t);
  pragma convention (c, joy_button_event_ptr_t);

  -- "Window resized" event.
  type resize_event_t is record
    ev_type : event_type_t;
    w       : c.int;
    h       : c.int;
  end record;
  type resize_event_ptr_t is access all resize_event_t;
  pragma convention (c, resize_event_t);
  pragma convention (c, resize_event_ptr_t);

  -- The "quit requested" event
  type quit_event_t is record
    ev_type : event_type_t;
  end record;
  type quit_event_ptr_t is access all quit_event_t;
  pragma convention (c, quit_event_t);
  pragma convention (c, quit_event_ptr_t);

  -- User event type
  type user_event_t is record
    ev_type : event_type_t;
    code    : c.int;
    data1   : void_ptr_t;
    data2   : void_ptr_t;
  end record;
  type user_event_ptr_t is access all user_event_t;
  pragma convention (c, user_event_t);
  pragma convention (c, user_event_ptr_t);

  type sys_wm_msg_ptr_t is new void_ptr_t;
  type sys_wm_event_t is record
    ev_type : event_type_t;
    msg     : sys_wm_msg_ptr_t;
  end record;
  type sys_wm_event_ptr_t is access all sys_wm_event_t;
  pragma convention (c, sys_wm_event_t);
  pragma convention (c, sys_wm_event_ptr_t);

  type event_selector_t is (
    is_event_type,
    is_ActiveEvent,
    is_KeyboardEvent,
    is_MouseMotionEvent,
    is_MouseButtonEvent,
    is_JoyAxisEvent,
    is_JoyBallEvent,
    is_JoyHatEvent,
    is_JoyButtonEvent,
    is_ResizeEvent,
    is_QuitEvent,
    is_UserEvent,
    is_SysWMEvent
  );

  -- event union
  type event_t (ev : event_selector_t := is_event_type) is record
    case ev is
      when is_event_type       => ev_type : event_type_t;
      when is_ActiveEvent      => active  : active_event_t;
      when is_KeyboardEvent    => key     : keyboard_event_t;
      when is_MouseMotionEvent => motion  : mouse_motion_event_t;
      when is_MouseButtonEvent => button  : mouse_button_event_t;
      when is_JoyAxisEvent     => jaxis   : joy_axis_event_t;
      when is_JoyBallEvent     => jball   : joy_ball_event_t;
      when is_JoyHatEvent      => jhat    : joy_hat_event_t;
      when is_JoyButtonEvent   => jbutton : joy_button_event_t;
      when is_ResizeEvent      => resize  : resize_event_t;
      when is_QuitEvent        => quit    : quit_event_t;
      when is_UserEvent        => user    : user_event_t;
      when is_SysWMEvent       => syswm   : sys_wm_event_t;
    end case;
  end record;
  type event_ptr_t is access all event_t;
  pragma convention (c, event_t);
  pragma convention (c, event_ptr_t);
  pragma unchecked_union (event_t);

  --
  -- API functions.
  --

  type event_action_t is new c.int;
  ADDEVENT :  constant event_action_t := 0;
  PEEKEVENT : constant event_action_t := 1;
  GETEVENT :  constant event_action_t := 2;

  -- Checks the event queue for messages and optionally returns them.
  function PeepEvents
   (events     : event_ptr_t;
    num_events : c.int;
    action     : event_action_t;
    mask       : event_mask_t) return c.int;
  function peep_events
   (events     : event_ptr_t;
    num_events : c.int;
    action     : event_action_t;
    mask       : event_mask_t) return c.int renames PeepEvents;
  pragma import (c, PeepEvents, "SDL_PeepEvents");

  -- Polls for currently pending events.
  function PollEvent (event_val : access event_t) return c.int;
  function poll_event (event_val : access event_t) return c.int renames PollEvent;
  pragma import (c, PollEvent, "SDL_PollEvent");

  -- Pumps the event loop, gathering events from the input devices.
  procedure PumpEvents;
  procedure pump_events renames PumpEvents;
  pragma import (c, PumpEvents, "SDL_PumpEvents");

  --  Add an event to the event queue.
  function PushEvent (event : event_ptr_t) return c.int;
  procedure PushEvent (event : event_ptr_t);
  function PushEvent (event_val : event_t) return c.int;
  procedure PushEvent (event_val : event_t);
  function push_event (event : event_ptr_t) return c.int renames PushEvent;
  procedure push_event (event : event_ptr_t) renames PushEvent;
  function push_event (event_val : event_t) return c.int renames PushEvent;
  procedure push_event (event_val : event_t) renames PushEvent;
  pragma import (c, PushEvent, "SDL_PushEvent");

  type event_filter_t is access function (event : event_ptr_t) return c.int;
  pragma convention (c, event_filter_t);

  -- Sets up a filter to process all events
  procedure SetEventFilter (filter : event_filter_t);
  procedure set_event_filter (filter : event_filter_t) renames SetEventFilter;
  pragma import (c, SetEventFilter, "SDL_SetEventFilter");

  -- Waits indefinitely for the next available event
  function WaitEvent (event : event_ptr_t) return c.int;
  procedure WaitEvent (event : event_ptr_t);
  function wait_event (event : event_ptr_t) return c.int renames WaitEvent;
  procedure wait_event (event : event_ptr_t) renames WaitEvent;
  pragma import (c, WaitEvent, "SDL_WaitEvent");

  -- Return the current event filter
  function GetEventFilter return event_filter_t;
  function get_event_filter return event_filter_t renames GetEventFilter;
  pragma import (c, GetEventFilter, "SDL_GetEventFilter");

  -- Allows you to set the state of processing certain events.
  QUERY :   constant integer := -1;
  IGNORE :  constant integer := 0;
  DISABLE : constant integer := 0;
  ENABLE :  constant integer := 1;

  function EventState (event_type : event_type_t; state : c.int) return uint8;
  function event_state (event_type : event_type_t; state : c.int) return uint8 renames EventState;
  procedure EventState (event_type : event_type_t; state : c.int);
  procedure event_state (event_type : event_type_t; state : c.int) renames EventState;
  pragma import (c, EventState, "SDL_EventState");

end SDL.events;
