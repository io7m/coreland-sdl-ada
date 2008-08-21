#!/bin/sh
# auto generated, do not edit

size_ada=`./ada_size "sdl.joystick.joystick_ptr_t"`
if [ $? -ne 0 ]; then exit 2; fi
size_c=`./c_size "SDL_Joystick *"`
if [ $? -ne 0 ]; then exit 2; fi

printf "%8d %8d %s -> %s\n" "${size_ada}" "${size_c}" "sdl.joystick.joystick_ptr_t" "SDL_Joystick *"

if [ ${size_ada} -ne ${size_c} ]
then
  echo "error: size mismatch" 1>&2
  exit 1
fi
