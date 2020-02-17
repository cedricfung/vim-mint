if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'mint'
endif

" Match TODO comments
syntax keyword mintTodos TODO XXX FIXME NOTE

" Match language specific keywords
syntax keyword mintKeywords global state encode decode for module provider suite test parallel sequence case try catch next with component property fun routes get connect exposing record store use when if else where enum

syntax match   mintNumber           /\c\<\%(\d\+\%(e[+-]\=\d\+\)\=\|0b[01]\+\|0o\o\+\|0x\x\+\)\>/

syntax region  mintString           start=+\z(["']\)+  skip=+\\\%(\z1\|$\)+  end=+\z1+ end=+$+ extend

syntax region  mintComment        start=+//+ end=/$/ extend keepend
syntax region  mintComment        start=+/\*+  end=+\*/+ fold extend keepend
syntax match   mintOperator       "[-!|&+<>=%/*~^]" skipwhite skipempty

" Set highlights
highlight default link mintTodos Todo
highlight default link mintComment Comment

highlight default link mintString String
highlight default link mintNumber Number

highlight default link mintOperator Operator
highlight default link mintKeywords Keyword
