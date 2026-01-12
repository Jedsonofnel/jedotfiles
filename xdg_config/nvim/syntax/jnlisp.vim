" ~/.config/nvim/syntax/jnlisp.vim

if exists("b:current_syntax")
  finish
endif

" Load markdown as base
runtime! syntax/markdown.vim
unlet! b:current_syntax

" Load clojure into a cluster
syntax include @clojure syntax/clojure.vim

" j( until double newline
syntax region jnlispForm 
    \ matchgroup=jnlispDelimiter 
    \ start=/j(/
    \ end=/\n\s*\n/
    \ end=/\%$/
    \ contains=jnlispQuasiquote,jnlispClose,jnlispKeyword,jnlispNumber,@clojure
    \ keepend

" Explicitly define keywords (this overrides/supplements clojure's)
syntax match jnlispKeyword /:[[:alnum:]\-_?!+*\/=<>.']\+/ contained containedin=jnlispForm
hi def link jnlispKeyword clojureKeyword

" Explicitly define numbers including floats
syntax match jnlispNumber /\v<-?\d+\.?\d*([eE][+-]?\d+)?/ contained containedin=jnlispForm
syntax match jnlispNumber /\v<-?\.\d+([eE][+-]?\d+)?/ contained containedin=jnlispForm
hi def link jnlispNumber clojureNumber

" Capture backticks before markdown can
syntax match jnlispQuasiquote /`/ contained containedin=jnlispForm
hi def link jnlispQuasiquote clojureQuote

" Capture trailing close paren(s) before clojure complains
syntax match jnlispClose /)\+\ze\n\n/ contained containedin=jnlispForm
syntax match jnlispClose /)\+\ze\%$/ contained containedin=jnlispForm
hi def link jnlispClose clojureParen

" j( until double newline
syntax region jnlispForm 
    \ matchgroup=jnlispDelimiter 
    \ start=/>(/
    \ end=/\n\s*\n/
    \ end=/\%$/
    \ contains=jnlispQuasiquote,jnlispClose,@clojure
    \ containedin=ALL
    \ keepend

syntax sync fromstart
hi def link jnlispDelimiter Special

let b:current_syntax = "jnlisp"
