package body SDL.rwops is

  function RWclose (ctx: rwops_ptr_t) return c.int is
  begin
     return ctx.close (ctx);
  end RWclose;

  function RWread (ctx: rwops_ptr_t; ptr: void_ptr_t; size, num: c.int) return c.int is
  begin
     return ctx.read (ctx, ptr, size, num);
  end RWread;

  function RWSeek (ctx: rwops_ptr_t; offset, whence: c.int) return c.int is
  begin
     return ctx.seek (ctx, offset, whence);
  end RWSeek;

  function RWtell (ctx: rwops_ptr_t) return c.int is
  begin
     return ctx.seek (ctx, 0, c.int (c_streams.seek_cur));
  end RWtell;

  function RWwrite (ctx: rwops_ptr_t; ptr: void_ptr_t; size, num: c.int) return c.int is
  begin
     return ctx.write (ctx, ptr, size, num);
  end RWwrite;

  function RWFromFile (file: string; mode: string) return rwops_ptr_t is
  begin
     return RWFromFile (cs.new_string (file), cs.new_string (mode));
  end RWFromFile;

end SDL.rwops;
