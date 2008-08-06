with interfaces.c_streams;
with interfaces.c.strings;

package SDL.rwops is
  package c_streams renames interfaces.c_streams;
  package cs renames interfaces.c.strings;

  type stdio_file_t is new c_streams.files;
  type rwops_t;
  type rwops_ptr_t is access all rwops_t;

  type seek_callback_t is
    access function (ctx : rwops_ptr_t; off, whence : c.int)
     return c.int;
  type read_callback_t is
    access function (ctx : rwops_ptr_t; ptr : void_ptr_t; size, maxnum : c.int)
      return c.int;
  type write_callback_t is
    access function (ctx : rwops_ptr_t; ptr : void_ptr_t; size, num : c.int)
      return c.int;
  type close_callback_t is
    access function (ctx : rwops_ptr_t) return c.int;
 
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
    base : uint8_ptr;
    here : uint8_ptr;
    stop : Uint8_ptr;
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
  pragma Unchecked_Union (io_union_t);

  type rwops_t is record
    seek       : seek_callback_t;
    read       : read_callback_t;
    write      : write_callback_t;
    close      : close_callback_t;
    type_union : uint32;
    hidden     : io_union_t;
  end record;
  pragma convention (c, rwops_t);
  
  SEEK_SET : constant c.int := 0;
  SEEK_CUR : constant c.int := 1;
  SEEK_END : constant c.int := 2;

  function RWFromFile (file : cs.chars_ptr; mode : cs.chars_ptr) return rwops_ptr_t;
  function rw_from_file (file : cs.chars_ptr; mode : cs.chars_ptr)
    return rwops_ptr_t renames RWFromFile;
  pragma import (c, RWFromFile, "SDL_RWFromFile");

  function RWFromFile (file : string; mode : string) return rwops_ptr_t;
  function rw_from_file (file : string; mode : string)
    return rwops_ptr_t renames RWFromFile;
  pragma inline (RWFromFile);

  function RWFromFP (file : stdio_file_t; auto_close : c.int) return rwops_ptr_t;
  function rw_From_fp (file : stdio_file_t; auto_close : c.int) return rwops_ptr_t renames RWFromFP;
  pragma import (c, RWFromFP, "SDL_RWFromFP");

  function RWFrommem (mem : void_ptr_t; size : c.int) return rwops_ptr_t;
  function rw_from_mem (mem : void_ptr_t; size : c.int) return rwops_ptr_t renames RWFrommem;
  pragma import (c, RWFromMem, "SDL_RWFromMem");

  function AllocRW return rwops_ptr_t;
  function alloc_rw return rwops_ptr_t renames AllocRW;
  pragma import (c, AllocRW, "SDL_AllocRW");

  procedure FreeRW (area : rwops_ptr_t);
  procedure free_rw (area : rwops_ptr_t) renames FreeRW;
  pragma import (c, FreeRW, "SDL_FreeRW");

  function RWSeek (ctx : rwops_ptr_t; offset : c.int; whence : c.int) return c.int;
  function rw_seek (ctx : rwops_ptr_t; offset : c.int; whence : c.int)
    return c.int renames RWSeek;
  pragma inline (RWSeek);

  function RWtell (ctx : rwops_ptr_t) return c.int;
  function rw_tell (ctx : rwops_ptr_t) return c.int renames RWtell;
  pragma inline (RWtell);

  function RWread (ctx : rwops_ptr_t; ptr : void_ptr_t; size, num : c.int) return c.int;
  function rw_read (ctx : rwops_ptr_t; ptr : void_ptr_t; size, num : c.int)
    return c.int renames RWRead;
  pragma inline (RWread);

  function RWwrite (ctx : rwops_ptr_t; ptr : void_ptr_t; size, num : c.int) return c.int;
  function rw_write (ctx : rwops_ptr_t; ptr : void_ptr_t; size, num : c.int)
    return c.int renames RWwrite;
  pragma inline (RWwrite);

  function RWclose (ctx : rwops_ptr_t) return c.int;
  function rw_close (ctx : rwops_ptr_t) return c.int renames RWclose;
  pragma inline (RWclose);

end SDL.rwops;
