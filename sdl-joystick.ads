with interfaces.c.strings;

package SDL.joystick is
  package cs renames interfaces.c.strings;

  type joystick_ptr_t is new void_ptr_t;
  pragma convention (c, joystick_ptr_t);

  type hat_state_t is new uint8;
  pragma convention (c, hat_state_t);

  type button_state_t is new uint8;
  pragma convention (c, button_state_t);

  HAT_CENTERED  : constant hat_state_t := 16#00#;
  HAT_UP        : constant hat_state_t := 16#01#;
  HAT_RIGHT     : constant hat_state_t := 16#02#;
  HAT_DOWN      : constant hat_state_t := 16#04#;
  HAT_LEFT      : constant hat_state_t := 16#08#;
  HAT_RIGHTUP   : constant hat_state_t := (HAT_RIGHT or HAT_UP);
  HAT_RIGHTDOWN : constant hat_state_t := (HAT_RIGHT or HAT_DOWN);
  HAT_LEFTUP    : constant hat_state_t := (HAT_LEFT  or HAT_UP);
  HAT_LEFTDOWN  : constant hat_state_t := (HAT_LEFT  or HAT_DOWN);

  PRESSED  : constant button_state_t := 1;
  RELEASED : constant button_state_t := 0;

  -- Closes a previously opened joystick.
  procedure Close (joystick : joystick_ptr_t);
  pragma import (c, Close, "SDL_JoystickClose");

  -- Enable/disable joystick event polling.
  function EventState (state : c.int) return c.int;
  pragma import (c, EventState, "SDL_JoystickEventState");

  -- Gets the current state of an axis.
  function GetAxis (joystick : joystick_ptr_t; axis : c.int) return int16;
  function get_axis (joystick : joystick_ptr_t; axis : c.int) return int16 renames GetAxis;
  pragma import (c, GetAxis, "SDL_JoystickGetAxis");

  -- Gets relative trackball motion
  function GetBall
   (joystick : joystick_ptr_t;
    ball     : c.int;
    delta_x  : int_ptr;
    delta_y  : int_ptr) return c.int;
  function get_ball
   (joystick : joystick_ptr_t;
    ball     : c.int;
    delta_x  : int_ptr;
    delta_y  : int_ptr) return c.int renames GetBall;
  pragma import (c, GetBall, "SDL_JoystickGetBall");

  -- Gets the current state of a joystick hat
  function GetHat (joystick : joystick_ptr_t; hat : c.int) return uint8;
  function get_hat (joystick : joystick_ptr_t; hat : c.int) return uint8 renames GetHat;
  pragma import (c, GetHat, "SDL_JoystickGetHat");

  -- Gets the current state of a given button on a given joystick
  function GetButton (joystick : joystick_ptr_t; button : c.int) return button_state_t;
  function get_button (joystick : joystick_ptr_t; button : c.int) return button_state_t renames GetButton;
  pragma import (c, GetButton, "SDL_JoystickGetButton");

  -- Get the device index of an opened joystick.
  function Index (joystick : joystick_ptr_t) return c.int;
  pragma import (c, Index, "SDL_JoystickIndex");

  -- Gets joystick name.
  function Name (device_index : c.int) return cs.chars_ptr;
  pragma import (c, Name, "SDL_JoystickName");

  -- Counts available joysticks.
  function NumJoysticks return c.int;
  function num_joysticks return c.int renames NumJoysticks;
  pragma import (c, NumJoysticks, "SDL_NumJoysticks");

  -- Gets the number of joystick axes
  function NumAxes (joystick : joystick_ptr_t) return c.int;
  function num_axes (joystick : joystick_ptr_t) return c.int renames NumAxes;
  pragma import (c, NumAxes, "SDL_JoystickNumAxes");

  -- Gets the number of joystick trackballs
  function NumBalls (joystick : joystick_ptr_t) return c.int;
  function num_balls (joystick : joystick_ptr_t) return c.int renames NumBalls;
  pragma import (c, NumBalls, "SDL_JoystickNumBalls");

  -- Gets the number of joystick hats
  function NumHats (joystick : joystick_ptr_t) return c.int;
  function num_hats (joystick : joystick_ptr_t) return c.int renames NumHats;
  pragma import (c, NumHats, "SDL_JoystickNumHats");

  -- Gets the number of joystick buttons
  function NumButtons (joystick : joystick_ptr_t) return c.int;
  function num_buttons (joystick : joystick_ptr_t) return c.int renames NumButtons;
  pragma import (c, NumButtons, "SDL_JoystickNumButtons");

  -- Opens a joystick for use.
  function Open (device_index : c.int) return joystick_ptr_t;
  pragma import (c, Open, "SDL_JoystickOpen");

  -- Determines if a joystick has been opened
  function Opened (device_index : c.int) return c.int;
  pragma import (c, Opened, "SDL_JoystickOpened");

  -- Updates the state of all joysticks.
  procedure Update;
  pragma import (c, Update, "SDL_JoystickUpdate");

end SDL.joystick;
