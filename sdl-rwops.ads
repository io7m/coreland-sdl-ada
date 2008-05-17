with interfaces.c_streams;
with interfaces.c.strings;

package SDL.rwops is
  package c_streams renames interfaces.c_streams;
  package cs renames interfaces.c.strings;

  type stdio_file is new c_streams.files;
  type rwops;
  type rwops_ptr is access all rwops;

  type seek_callback is
    access function (ctx: rwops_ptr; off, whence: c.int)
     return c.int;
  type read_callback is
    access function (ctx: rwops_ptr; ptr: void_ptr; size, maxnum: c.int)
      return c.int;
  type write_callback is
    access function (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int)
      return c.int;
  type close_callback is
    access function (ctx: rwops_ptr) return c.int;
 
  pragma convention (c, seek_callback);
  pragma convention (c, read_callback);
  pragma convention (c, write_callback);
  pragma convention (c, close_callback);

  type io_stdio is record
    autoclose: c.int;
           fp: stdio_file;
  end record;
  pragma convention (c, io_stdio);

  type io_mem is record
    base: uint8_ptr;
    here: uint8_ptr;
    stop: Uint8_ptr;
  end record;
  pragma convention (c, io_mem);

  type io_unknown is record
    data: void_ptr;
  end record;
  pragma convention (c, io_unknown);

  type type_selector is (t_stdio, t_mem, t_unknown);
  type io_union (selector : type_selector := t_stdio) is record
    case selector is
      when t_stdio   =>   stdio: io_stdio;
      when t_mem     =>     mem: io_mem;
      when t_unknown => unknown: io_unknown;
    end case;
  end record;
  pragma convention (c, io_union);
  pragma Unchecked_Union (io_union);

  type rwops is record
          seek: seek_callback;
          read: read_callback;
         write: write_callback;
         close: close_callback;
    type_union: uint32;
        hidden: io_union;
  end record;
  
  function RWFromFile (file: cs.chars_ptr; mode: cs.chars_ptr) return rwops_ptr;
  function rw_from_file (file: cs.chars_ptr; mode: cs.chars_ptr)
    return rwops_ptr renames RWFromFile;
  pragma import (c, RWFromFile, "SDL_RWFromFile");

  function RWFromFile (file: string; mode: string) return rwops_ptr;
  function rw_from_file (file: string; mode: string)
    return rwops_ptr renames RWFromFile;
  pragma inline (RWFromFile);

  function RWFromFP (file: stdio_file; autoclose: c.int) return rwops_ptr;
  function rw_From_fp (file: stdio_file; autoclose: c.int) return rwops_ptr;
  pragma import (c, RWFromFP, "SDL_RWFromFP");
  pragma import (c, rw_from_fp, "SDL_RWFromFP");

  function RWFrommem (mem: void_ptr; size: c.int) return rwops_ptr;
  function rw_from_mem (mem: void_ptr; size: c.int) return rwops_ptr;
  pragma import (c, RWFromMem, "SDL_RWFromMem");
  pragma import (c, rw_from_mem, "SDL_RWFromMem");

  function AllocRW return rwops_ptr;
  function alloc_rw return rwops_ptr;
  pragma import (c, AllocRW, "SDL_AllocRW");
  pragma import (c, alloc_rw, "SDL_AllocRW");

  procedure FreeRW (area: rwops_ptr);
  procedure free_rw (area: rwops_ptr);
  pragma import (c, FreeRW, "SDL_FreeRW");
  pragma import (c, free_rw, "SDL_FreeRW");

  function RWSeek (ctx: rwops_ptr; offset: c.int; whence: c.int) return c.int;
  function rw_seek (ctx: rwops_ptr; offset: c.int; whence: c.int)
    return c.int renames RWSeek;
  pragma inline (RWSeek);

  function RWtell (ctx: rwops_ptr) return c.int;
  function rw_tell (ctx: rwops_ptr) return c.int renames RWtell;
  pragma inline (RWtell);

  function RWread (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int) return c.int;
  function rw_read (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int)
    return c.int renames RWRead;
  pragma inline (RWread);

  function RWwrite (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int) return c.int;
  function rw_write (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int)
    return c.int renames RWwrite;
  pragma inline (RWwrite);

  function RWclose (ctx: rwops_ptr) return c.int;
  function rw_close (ctx: rwops_ptr) return c.int renames RWclose;
  pragma inline (RWclose);

end SDL.rwops;
