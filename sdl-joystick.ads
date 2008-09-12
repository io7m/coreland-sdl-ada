with interfaces.C.strings;

package sdl.joystick is
  package cs renames interfaces.C.strings;

  type joystick_access_t is new void_ptr_t;
  pragma convention (c, joystick_access_t);

  type hat_state_t is new uint8_t;
  pragma convention (c, hat_state_t);

  type button_state_t is new uint8_t;
  pragma convention (c, button_state_t);

  hat_centered  : constant hat_state_t := 16#00#;
  hat_up        : constant hat_state_t := 16#01#;
  hat_right     : constant hat_state_t := 16#02#;
  hat_down      : constant hat_state_t := 16#04#;
  hat_left      : constant hat_state_t := 16#08#;
  hat_rightup   : constant hat_state_t := (hat_right or hat_up);
  hat_rightdown : constant hat_state_t := (hat_right or hat_down);
  hat_leftup    : constant hat_state_t := (hat_left or hat_up);
  hat_leftdown  : constant hat_state_t := (hat_left or hat_down);

  pressed  : constant button_state_t := 1;
  released : constant button_state_t := 0;

  -- Closes a previously opened joystick.
  procedure close (joystick : joystick_access_t);
  pragma import (c, close, "SDL_JoystickClose");

  -- Enable/disable joystick event polling.
  function eventstate (state : c.int) return c.int;
  pragma import (c, eventstate, "SDL_JoystickEventState");

  -- Gets the current state of an axis.
  function getaxis
   (joystick : joystick_access_t;
    axis     : c.int) return int16_t;
  function get_axis
   (joystick : joystick_access_t;
    axis     : c.int) return int16_t renames getaxis;
  pragma import (c, getaxis, "SDL_JoystickGetAxis");

  -- Gets relative trackball motion
  function getball
   (joystick : joystick_access_t;
    ball     : c.int;
    delta_x  : int_ptr_t;
    delta_y  : int_ptr_t) return c.int;
  function get_ball
   (joystick : joystick_access_t;
    ball     : c.int;
    delta_x  : int_ptr_t;
    delta_y  : int_ptr_t) return c.int renames getball;
  pragma import (c, getball, "SDL_JoystickGetBall");

  -- Gets the current state of a joystick hat
  function gethat
   (joystick : joystick_access_t;
    hat      : c.int) return uint8_t;
  function get_hat
   (joystick : joystick_access_t;
    hat      : c.int) return uint8_t renames gethat;
  pragma import (c, gethat, "SDL_JoystickGetHat");

  -- Gets the current state of a given button on a given joystick
  function getbutton
   (joystick : joystick_access_t;
    button   : c.int) return button_state_t;
  function get_button
   (joystick : joystick_access_t;
    button   : c.int) return button_state_t renames getbutton;
  pragma import (c, getbutton, "SDL_JoystickGetButton");

  -- Get the device index of an opened joystick.
  function index (joystick : joystick_access_t) return c.int;
  pragma import (c, index, "SDL_JoystickIndex");

  -- Gets joystick name.
  function name (device_index : c.int) return cs.chars_ptr;
  pragma import (c, name, "SDL_JoystickName");

  -- Counts available joysticks.
  function numjoysticks return c.int;
  function num_joysticks return c.int renames numjoysticks;
  pragma import (c, numjoysticks, "SDL_NumJoysticks");

  -- Gets the number of joystick axes
  function numaxes (joystick : joystick_access_t) return c.int;
  function num_axes (joystick : joystick_access_t) return c.int renames numaxes;
  pragma import (c, numaxes, "SDL_JoystickNumAxes");

  -- Gets the number of joystick trackballs
  function numballs (joystick : joystick_access_t) return c.int;
  function num_balls (joystick : joystick_access_t) return c.int renames numballs;
  pragma import (c, numballs, "SDL_JoystickNumBalls");

  -- Gets the number of joystick hats
  function numhats (joystick : joystick_access_t) return c.int;
  function num_hats (joystick : joystick_access_t) return c.int renames numhats;
  pragma import (c, numhats, "SDL_JoystickNumHats");

  -- Gets the number of joystick buttons
  function numbuttons (joystick : joystick_access_t) return c.int;
  function num_buttons (joystick : joystick_access_t) return c.int renames numbuttons;
  pragma import (c, numbuttons, "SDL_JoystickNumButtons");

  -- Opens a joystick for use.
  function open (device_index : c.int) return joystick_access_t;
  pragma import (c, open, "SDL_JoystickOpen");

  -- Determines if a joystick has been opened
  function opened (device_index : c.int) return c.int;
  pragma import (c, opened, "SDL_JoystickOpened");

  -- Updates the state of all joysticks.
  procedure update;
  pragma import (c, update, "SDL_JoystickUpdate");

end sdl.joystick;
