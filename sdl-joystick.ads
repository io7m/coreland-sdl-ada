with interfaces.c.strings;

package SDL.joystick is
  package cs renames interfaces.c.strings;

  type Joystick_ptr is new void_ptr;
  pragma convention (c, Joystick_ptr);

  type hat_state is new uint16;
  pragma convention (c, hat_state);

  type button_state is new uint8;
  pragma convention (c, button_state);

  HAT_CENTERED:  constant HAT_State := 16#00#;
  HAT_UP:        constant HAT_State := 16#01#;
  HAT_RIGHT:     constant HAT_State := 16#02#;
  HAT_DOWN:      constant HAT_State := 16#04#;
  HAT_LEFT:      constant HAT_State := 16#08#;
  HAT_RIGHTUP:   constant HAT_State := (HAT_RIGHT or HAT_UP);
  HAT_RIGHTDOWN: constant HAT_State := (HAT_RIGHT or HAT_DOWN);
  HAT_LEFTUP:    constant HAT_State := (HAT_LEFT  or HAT_UP);
  HAT_LEFTDOWN:  constant HAT_State := (HAT_LEFT  or HAT_DOWN);

  PRESSED:  constant button_state := 1;
  RELEASED: constant button_state := 0;

  -- Closes a previously opened joystick.
  procedure Close (js: Joystick_ptr);
  pragma import (c, Close, "SDL_JoystickClose");

  -- Enable/disable joystick event polling.
  function EventState (state: c.int) return c.int;
  pragma import (c, EventState, "SDL_JoystickEventState");

  -- Gets the current state of an axis.
  function GetAxis (js: Joystick_ptr; axis: c.int) return int16;
  function get_axis (js: Joystick_ptr; axis: c.int) return int16;
  pragma import (c, GetAxis, "SDL_JoystickGetAxis");
  pragma import (c, get_axis, "SDL_JoystickGetAxis");

  -- Gets relative trackball motion
  function GetBall (js: Joystick_ptr; ball: c.int; dx, dy: int_ptr) return c.int;
  function get_ball (js: Joystick_ptr; ball: c.int; dx, dy: int_ptr) return c.int;
  pragma import (c, GetBall, "SDL_JoystickGetBall");
  pragma import (c, get_ball, "SDL_JoystickGetBall");

  -- Gets the current state of a joystick hat
  function GetHat (js: Joystick_ptr; hat: c.int) return uint8;
  function get_hat (js: Joystick_ptr; hat: c.int) return uint8;
  pragma import (c, GetHat, "SDL_JoystickGetHat");
  pragma import (c, get_hat, "SDL_JoystickGetHat");

  -- Gets the current state of a given button on a given joystick
  function GetButton (js: Joystick_ptr; button: c.int) return button_state;
  function get_button (js: Joystick_ptr; button: c.int) return button_state;
  pragma import (c, GetButton, "SDL_JoystickGetButton");
  pragma import (c, get_button, "SDL_JoystickGetButton");

  -- Get the device index of an opened joystick.
  function Index (js: Joystick_ptr) return c.int;
  pragma import (c, Index, "SDL_JoystickIndex");

  -- Gets joystick name.
  function Name (device_index: c.int) return cs.chars_ptr;
  pragma import (c, Name, "SDL_JoystickName");

  -- Counts available joysticks.
  function NumJoysticks return c.int;
  function num_joysticks return c.int;
  pragma import (c, NumJoysticks, "SDL_NumJoysticks");
  pragma import (c, num_joysticks, "SDL_NumJoysticks");

  -- Gets the number of joystick axes
  function NumAxes (js: Joystick_ptr) return c.int;
  function num_axes (js: Joystick_ptr) return c.int;
  pragma import (c, NumAxes, "SDL_JoystickNumAxes");
  pragma import (c, num_axes, "SDL_JoystickNumAxes");

  -- Gets the number of joystick trackballs
  function NumBalls (js: Joystick_ptr) return c.int;
  function num_balls (js: Joystick_ptr) return c.int;
  pragma import (c, NumBalls, "SDL_JoystickNumBalls");
  pragma import (c, num_balls, "SDL_JoystickNumBalls");

  -- Gets the number of joystick hats
  function NumHats (js: Joystick_ptr) return c.int;
  function num_hats (js: Joystick_ptr) return c.int;
  pragma import (c, NumHats, "SDL_JoystickNumHats");
  pragma import (c, num_hats, "SDL_JoystickNumHats");

  -- Gets the number of joystick buttons
  function NumButtons (js: Joystick_ptr) return c.int;
  function num_buttons (js: Joystick_ptr) return c.int;
  pragma import (c, NumButtons, "SDL_JoystickNumButtons");
  pragma import (c, num_buttons, "SDL_JoystickNumButtons");

  -- Opens a joystick for use.
  function Open (device_index: c.int) return Joystick_ptr;
  pragma import (c, Open, "SDL_JoystickOpen");

  -- Determines if a joystick has been opened
  function Opened (device_index: c.int) return c.int;
  pragma import (c, Opened, "SDL_JoystickOpened");

  -- Updates the state of all joysticks.
  procedure Update;
  pragma import (c, Update, "SDL_JoystickUpdate");

end SDL.joystick;
