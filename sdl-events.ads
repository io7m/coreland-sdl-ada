with SDL.mouse;
with SDL.keyboard;
with SDL.joystick;
with interfaces;

package SDL.events is
  package i renames interfaces;

  type event_type is new uint8;
  pragma convention (c, event_type);

  -- events
  NOEVENT:         constant event_type := 0;
  ISACTIVEEVENT:   constant event_type := 1;
  KEYDOWN:         constant event_type := 2;
  KEYUP:           constant event_type := 3;
  MOUSEMOTION:     constant event_type := 4;
  MOUSEBUTTONDOWN: constant event_type := 5;
  MOUSEBUTTONUP:   constant event_type := 6;
  JOYAXISMOTION:   constant event_type := 7;
  JOYBALLMOTION:   constant event_type := 8;
  JOYHATMOTION:    constant event_type := 9;
  JOYBUTTONDOWN:   constant event_type := 10;
  JOYBUTTONUP:     constant event_type := 11;
  QUIT:            constant event_type := 12;
  ISSYSWMEVENT:    constant event_type := 13;
  EVENT_RESERVEDA: constant event_type := 14;
  EVENT_RESERVEDB: constant event_type := 15;
  VIDEORESIZE:     constant event_type := 16;
  EVENT_RESERVED1: constant event_type := 17;
  EVENT_RESERVED2: constant event_type := 18;
  EVENT_RESERVED3: constant event_type := 19;
  EVENT_RESERVED4: constant event_type := 20;
  EVENT_RESERVED5: constant event_type := 21;
  EVENT_RESERVED6: constant event_type := 22;
  EVENT_RESERVED7: constant event_type := 23;
  ISUSEREVENT:     constant event_type := 24;
  NUMEVENTS:       constant event_type := 32;

  -- event masks
  type event_mask is new uint32;
  pragma convention (c, event_mask);

  ACTIVEEVENTMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (ISACTIVEEVENT)));
  KEYDOWNMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (KEYDOWN)));
  KEYUPMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (KEYUP)));
  MOUSEMOTIONMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (MOUSEMOTION)));
  MOUSEBUTTONDOWNMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONDOWN)));
  MOUSEBUTTONUPMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONUP)));
  MOUSEEVENTMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (MOUSEMOTION))) or
    event_mask (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONDOWN))) or
    event_mask (i.shift_left (i.unsigned_32 (1), integer (MOUSEBUTTONUP)));
  JOYAXISMOTIONMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYAXISMOTION)));
  JOYBALLMOTIONMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYBALLMOTION)));
  JOYHATMOTIONMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYHATMOTION)));
  JOYBUTTONDOWNMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONDOWN)));
  JOYBUTTONUPMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONUP)));
  JOYEVENTMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYAXISMOTION))) or
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYBALLMOTION))) or
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYHATMOTION)))  or
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONDOWN))) or
    event_mask (i.shift_left (i.unsigned_32 (1), integer (JOYBUTTONUP)));
  VIDEORESIZEMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (VIDEORESIZE)));
  QUITMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (QUIT)));
  SYSWMEVENTMASK: constant event_mask :=
    event_mask (i.shift_left (i.unsigned_32 (1), integer (ISSYSWMEVENT)));
  ALLEVENTS: constant event_mask := 16#FFFFFFFF#;

  type active_state is new uint8;
  APPMOUSEFOCUS: constant active_state := 2#00000001#;
  APPINPUTFOCUS: constant active_state := 2#00000010#;
  APPACTIVE:     constant active_state := 2#00000100#;

  -- Gets the state of the application
  function GetAppState return active_state;
  function get_app_state return active_state;
  pragma import (c, GetAppState, "SDL_GetAppState");
  pragma import (c, get_app_state, "SDL_GetAppState");

  -- ACTIVEEVENT
  type ActiveEvent is record
    ev_type: event_type;
       gain: active_state;
      state: active_state;
  end record;
  type Activeevent_ptr is access all ActiveEvent;
  pragma convention (c, ActiveEvent);
  pragma convention (c, Activeevent_ptr);

  -- Keyboard event
  type KeyboardEvent is record
    ev_type: event_type;
      which: uint8;
      state: uint8;
     keysym: aliased SDL.Keyboard.keysym;
  end record;
  type Keyboardevent_ptr is access all KeyboardEvent;
  pragma convention (c, KeyboardEvent);
  pragma convention (c, Keyboardevent_ptr);

  -- Mouse motion event
  type MouseMotionEvent is record
    ev_type: event_type;
      which: uint8;
      state: uint8;
          x: uint16;
          y: uint16;
       xrel: int16;
       yrel: int16;
  end record;
  type MouseMotionevent_ptr is access all MouseMotionEvent;
  pragma convention (c, MouseMotionEvent);
  pragma convention (c, MouseMotionevent_ptr);

  -- Mouse button event
  type MouseButtonEvent is record
    ev_type: event_type;
      which: uint8;
     button: uint8;
      state: mouse.mouse_button_state;
          x: uint16;
          y: uint16;
  end record;
  type MouseButtonevent_ptr is access all MouseButtonEvent;
  pragma convention (c, MouseButtonEvent);
  pragma convention (c, MouseButtonevent_ptr);

  -- Joystick axis motion event
  type JoyAxisEvent is record
    ev_type: event_type;
      which: uint8;
       axis: uint8;
      value: int16;
  end record;
  type JoyAxisevent_ptr is access all JoyAxisEvent;
  pragma convention (c, JoyAxisEvent);
  pragma convention (c, JoyAxisevent_ptr);

  --  Joystick trackball motion event structure
  type JoyBallEvent is record
    ev_type: event_type;
      which: uint8;
       ball: uint8;
       xrel: int16;
       yrel: int16;
  end record;
  type JoyBallevent_ptr is access all JoyBallEvent;
  pragma convention (c, JoyBallEvent);
  pragma convention (c, JoyBallevent_ptr);

  -- Joystick hat position change event structure
  type JoyHatEvent is record
    ev_type: event_type;
      which: uint8;
        hat: uint8;
      value: joystick.hat_state;
  end record;
  type JoyHatevent_ptr is access all JoyHatEvent;
  pragma convention (c, JoyHatEvent);
  pragma convention (c, JoyHatevent_ptr);

  -- Joystick button event structure
  type JoyButtonEvent is record
    ev_type: event_type;
      which: uint8;
     button: uint8;
      state: uint8;
  end record;
  type JoyButtonevent_ptr is access all JoyButtonEvent;
  pragma convention (c, JoyButtonEvent);
  pragma convention (c, JoyButtonevent_ptr);

  -- "Window resized" event.
  type ResizeEvent is record
    ev_type: event_type;
          w: c.int;
          h: c.int;
  end record;
  type Resizeevent_ptr is access all ResizeEvent;
  pragma convention (c, ResizeEvent);
  pragma convention (c, Resizeevent_ptr);

  -- The "quit requested" event
  type QuitEvent is record
    ev_type: event_type;
  end record;
  type Quitevent_ptr is access all QuitEvent;
  pragma convention (c, QuitEvent);
  pragma convention (c, Quitevent_ptr);

  -- User event type
  type UserEvent is record
    ev_type: event_type;
       code: c.int;
      data1: void_ptr;
      data2: void_ptr;
  end record;
  type Userevent_ptr is access all UserEvent;
  pragma convention (c, UserEvent);
  pragma convention (c, Userevent_ptr);

  type SysWMmsg_ptr is new void_ptr;
  type SysWMEvent is record
    ev_type: event_type;
        msg: SysWMmsg_ptr;
  end record;
  type SysWMEvent_ptr is access all SysWMEvent;
  pragma convention (c, SysWMEvent);
  pragma convention (c, SysWMevent_ptr);

  type event_selector is (
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
  type event (ev: event_selector := is_event_type) is record
    case ev is
      when is_event_type       => ev_type: event_type;
      when is_ActiveEvent      =>  active: ActiveEvent;
      when is_KeyboardEvent    =>     key: KeyboardEvent;
      when is_MouseMotionEvent =>  motion: MouseMotionEvent;
      when is_MouseButtonEvent =>  button: MouseButtonEvent;
      when is_JoyAxisEvent     =>   jaxis: JoyAxisEvent;
      when is_JoyBallEvent     =>   jball: JoyBallEvent;
      when is_JoyHatEvent      =>    jhat: JoyHatEvent;
      when is_JoyButtonEvent   => jbutton: JoyButtonEvent;
      when is_ResizeEvent      =>  resize: ResizeEvent;
      when is_QuitEvent        =>    quit: QuitEvent;
      when is_UserEvent        =>    user: UserEvent;
      when is_SysWMEvent       =>   syswm: SysWMEvent;
    end case;
  end record;
  type event_ptr is access all event;
  pragma convention (c, event);
  pragma convention (c, event_ptr);
  pragma unchecked_union (event);

  --
  -- API functions.
  --

  type event_action is new c.int;
  ADDEVENT:  constant := 0;
  PEEKEVENT: constant := 1;
  GETEVENT:  constant := 2;

  -- Checks the event queue for messages and optionally returns them.
  function PeepEvents (events: event_ptr; numevents: c.int;
    action: event_action; mask: event_mask) return c.int;
  function peep_events (events: event_ptr; numevents: c.int;
    action: event_action; mask: event_mask) return c.int;
  pragma import (c, PeepEvents, "SDL_PeepEvents");
  pragma import (c, peep_events, "SDL_PeepEvents");

  -- Polls for currently pending events.
  function PollEvent (event_val: access event) return c.int;
  function poll_event (event_val: access event) return c.int;
  pragma import (c, PollEvent, "SDL_PollEvent");
  pragma import (c, poll_event, "SDL_PollEvent");

  -- Pumps the event loop, gathering events from the input devices.
  procedure PumpEvents;
  procedure pump_events;
  pragma import (c, PumpEvents, "SDL_PumpEvents");
  pragma import (c, pump_events, "SDL_PumpEvents");

  --  Add an event to the event queue.
  function PushEvent (event: event_ptr) return c.int;
  procedure PushEvent (event: event_ptr);
  function PushEvent (event_val: event) return c.int;
  procedure PushEvent (event_val: event);
  function push_event (event: event_ptr) return c.int;
  procedure push_event (event: event_ptr);
  function push_event (event_val: event) return c.int;
  procedure push_event (event_val: event);
  pragma import (c, PushEvent, "SDL_PushEvent");
  pragma import (c, push_event, "SDL_PushEvent");

  type EventFilter is access function (event: event_ptr) return c.int;
  pragma convention (c, EventFilter);

  -- Sets up a filter to process all events
  procedure SetEventFilter (filter: EventFilter);
  procedure set_event_filter (filter: EventFilter);
  pragma import (c, SetEventFilter, "SDL_SetEventFilter");
  pragma import (c, set_event_filter, "SDL_SetEventFilter");

  -- Waits indefinitely for the next available event
  function WaitEvent (event: event_ptr) return c.int;
  procedure WaitEvent (event: event_ptr);
  function wait_event (event: event_ptr) return c.int;
  procedure wait_event (event: event_ptr);
  pragma import (c, WaitEvent, "SDL_WaitEvent");
  pragma import (c, wait_event, "SDL_WaitEvent");

  -- Return the current event filter
  function GetEventFilter return EventFilter;
  function get_event_filter return EventFilter;
  pragma import (c, GetEventFilter, "SDL_GetEventFilter");
  pragma import (c, get_event_filter, "SDL_GetEventFilter");

  -- Allows you to set the state of processing certain events.
  QUERY:   constant integer := -1;
  IGNORE:  constant integer := 0;
  DISABLE: constant integer := 0;
  ENABLE:  constant integer := 1;

  function EventState (the_type: event_type; state: c.int) return uint8;
  function event_state (the_type: event_type; state: c.int) return uint8;
  procedure EventState (the_type: event_type; state: c.int);
  procedure event_state (the_type: event_type; state: c.int);
  pragma import (c, EventState, "SDL_EventState");
  pragma import (c, event_state, "SDL_EventState");

end SDL.events;
