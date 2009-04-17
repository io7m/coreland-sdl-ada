#!/bin/sh
# auto generated, do not edit

size_ada=`./ada_size "SDL.Video.Video_Info_Access_t"`
if [ $? -ne 0 ]; then exit 2; fi
size_c=`./c_size "struct SDL_VideoInfo *"`
if [ $? -ne 0 ]; then exit 2; fi

printf "%8d %8d %s -> %s\n" "${size_ada}" "${size_c}" "SDL.Video.Video_Info_Access_t" "struct SDL_VideoInfo *"

if [ ${size_ada} -ne ${size_c} ]
then
  echo "error: size mismatch" 1>&2
  exit 1
fi
