" ~/.config/nvim/syntax/jnlisp.vim

if exists("b:current_syntax")
  finish
endif

" Load markdown as base
runtime! syntax/markdown.vim
unlet! b:current_syntax

" Load clojure into a cluster
syntax include @clojure syntax/clojure.vim

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
    \ start=/j(/
    \ end=/\n\s*\n/
    \ end=/\%$/
    \ contains=jnlispQuasiquote,jnlispClose,@clojure
    \ containedin=ALL
    \ keepend

syntax sync fromstart

hi def link jnlispDelimiter Special

let b:current_syntax = "jnlisp"
