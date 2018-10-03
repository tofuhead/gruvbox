" -----------------------------------------------------------------------------
" File: gruvboxdarker.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvboxdarker
" Last Modified: 09 Apr 2014
" -----------------------------------------------------------------------------

function! gruvboxdarkerdarker#invert_signs_toggle()
  if g:gruvboxdarkerdarker_invert_signs == 0
    let g:gruvboxdarkerdarker_invert_signs=1
  else
    let g:gruvboxdarkerdarker_invert_signs=0
  endif

  colorscheme gruvboxdarkerdarker
endfunction

" Search Highlighting {{{

function! gruvboxdarkerdarker#hls_show()
  set hlsearch
  call gruvboxdarkerdarkerHlsShowCursor()
endfunction

function! gruvboxdarkerdarker#hls_hide()
  set nohlsearch
  call gruvboxdarkerdarkerHlsHideCursor()
endfunction

function! gruvboxdarkerdarker#hls_toggle()
  if &hlsearch
    call gruvboxdarkerdarker#hls_hide()
  else
    call gruvboxdarker#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
