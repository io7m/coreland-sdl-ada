with interfaces.C_Streams;
with interfaces.C.strings;

package sdl.rwops is
  package c_streams renames interfaces.C_Streams;
  package cs renames interfaces.C.strings;

  type stdio_file_t is new c_streams.FILEs;
  type rwops_t;
  type rwops_access_t is access all rwops_t;

  type seek_callback_t is access function
   (ctx    : rwops_access_t;
    off    : c.int;
    whence : c.int) return c.int;

  type read_callback_t is access function
   (ctx    : rwops_access_t;
    ptr    : void_ptr_t;
    size   : c.int;
    maxnum : c.int) return c.int;

  type write_callback_t is access function
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int;

  type close_callback_t is access function (ctx : rwops_access_t) return c.int;

  pragma convention (c, seek_callback_t);
  pragma convention (c, read_callback_t);
  pragma convention (c, write_callback_t);
  pragma convention (c, close_callback_t);

  type io_stdio_t is record
    auto_close : c.int;
    fp         : stdio_file_t;
  end record;
  pragma convention (c, io_stdio_t);

  type io_mem_t is record
    base : uint8_ptr_t;
    here : uint8_ptr_t;
    stop : uint8_ptr_t;
  end record;
  pragma convention (c, io_mem_t);

  type io_unknown_t is record
    data : void_ptr_t;
  end record;
  pragma convention (c, io_unknown_t);

  type type_selector is (t_stdio, t_mem, t_unknown);
  type io_union_t (selector : type_selector := t_stdio) is record
    case selector is
      when t_stdio   => stdio   : io_stdio_t;
      when t_mem     => mem     : io_mem_t;
      when t_unknown => unknown : io_unknown_t;
    end case;
  end record;
  pragma convention (c, io_union_t);
  pragma unchecked_union (io_union_t);

  type rwops_t is record
    seek       : seek_callback_t;
    read       : read_callback_t;
    write      : write_callback_t;
    close      : close_callback_t;
    type_union : uint32_t;
    hidden     : io_union_t;
  end record;
  pragma convention (c, rwops_t);

  seek_set : constant c.int := 0;
  seek_cur : constant c.int := 1;
  seek_end : constant c.int := 2;

  function rwfromfile
   (file : cs.chars_ptr;
    mode : cs.chars_ptr) return rwops_access_t;
  function rw_from_file
   (file : cs.chars_ptr;
    mode : cs.chars_ptr) return rwops_access_t renames rwfromfile;
  pragma import (c, rwfromfile, "SDL_RWFromFile");

  function rwfromfile
   (file : string;
    mode : string) return rwops_access_t;
  function rw_from_file
   (file : string;
    mode : string) return rwops_access_t renames rwfromfile;
  pragma inline (rwfromfile);

  function rwfromfp
   (file       : stdio_file_t;
    auto_close : c.int) return rwops_access_t;
  function rw_from_fp
   (file       : stdio_file_t;
    auto_close : c.int) return rwops_access_t renames rwfromfp;
  pragma import (c, rwfromfp, "SDL_RWFromFP");

  function rwfrommem
   (mem  : void_ptr_t;
    size : c.int) return rwops_access_t;
  function rw_from_mem
   (mem  : void_ptr_t;
    size : c.int) return rwops_access_t renames rwfrommem;
  pragma import (c, rwfrommem, "SDL_RWFromMem");

  function allocrw return rwops_access_t;
  function alloc_rw return rwops_access_t renames allocrw;
  pragma import (c, allocrw, "SDL_AllocRW");

  procedure freerw (area : rwops_access_t);
  procedure free_rw (area : rwops_access_t) renames freerw;
  pragma import (c, freerw, "SDL_FreeRW");

  function rwseek
   (ctx    : rwops_access_t;
    offset : c.int;
    whence : c.int) return c.int;
  function rw_seek
   (ctx    : rwops_access_t;
    offset : c.int;
    whence : c.int) return c.int renames rwseek;
  pragma inline (rwseek);

  function rwtell (ctx : rwops_access_t) return c.int;
  function rw_tell (ctx : rwops_access_t) return c.int renames rwtell;
  pragma inline (rwtell);

  function rwread
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int;
  function rw_read
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int renames rwread;
  pragma inline (rwread);

  function rwwrite
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int;
  function rw_write
   (ctx  : rwops_access_t;
    ptr  : void_ptr_t;
    size : c.int;
    num  : c.int) return c.int renames rwwrite;
  pragma inline (rwwrite);

  function rwclose (ctx : rwops_access_t) return c.int;
  function rw_close (ctx : rwops_access_t) return c.int renames rwclose;
  pragma inline (rwclose);

end sdl.rwops;
