with SDL.Mouse;
with SDL.Keyboard;
with SDL.Joystick;
with Interfaces;

package SDL.Events is
  package I renames Interfaces;

  type Type_t is new Uint8_t;
  pragma Convention (C, Type_t);

  -- events
  No_Event          : constant Type_t := 0;
  Is_Active_Event   : constant Type_t := 1;
  Key_Down          : constant Type_t := 2;
  Key_Up            : constant Type_t := 3;
  Mouse_Motion      : constant Type_t := 4;
  Mouse_Button_Down : constant Type_t := 5;
  Mouse_Button_Up   : constant Type_t := 6;
  Joy_Axis_Motion   : constant Type_t := 7;
  Joy_Ball_Motion   : constant Type_t := 8;
  Joy_Hat_Motion    : constant Type_t := 9;
  Joy_Button_Down   : constant Type_t := 10;
  Joy_Button_Up     : constant Type_t := 11;
  Quit              : constant Type_t := 12;
  Is_Sys_WM_Event   : constant Type_t := 13;
  Event_Reserved_A  : constant Type_t := 14;
  Event_Reserved_B  : constant Type_t := 15;
  Video_Resize      : constant Type_t := 16;
  Event_Reserved_1  : constant Type_t := 17;
  Event_Reserved_2  : constant Type_t := 18;
  Event_Reserved_3  : constant Type_t := 19;
  Event_Reserved_4  : constant Type_t := 20;
  Event_Reserved_5  : constant Type_t := 21;
  Event_Reserved_6  : constant Type_t := 22;
  Event_Reserved_7  : constant Type_t := 23;
  Is_User_Event     : constant Type_t := 24;
  Num_Events        : constant Type_t := 32;

  -- event masks
  type Mask_t is new Uint32_t;
  pragma Convention (C, Mask_t);

  Active_Event_Mask      : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Is_Active_Event)));
  Key_Down_Mask          : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Key_Down)));
  Key_Up_Mask            : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Key_Up)));
  Mouse_Motion_Mask      : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Mouse_Motion)));
  Mouse_Button_Down_Mask : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Mouse_Button_Down)));
  Mouse_Button_Up_Mask   : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Mouse_Button_Up)));
  Mouse_Event_Mask       : constant Mask_t :=
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Mouse_Motion))) or
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Mouse_Button_Down))) or
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Mouse_Button_Up)));
  Joy_Axis_Motion_Mask   : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Axis_Motion)));
  Joy_Ball_Motion_Mask   : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Ball_Motion)));
  Joy_Hat_Motion_Mask    : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Hat_Motion)));
  Joy_Button_Down_Mask   : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Button_Down)));
  Joy_Button_Up_Mask     : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Button_Up)));
  Joy_Event_Mask         : constant Mask_t :=
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Axis_Motion))) or
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Ball_Motion))) or
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Hat_Motion))) or
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Button_Down))) or
    Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Joy_Button_Up)));
  Video_Resize_Mask      : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Video_Resize)));
  Quit_Mask              : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Quit)));
  Sys_WM_Event_Mask      : constant Mask_t := Mask_t (I.Shift_Left (I.Unsigned_32 (1), Integer (Is_Sys_WM_Event)));
  All_Events             : constant Mask_t := 16#FFFFFFFF#;

  type Active_State_t is new Uint8_t;
  App_Mouse_Focus : constant Active_State_t := 2#00000001#;
  App_Input_Focus : constant Active_State_t := 2#00000010#;
  App_Active      : constant Active_State_t := 2#00000100#;

  -- Gets the state of the application
  function Getappstate return Active_State_t;
  function Get_App_State return Active_State_t renames Getappstate;
  pragma Import (C, Getappstate, "SDL_GetAppState");

  -- ACTIVEEVENT
  type Active_Event_t is record
    Ev_Type : Type_t;
    Gain    : Active_State_t;
    State   : Active_State_t;
  end record;
  type Active_Event_Access_t is access all Active_Event_t;
  pragma Convention (C, Active_Event_t);
  pragma Convention (C, Active_Event_Access_t);

  -- Keyboard event
  type Keyboard_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    State   : Uint8_t;
    Keysym  : aliased SDL.Keyboard.Keysym_t;
  end record;
  type Keyboard_Event_Access_t is access all Keyboard_Event_t;
  pragma Convention (C, Keyboard_Event_t);
  pragma Convention (C, Keyboard_Event_Access_t);

  -- Mouse motion event
  type Mouse_Motion_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    State   : Uint8_t;
    X       : Uint16_t;
    Y       : Uint16_t;
    Xrel    : Int16_t;
    Yrel    : Int16_t;
  end record;
  type Mouse_Motion_Event_Access_t is access all Mouse_Motion_Event_t;
  pragma Convention (C, Mouse_Motion_Event_t);
  pragma Convention (C, Mouse_Motion_Event_Access_t);

  -- Mouse button event
  type Mouse_Button_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    Button  : Uint8_t;
    State   : Mouse.Mouse_Button_State_t;
    X       : Uint16_t;
    Y       : Uint16_t;
  end record;
  type Mouse_Button_Event_Access_t is access all Mouse_Button_Event_t;
  pragma Convention (C, Mouse_Button_Event_t);
  pragma Convention (C, Mouse_Button_Event_Access_t);

  -- Joystick axis motion event
  type Joy_Axis_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    Axis    : Uint8_t;
    Value   : Int16_t;
  end record;
  type Joy_Axis_Event_Access_t is access all Joy_Axis_Event_t;
  pragma Convention (C, Joy_Axis_Event_t);
  pragma Convention (C, Joy_Axis_Event_Access_t);

  --  Joystick trackball motion event structure
  type Joy_Ball_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    Ball    : Uint8_t;
    Xrel    : Int16_t;
    Yrel    : Int16_t;
  end record;
  type Joy_Ball_Event_Access_t is access all Joy_Ball_Event_t;
  pragma Convention (C, Joy_Ball_Event_t);
  pragma Convention (C, Joy_Ball_Event_Access_t);

  -- Joystick hat position change event structure
  type Joy_Hat_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    Hat     : Uint8_t;
    Value   : Joystick.Hat_State_t;
  end record;
  type Joy_Hat_Event_Access_t is access all Joy_Hat_Event_t;
  pragma Convention (C, Joy_Hat_Event_t);
  pragma Convention (C, Joy_Hat_Event_Access_t);

  -- Joystick button event structure
  type Joy_Button_Event_t is record
    Ev_Type : Type_t;
    Which   : Uint8_t;
    Button  : Uint8_t;
    State   : Uint8_t;
  end record;
  type Joy_Button_Event_Access_t is access all Joy_Button_Event_t;
  pragma Convention (C, Joy_Button_Event_t);
  pragma Convention (C, Joy_Button_Event_Access_t);

  -- "Window resized" event.
  type Resize_Event_t is record
    Ev_Type : Type_t;
    W       : C.int;
    H       : C.int;
  end record;
  type Resize_Event_Access_t is access all Resize_Event_t;
  pragma Convention (C, Resize_Event_t);
  pragma Convention (C, Resize_Event_Access_t);

  -- The "quit requested" event
  type Quit_Event_t is record
    Ev_Type : Type_t;
  end record;
  type Quit_Event_Access_t is access all Quit_Event_t;
  pragma Convention (C, Quit_Event_t);
  pragma Convention (C, Quit_Event_Access_t);

  -- User event type
  type User_Event_t is record
    Ev_Type : Type_t;
    Code    : C.int;
    Data1   : Void_Ptr_t;
    Data2   : Void_Ptr_t;
  end record;
  type User_Event_Access_t is access all User_Event_t;
  pragma Convention (C, User_Event_t);
  pragma Convention (C, User_Event_Access_t);

  type Sys_WM_Message_Access_t is new Void_Ptr_t;
  type Sys_WM_Event_t is record
    Ev_Type : Type_t;
    Message : Sys_WM_Message_Access_t;
  end record;
  type Sys_WM_Event_Access_t is access all Sys_WM_Event_t;
  pragma Convention (C, Sys_WM_Event_t);
  pragma Convention (C, Sys_WM_Event_Access_t);

  type Event_Selector_t is (
    ES_Event_Type,
    ES_Active_Event,
    ES_Keyboard_Event,
    ES_Mouse_Motion_Event,
    ES_Mousebutton_Event,
    ES_Joy_Axis_Event,
    ES_Joy_Ball_Event,
    ES_Joy_Hat_Event,
    ES_Joy_Button_Event,
    ES_Resize_Event,
    ES_Quit_Event,
    ES_User_Event,
    ES_Sys_WM_Event);

  -- event union
  type Event_t (Ev : Event_Selector_t := ES_Event_Type) is record
    case Ev is
      when ES_Event_Type => Ev_Type : Type_t;
      when ES_Active_Event => Active : Active_Event_t;
      when ES_Keyboard_Event => Key : Keyboard_Event_t;
      when ES_Mouse_Motion_Event => Motion : Mouse_Motion_Event_t;
      when ES_Mousebutton_Event => Button : Mouse_Button_Event_t;
      when ES_Joy_Axis_Event => Jaxis : Joy_Axis_Event_t;
      when ES_Joy_Ball_Event => Jball : Joy_Ball_Event_t;
      when ES_Joy_Hat_Event => Jhat : Joy_Hat_Event_t;
      when ES_Joy_Button_Event => Jbutton : Joy_Button_Event_t;
      when ES_Resize_Event => Resize : Resize_Event_t;
      when ES_Quit_Event => Quit : Quit_Event_t;
      when ES_User_Event => User : User_Event_t;
      when ES_Sys_WM_Event => Sys_WM : Sys_WM_Event_t;
    end case;
  end record;
  type Event_Access_t is access all Event_t;
  pragma Convention (C, Event_t);
  pragma Convention (C, Event_Access_t);
  pragma Unchecked_Union (Event_t);

  --
  -- API functions.
  --

  type Action_t is new C.int;
  Add_Event  : constant Action_t := 0;
  Peek_Event : constant Action_t := 1;
  Get_Event  : constant Action_t := 2;

  -- Checks the event queue for messages and optionally return s them.
  function PeepEvents
   (Events     : Event_Access_t;
    Num_Events : C.int;
    Action     : Action_t;
    Mask       : Mask_t)
    return       C.int;

  function Peep_Events
   (Events     : Event_Access_t;
    Num_Events : C.int;
    Action     : Action_t;
    Mask       : Mask_t)
    return       C.int renames PeepEvents;
  pragma Import (C, PeepEvents, "SDL_PeepEvents");

  -- Polls for currently pending events.
  function PollEvent (Event_Val : access Event_t) return C.int;
  function Poll_Event (Event_Val : access Event_t) return C.int renames PollEvent;
  pragma Import (C, PollEvent, "SDL_PollEvent");

  -- Pumps the event loop, gathering events from the input devices.
  procedure PumpEvents;
  procedure Pump_Events renames PumpEvents;
  pragma Import (C, PumpEvents, "SDL_PumpEvents");

  --  Add an event to the event queue.
  function PushEvent (Event : Event_Access_t) return C.int;
  procedure PushEvent (Event : Event_Access_t);
  function PushEvent (Event_Val : Event_t) return C.int;
  procedure PushEvent (Event_Val : Event_t);
  function Push_Event (Event : Event_Access_t) return C.int renames PushEvent;
  procedure Push_Event (Event : Event_Access_t) renames PushEvent;
  function Push_Event (Event_Val : Event_t) return C.int renames PushEvent;
  procedure Push_Event (Event_Val : Event_t) renames PushEvent;
  pragma Import (C, PushEvent, "SDL_PushEvent");

  type Filter_t is access function (Event : Event_Access_t) return C.int;
  pragma Convention (C, Filter_t);

  -- Sets up a filter to process all events
  procedure SetEventFilter (Filter : Filter_t);
  procedure Set_Event_Filter (Filter : Filter_t) renames SetEventFilter;
  pragma Import (C, SetEventFilter, "SDL_SetEventFilter");

  -- Waits indefinitely for the next available event
  function WaitEvent (Event : Event_Access_t) return C.int;
  procedure WaitEvent (Event : Event_Access_t);
  function Wait_Event (Event : Event_Access_t) return C.int renames WaitEvent;
  procedure Wait_Event (Event : Event_Access_t) renames WaitEvent;
  pragma Import (C, WaitEvent, "SDL_WaitEvent");

  -- return the current event filter
  function GetEventFilter return Filter_t;
  function Get_Event_Filter return Filter_t renames GetEventFilter;
  pragma Import (C, GetEventFilter, "SDL_GetEventFilter");

  -- Allows you to set the state of processing certain events.
  Query   : constant := -1;
  Ignore  : constant := 0;
  Disable : constant := 0;
  Enable  : constant := 1;

  function EventState (Event_Type : Type_t; State : C.int) return Uint8_t;
  function Event_State (Event_Type : Type_t; State : C.int) return Uint8_t renames EventState;

  procedure EventState (Event_Type : Type_t; State : C.int);
  procedure Event_State (Event_Type : Type_t; State : C.int) renames EventState;
  pragma Import (C, EventState, "SDL_EventState");

end SDL.Events;
