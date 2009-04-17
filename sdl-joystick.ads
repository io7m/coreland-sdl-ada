with Interfaces.C.Strings;

package SDL.Joystick is
  package CS renames Interfaces.C.Strings;

  type Joystick_Access_t is new Void_Ptr_t;
  pragma Convention (C, Joystick_Access_t);

  type Hat_State_t is new Uint8_t;
  pragma Convention (C, Hat_State_t);

  type Button_State_t is new Uint8_t;
  pragma Convention (C, Button_State_t);

  Hat_Centered  : constant Hat_State_t := 16#00#;
  Hat_Up        : constant Hat_State_t := 16#01#;
  Hat_Right     : constant Hat_State_t := 16#02#;
  Hat_Down      : constant Hat_State_t := 16#04#;
  Hat_Left      : constant Hat_State_t := 16#08#;
  Hat_Rightup   : constant Hat_State_t := (Hat_Right or Hat_Up);
  Hat_Rightdown : constant Hat_State_t := (Hat_Right or Hat_Down);
  Hat_Leftup    : constant Hat_State_t := (Hat_Left or Hat_Up);
  Hat_Leftdown  : constant Hat_State_t := (Hat_Left or Hat_Down);

  Pressed  : constant Button_State_t := 1;
  Released : constant Button_State_t := 0;

  -- Closes a previously opened joystick.
  procedure Close (Joystick : Joystick_Access_t);
  pragma Import (C, Close, "SDL_JoystickClose");

  -- Enable/disable joystick event polling.
  function EventState (State : C.int) return C.int;
  pragma Import (C, EventState, "SDL_JoystickEventState");

  -- Gets the current state of an axis.
  function GetAxis (Joystick : Joystick_Access_t; Axis : C.int) return Int16_t;
  function Get_Axis (Joystick : Joystick_Access_t; Axis : C.int) return Int16_t renames GetAxis;
  pragma Import (C, GetAxis, "SDL_JoystickGetAxis");

  -- Gets relative trackball motion
  function Getball
   (Joystick : Joystick_Access_t;
    Ball     : C.int;
    Delta_X  : Int_Ptr_t;
    Delta_Y  : Int_Ptr_t)
    return     C.int;
  function Get_Ball
   (Joystick : Joystick_Access_t;
    Ball     : C.int;
    Delta_X  : Int_Ptr_t;
    Delta_Y  : Int_Ptr_t)
    return     C.int renames Getball;
  pragma Import (C, Getball, "SDL_JoystickGetBall");

  -- Gets the current state of a joystick hat
  function GetHat (Joystick : Joystick_Access_t; Hat : C.int) return Uint8_t;
  function Get_Hat (Joystick : Joystick_Access_t; Hat : C.int) return Uint8_t renames GetHat;
  pragma Import (C, GetHat, "SDL_JoystickGetHat");

  -- Gets the current state of a given button on a given joystick
  function GetButton (Joystick : Joystick_Access_t; Button : C.int) return Button_State_t;
  function Get_Button (Joystick : Joystick_Access_t; Button : C.int) return Button_State_t renames GetButton;
  pragma Import (C, GetButton, "SDL_JoystickGetButton");

  -- Get the device index of an opened joystick.
  function Index (Joystick : Joystick_Access_t) return C.int;
  pragma Import (C, Index, "SDL_JoystickIndex");

  -- Gets joystick name.
  function Name (Device_Index : C.int) return CS.chars_ptr;
  pragma Import (C, Name, "SDL_JoystickName");

  -- Counts available joysticks.
  function NumJoysticks return  C.int;
  function Num_Joysticks return  C.int renames NumJoysticks;
  pragma Import (C, NumJoysticks, "SDL_NumJoysticks");

  -- Gets the number of joystick axes
  function NumAxes (Joystick : Joystick_Access_t) return C.int;
  function Num_Axes (Joystick : Joystick_Access_t) return C.int renames NumAxes;
  pragma Import (C, NumAxes, "SDL_JoystickNumAxes");

  -- Gets the number of joystick trackballs
  function NumBalls (Joystick : Joystick_Access_t) return C.int;
  function Num_Balls (Joystick : Joystick_Access_t) return C.int renames NumBalls;
  pragma Import (C, NumBalls, "SDL_JoystickNumBalls");

  -- Gets the number of joystick hats
  function NumHats (Joystick : Joystick_Access_t) return C.int;
  function Num_Hats (Joystick : Joystick_Access_t) return C.int renames NumHats;
  pragma Import (C, NumHats, "SDL_JoystickNumHats");

  -- Gets the number of joystick buttons
  function NumButtons (Joystick : Joystick_Access_t) return C.int;
  function Num_Buttons (Joystick : Joystick_Access_t) return C.int renames NumButtons;
  pragma Import (C, NumButtons, "SDL_JoystickNumButtons");

  -- Opens a joystick for use.
  function Open (Device_Index : C.int) return Joystick_Access_t;
  pragma Import (C, Open, "SDL_JoystickOpen");

  -- Determines if a joystick has been opened
  function Opened (Device_Index : C.int) return C.int;
  pragma Import (C, Opened, "SDL_JoystickOpened");

  -- Updates the state of all joysticks.
  procedure Update;
  pragma Import (C, Update, "SDL_JoystickUpdate");

end SDL.Joystick;
