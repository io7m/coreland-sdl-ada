package body SDL.rwops is

  function RWclose (ctx: rwops_ptr) return c.int is
  begin
     return ctx.close (ctx);
  end RWclose;

  function RWread (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int) return c.int is
  begin
     return ctx.read (ctx, ptr, size, num);
  end RWread;

  function RWSeek (ctx: rwops_ptr; offset, whence: c.int) return c.int is
  begin
     return ctx.seek (ctx, offset, whence);
  end RWSeek;

  function RWtell (ctx: rwops_ptr) return c.int is
  begin
     return ctx.seek (ctx, 0, c.int (c_streams.seek_cur));
  end RWtell;

  function RWwrite (ctx: rwops_ptr; ptr: void_ptr; size, num: c.int) return c.int is
  begin
     return ctx.write (ctx, ptr, size, num);
  end RWwrite;

  function RWFromFile (file: string; mode: string) return rwops_ptr is
  begin
     return RWFromFile (cs.new_string (file), cs.new_string (mode));
  end RWFromFile;

end SDL.rwops;
