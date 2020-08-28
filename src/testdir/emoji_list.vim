" Script to fill the window with emoji characters, one per line.

if &modified
  new
else
  enew
endif

" Use a compiled Vim9 function for speed
def DoIt()
  let lnum = 1
  for c in range(0x100, 0x1ffff)
    let cs = nr2char(c)
    if charclass(cs) == 3
      setline(lnum, '|' .. cs .. '| ' .. strwidth(cs))
      lnum += 1
    endif
  endfor
enddef

call DoIt()
set nomodified