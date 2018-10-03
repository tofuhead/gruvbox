" -----------------------------------------------------------------------------
" File: gruvboxdarker.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvboxdarker
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='gruvboxdarkerdarker'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:gruvboxdarkerdarker_bold')
  let g:gruvboxdarkerdarker_bold=1
endif
if !exists('g:gruvboxdarkerdarker_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:gruvboxdarkerdarker_italic=1
  else
    let g:gruvboxdarkerdarker_italic=0
  endif
endif
if !exists('g:gruvboxdarkerdarker_undercurl')
  let g:gruvboxdarkerdarker_undercurl=1
endif
if !exists('g:gruvboxdarkerdarker_underline')
  let g:gruvboxdarker_underline=1
endif
if !exists('g:gruvboxdarker_inverse')
  let g:gruvboxdarker_inverse=1
endif

if !exists('g:gruvboxdarker_guisp_fallback') || index(['fg', 'bg'], g:gruvboxdarker_guisp_fallback) == -1
  let g:gruvboxdarker_guisp_fallback='NONE'
endif

if !exists('g:gruvboxdarker_improved_strings')
  let g:gruvboxdarker_improved_strings=0
endif

if !exists('g:gruvboxdarker_improved_warnings')
  let g:gruvboxdarker_improved_warnings=0
endif

if !exists('g:gruvboxdarker_termcolors')
  let g:gruvboxdarker_termcolors=256
endif

if !exists('g:gruvboxdarker_invert_indent_guides')
  let g:gruvboxdarker_invert_indent_guides=0
endif

if exists('g:gruvboxdarker_contrast')
  echo 'g:gruvboxdarker_contrast is deprecated; use g:gruvboxdarker_contrast_light and g:gruvboxdarker_contrast_dark instead'
endif

if !exists('g:gruvboxdarker_contrast_dark')
  let g:gruvboxdarker_contrast_dark='medium'
endif

if !exists('g:gruvboxdarker_contrast_light')
  let g:gruvboxdarker_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gbd.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gbd.dark0       = ['#1d2021', 234]     " 40-40-40
let s:gbd.dark0_soft  = ['#1d2021', 234]     " 50-48-47
let s:gbd.dark1       = ['#3c3836', 237]     " 60-56-54
let s:gbd.dark2       = ['#504945', 239]     " 80-73-69
let s:gbd.dark3       = ['#665c54', 241]     " 102-92-84
let s:gbd.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:gbd.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gbd.gray_245    = ['#928374', 245]     " 146-131-116
let s:gbd.gray_244    = ['#928374', 244]     " 146-131-116

let s:gbd.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gbd.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:gbd.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gbd.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:gbd.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gbd.light3      = ['#bdae93', 248]     " 189-174-147
let s:gbd.light4      = ['#a89984', 246]     " 168-153-132
let s:gbd.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gbd.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gbd.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gbd.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gbd.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gbd.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gbd.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gbd.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gbd.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gbd.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gbd.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gbd.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gbd.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gbd.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gbd.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gbd.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gbd.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gbd.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gbd.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gbd.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gbd.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gbd.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:gruvboxdarker_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:gruvboxdarker_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:gruvboxdarker_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:gruvboxdarker_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:gruvboxdarker_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gbd.dark0_hard
  if g:gruvboxdarker_contrast_dark == 'soft'
    let s:bg0  = s:gbd.dark0_hard
  elseif g:gruvboxdarker_contrast_dark == 'hard'
    let s:bg0  = s:gbd.dark0_hard
  endif

  let s:bg1  = s:gbd.dark1
  let s:bg2  = s:gbd.dark2
  let s:bg3  = s:gbd.dark3
  let s:bg4  = s:gbd.dark4

  let s:gray = s:gbd.gray_245

  let s:fg0 = s:gbd.light0
  let s:fg1 = s:gbd.light1
  let s:fg2 = s:gbd.light2
  let s:fg3 = s:gbd.light3
  let s:fg4 = s:gbd.light4

  let s:fg4_256 = s:gbd.light4_256

  let s:red    = s:gbd.bright_red
  let s:green  = s:gbd.bright_green
  let s:yellow = s:gbd.bright_yellow
  let s:blue   = s:gbd.bright_blue
  let s:purple = s:gbd.bright_purple
  let s:aqua   = s:gbd.bright_aqua
  let s:orange = s:gbd.bright_orange
else
  let s:bg0  = s:gbd.light0
  if g:gruvboxdarker_contrast_light == 'soft'
    let s:bg0  = s:gbd.light0_soft
  elseif g:gruvboxdarker_contrast_light == 'hard'
    let s:bg0  = s:gbd.light0_hard
  endif

  let s:bg1  = s:gbd.light1
  let s:bg2  = s:gbd.light2
  let s:bg3  = s:gbd.light3
  let s:bg4  = s:gbd.light4

  let s:gray = s:gbd.gray_244

  let s:fg0 = s:gbd.dark0
  let s:fg1 = s:gbd.dark1
  let s:fg2 = s:gbd.dark2
  let s:fg3 = s:gbd.dark3
  let s:fg4 = s:gbd.dark4

  let s:fg4_256 = s:gbd.dark4_256

  let s:red    = s:gbd.faded_red
  let s:green  = s:gbd.faded_green
  let s:yellow = s:gbd.faded_yellow
  let s:blue   = s:gbd.faded_blue
  let s:purple = s:gbd.faded_purple
  let s:aqua   = s:gbd.faded_aqua
  let s:orange = s:gbd.faded_orange
endif

" reset to 16 colors fallback
if g:gruvboxdarker_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gbd.bg0 = s:bg0
let s:gbd.bg1 = s:bg1
let s:gbd.bg2 = s:bg2
let s:gbd.bg3 = s:bg3
let s:gbd.bg4 = s:bg4

let s:gbd.gray = s:gray

let s:gbd.fg0 = s:fg0
let s:gbd.fg1 = s:fg1
let s:gbd.fg2 = s:fg2
let s:gbd.fg3 = s:fg3
let s:gbd.fg4 = s:fg4

let s:gbd.fg4_256 = s:fg4_256

let s:gbd.red    = s:red
let s:gbd.green  = s:green
let s:gbd.yellow = s:yellow
let s:gbd.blue   = s:blue
let s:gbd.purple = s:purple
let s:gbd.aqua   = s:aqua
let s:gbd.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gbd.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gbd.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gbd.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gbd.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gbd.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gbd.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:gruvboxdarker_hls_cursor')
  let s:hls_cursor = get(s:gb, g:gruvboxdarker_hls_cursor)
endif

let s:number_column = s:none
if exists('g:gruvboxdarker_number_column')
  let s:number_column = get(s:gb, g:gruvboxdarker_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:gruvboxdarker_sign_column')
    let s:sign_column = get(s:gb, g:gruvboxdarker_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:gruvboxdarker_color_column')
  let s:color_column = get(s:gb, g:gruvboxdarker_color_column)
endif

let s:vert_split = s:bg0
if exists('g:gruvboxdarker_vert_split')
  let s:vert_split = get(s:gb, g:gruvboxdarker_vert_split)
endif

let s:invert_signs = ''
if exists('g:gruvboxdarker_invert_signs')
  if g:gruvboxdarker_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:gruvboxdarker_invert_selection')
  if g:gruvboxdarker_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:gruvboxdarker_invert_tabline')
  if g:gruvboxdarker_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:gruvboxdarker_italicize_comments')
  if g:gruvboxdarker_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:gruvboxdarker_italicize_strings')
  if g:gruvboxdarker_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvboxdarker_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvboxdarker_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" gruvboxdarker Hi Groups: {{{

" memoize common hi groups
call s:HL('gruvboxdarkerFg0', s:fg0)
call s:HL('gruvboxdarkerFg1', s:fg1)
call s:HL('gruvboxdarkerFg2', s:fg2)
call s:HL('gruvboxdarkerFg3', s:fg3)
call s:HL('gruvboxdarkerFg4', s:fg4)
call s:HL('gruvboxdarkerGray', s:gray)
call s:HL('gruvboxdarkerBg0', s:bg0)
call s:HL('gruvboxdarkerBg1', s:bg1)
call s:HL('gruvboxdarkerBg2', s:bg2)
call s:HL('gruvboxdarkerBg3', s:bg3)
call s:HL('gruvboxdarkerBg4', s:bg4)

call s:HL('gruvboxdarkerRed', s:red)
call s:HL('gruvboxdarkerRedBold', s:red, s:none, s:bold)
call s:HL('gruvboxdarkerGreen', s:green)
call s:HL('gruvboxdarkerGreenBold', s:green, s:none, s:bold)
call s:HL('gruvboxdarkerYellow', s:yellow)
call s:HL('gruvboxdarkerYellowBold', s:yellow, s:none, s:bold)
call s:HL('gruvboxdarkerBlue', s:blue)
call s:HL('gruvboxdarkerBlueBold', s:blue, s:none, s:bold)
call s:HL('gruvboxdarkerPurple', s:purple)
call s:HL('gruvboxdarkerPurpleBold', s:purple, s:none, s:bold)
call s:HL('gruvboxdarkerAqua', s:aqua)
call s:HL('gruvboxdarkerAquaBold', s:aqua, s:none, s:bold)
call s:HL('gruvboxdarkerOrange', s:orange)
call s:HL('gruvboxdarkerOrangeBold', s:orange, s:none, s:bold)

call s:HL('gruvboxdarkerRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('gruvboxdarkerGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('gruvboxdarkerYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('gruvboxdarkerBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('gruvboxdarkerPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('gruvboxdarkerAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvboxdarker/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText gruvboxdarkerBg2
hi! link SpecialKey gruvboxdarkerBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory gruvboxdarkerGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title gruvboxdarkerGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg gruvboxdarkerYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg gruvboxdarkerYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question gruvboxdarkerOrangeBold
" Warning messages
hi! link WarningMsg gruvboxdarkerRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:gruvboxdarker_improved_strings == 0
  hi! link Special gruvboxdarkerOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement gruvboxdarkerRed
" if, then, else, endif, swicth, etc.
hi! link Conditional gruvboxdarkerRed
" for, do, while, etc.
hi! link Repeat gruvboxdarkerRed
" case, default, etc.
hi! link Label gruvboxdarkerRed
" try, catch, throw
hi! link Exception gruvboxdarkerRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword gruvboxdarkerRed

" Variable name
hi! link Identifier gruvboxdarkerBlue
" Function name
hi! link Function gruvboxdarkerGreenBold

" Generic preprocessor
hi! link PreProc gruvboxdarkerAqua
" Preprocessor #include
hi! link Include gruvboxdarkerAqua
" Preprocessor #define
hi! link Define gruvboxdarkerAqua
" Same as Define
hi! link Macro gruvboxdarkerAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit gruvboxdarkerAqua

" Generic constant
hi! link Constant gruvboxdarkerPurple
" Character constant: 'c', '/n'
hi! link Character gruvboxdarkerPurple
" String constant: "this is a string"
if g:gruvboxdarker_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean gruvboxdarkerPurple
" Number constant: 234, 0xff
hi! link Number gruvboxdarkerPurple
" Floating point constant: 2.3e10
hi! link Float gruvboxdarkerPurple

" Generic type
hi! link Type gruvboxdarkerYellow
" static, register, volatile, etc
hi! link StorageClass gruvboxdarkerOrange
" struct, union, enum, etc.
hi! link Structure gruvboxdarkerAqua
" typedef
hi! link Typedef gruvboxdarkerYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:gruvboxdarker_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:gruvboxdarker_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd gruvboxdarkerGreenSign
hi! link GitGutterChange gruvboxdarkerAquaSign
hi! link GitGutterDelete gruvboxdarkerRedSign
hi! link GitGutterChangeDelete gruvboxdarkerAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile gruvboxdarkerGreen
hi! link gitcommitDiscardedFile gruvboxdarkerRed

" }}}
" Signify: {{{

hi! link SignifySignAdd gruvboxdarkerGreenSign
hi! link SignifySignChange gruvboxdarkerAquaSign
hi! link SignifySignDelete gruvboxdarkerRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign gruvboxdarkerRedSign
hi! link SyntasticWarningSign gruvboxdarkerYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   gruvboxdarkerBlueSign
hi! link SignatureMarkerText gruvboxdarkerPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl gruvboxdarkerBlueSign
hi! link ShowMarksHLu gruvboxdarkerBlueSign
hi! link ShowMarksHLo gruvboxdarkerBlueSign
hi! link ShowMarksHLm gruvboxdarkerBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch gruvboxdarkerYellow
hi! link CtrlPNoEntries gruvboxdarkerRed
hi! link CtrlPPrtBase gruvboxdarkerBg2
hi! link CtrlPPrtCursor gruvboxdarkerBlue
hi! link CtrlPLinePre gruvboxdarkerBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket gruvboxdarkerFg3
hi! link StartifyFile gruvboxdarkerFg1
hi! link StartifyNumber gruvboxdarkerBlue
hi! link StartifyPath gruvboxdarkerGray
hi! link StartifySlash gruvboxdarkerGray
hi! link StartifySection gruvboxdarkerYellow
hi! link StartifySpecial gruvboxdarkerBg2
hi! link StartifyHeader gruvboxdarkerOrange
hi! link StartifyFooter gruvboxdarkerBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign gruvboxdarkerRedSign
hi! link ALEWarningSign gruvboxdarkerYellowSign
hi! link ALEInfoSign gruvboxdarkerBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail gruvboxdarkerAqua
hi! link DirvishArg gruvboxdarkerYellow

" }}}
" Netrw: {{{

hi! link netrwDir gruvboxdarkerAqua
hi! link netrwClassify gruvboxdarkerAqua
hi! link netrwLink gruvboxdarkerGray
hi! link netrwSymLink gruvboxdarkerFg1
hi! link netrwExe gruvboxdarkerYellow
hi! link netrwComment gruvboxdarkerGray
hi! link netrwList gruvboxdarkerBlue
hi! link netrwHelpCmd gruvboxdarkerAqua
hi! link netrwCmdSep gruvboxdarkerFg3
hi! link netrwVersion gruvboxdarkerGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir gruvboxdarkerAqua
hi! link NERDTreeDirSlash gruvboxdarkerAqua

hi! link NERDTreeOpenable gruvboxdarkerOrange
hi! link NERDTreeClosable gruvboxdarkerOrange

hi! link NERDTreeFile gruvboxdarkerFg1
hi! link NERDTreeExecFile gruvboxdarkerYellow

hi! link NERDTreeUp gruvboxdarkerGray
hi! link NERDTreeCWD gruvboxdarkerGreen
hi! link NERDTreeHelp gruvboxdarkerFg1

hi! link NERDTreeToggleOn gruvboxdarkerGreen
hi! link NERDTreeToggleOff gruvboxdarkerRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded gruvboxdarkerGreen
hi! link diffRemoved gruvboxdarkerRed
hi! link diffChanged gruvboxdarkerAqua

hi! link diffFile gruvboxdarkerOrange
hi! link diffNewFile gruvboxdarkerYellow

hi! link diffLine gruvboxdarkerBlue

" }}}
" Html: {{{

hi! link htmlTag gruvboxdarkerBlue
hi! link htmlEndTag gruvboxdarkerBlue

hi! link htmlTagName gruvboxdarkerAquaBold
hi! link htmlArg gruvboxdarkerAqua

hi! link htmlScriptTag gruvboxdarkerPurple
hi! link htmlTagN gruvboxdarkerFg1
hi! link htmlSpecialTagName gruvboxdarkerAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar gruvboxdarkerOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag gruvboxdarkerBlue
hi! link xmlEndTag gruvboxdarkerBlue
hi! link xmlTagName gruvboxdarkerBlue
hi! link xmlEqual gruvboxdarkerBlue
hi! link docbkKeyword gruvboxdarkerAquaBold

hi! link xmlDocTypeDecl gruvboxdarkerGray
hi! link xmlDocTypeKeyword gruvboxdarkerPurple
hi! link xmlCdataStart gruvboxdarkerGray
hi! link xmlCdataCdata gruvboxdarkerPurple
hi! link dtdFunction gruvboxdarkerGray
hi! link dtdTagName gruvboxdarkerPurple

hi! link xmlAttrib gruvboxdarkerAqua
hi! link xmlProcessingDelim gruvboxdarkerGray
hi! link dtdParamEntityPunct gruvboxdarkerGray
hi! link dtdParamEntityDPunct gruvboxdarkerGray
hi! link xmlAttribPunct gruvboxdarkerGray

hi! link xmlEntity gruvboxdarkerOrange
hi! link xmlEntityPunct gruvboxdarkerOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation gruvboxdarkerOrange
hi! link vimBracket gruvboxdarkerOrange
hi! link vimMapModKey gruvboxdarkerOrange
hi! link vimFuncSID gruvboxdarkerFg3
hi! link vimSetSep gruvboxdarkerFg3
hi! link vimSep gruvboxdarkerFg3
hi! link vimContinue gruvboxdarkerFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword gruvboxdarkerBlue
hi! link clojureCond gruvboxdarkerOrange
hi! link clojureSpecial gruvboxdarkerOrange
hi! link clojureDefine gruvboxdarkerOrange

hi! link clojureFunc gruvboxdarkerYellow
hi! link clojureRepeat gruvboxdarkerYellow
hi! link clojureCharacter gruvboxdarkerAqua
hi! link clojureStringEscape gruvboxdarkerAqua
hi! link clojureException gruvboxdarkerRed

hi! link clojureRegexp gruvboxdarkerAqua
hi! link clojureRegexpEscape gruvboxdarkerAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen gruvboxdarkerFg3
hi! link clojureAnonArg gruvboxdarkerYellow
hi! link clojureVariable gruvboxdarkerBlue
hi! link clojureMacro gruvboxdarkerOrange

hi! link clojureMeta gruvboxdarkerYellow
hi! link clojureDeref gruvboxdarkerYellow
hi! link clojureQuote gruvboxdarkerYellow
hi! link clojureUnquote gruvboxdarkerYellow

" }}}
" C: {{{

hi! link cOperator gruvboxdarkerPurple
hi! link cStructure gruvboxdarkerOrange

" }}}
" Python: {{{

hi! link pythonBuiltin gruvboxdarkerOrange
hi! link pythonBuiltinObj gruvboxdarkerOrange
hi! link pythonBuiltinFunc gruvboxdarkerOrange
hi! link pythonFunction gruvboxdarkerAqua
hi! link pythonDecorator gruvboxdarkerRed
hi! link pythonInclude gruvboxdarkerBlue
hi! link pythonImport gruvboxdarkerBlue
hi! link pythonRun gruvboxdarkerBlue
hi! link pythonCoding gruvboxdarkerBlue
hi! link pythonOperator gruvboxdarkerRed
hi! link pythonException gruvboxdarkerRed
hi! link pythonExceptions gruvboxdarkerPurple
hi! link pythonBoolean gruvboxdarkerPurple
hi! link pythonDot gruvboxdarkerFg3
hi! link pythonConditional gruvboxdarkerRed
hi! link pythonRepeat gruvboxdarkerRed
hi! link pythonDottedName gruvboxdarkerGreenBold

" }}}
" CSS: {{{

hi! link cssBraces gruvboxdarkerBlue
hi! link cssFunctionName gruvboxdarkerYellow
hi! link cssIdentifier gruvboxdarkerOrange
hi! link cssClassName gruvboxdarkerGreen
hi! link cssColor gruvboxdarkerBlue
hi! link cssSelectorOp gruvboxdarkerBlue
hi! link cssSelectorOp2 gruvboxdarkerBlue
hi! link cssImportant gruvboxdarkerGreen
hi! link cssVendor gruvboxdarkerFg1

hi! link cssTextProp gruvboxdarkerAqua
hi! link cssAnimationProp gruvboxdarkerAqua
hi! link cssUIProp gruvboxdarkerYellow
hi! link cssTransformProp gruvboxdarkerAqua
hi! link cssTransitionProp gruvboxdarkerAqua
hi! link cssPrintProp gruvboxdarkerAqua
hi! link cssPositioningProp gruvboxdarkerYellow
hi! link cssBoxProp gruvboxdarkerAqua
hi! link cssFontDescriptorProp gruvboxdarkerAqua
hi! link cssFlexibleBoxProp gruvboxdarkerAqua
hi! link cssBorderOutlineProp gruvboxdarkerAqua
hi! link cssBackgroundProp gruvboxdarkerAqua
hi! link cssMarginProp gruvboxdarkerAqua
hi! link cssListProp gruvboxdarkerAqua
hi! link cssTableProp gruvboxdarkerAqua
hi! link cssFontProp gruvboxdarkerAqua
hi! link cssPaddingProp gruvboxdarkerAqua
hi! link cssDimensionProp gruvboxdarkerAqua
hi! link cssRenderProp gruvboxdarkerAqua
hi! link cssColorProp gruvboxdarkerAqua
hi! link cssGeneratedContentProp gruvboxdarkerAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces gruvboxdarkerFg1
hi! link javaScriptFunction gruvboxdarkerAqua
hi! link javaScriptIdentifier gruvboxdarkerRed
hi! link javaScriptMember gruvboxdarkerBlue
hi! link javaScriptNumber gruvboxdarkerPurple
hi! link javaScriptNull gruvboxdarkerPurple
hi! link javaScriptParens gruvboxdarkerFg3

" }}}
" YAJS: {{{

hi! link javascriptImport gruvboxdarkerAqua
hi! link javascriptExport gruvboxdarkerAqua
hi! link javascriptClassKeyword gruvboxdarkerAqua
hi! link javascriptClassExtends gruvboxdarkerAqua
hi! link javascriptDefault gruvboxdarkerAqua

hi! link javascriptClassName gruvboxdarkerYellow
hi! link javascriptClassSuperName gruvboxdarkerYellow
hi! link javascriptGlobal gruvboxdarkerYellow

hi! link javascriptEndColons gruvboxdarkerFg1
hi! link javascriptFuncArg gruvboxdarkerFg1
hi! link javascriptGlobalMethod gruvboxdarkerFg1
hi! link javascriptNodeGlobal gruvboxdarkerFg1
hi! link javascriptBOMWindowProp gruvboxdarkerFg1
hi! link javascriptArrayMethod gruvboxdarkerFg1
hi! link javascriptArrayStaticMethod gruvboxdarkerFg1
hi! link javascriptCacheMethod gruvboxdarkerFg1
hi! link javascriptDateMethod gruvboxdarkerFg1
hi! link javascriptMathStaticMethod gruvboxdarkerFg1

" hi! link javascriptProp gruvboxdarkerFg1
hi! link javascriptURLUtilsProp gruvboxdarkerFg1
hi! link javascriptBOMNavigatorProp gruvboxdarkerFg1
hi! link javascriptDOMDocMethod gruvboxdarkerFg1
hi! link javascriptDOMDocProp gruvboxdarkerFg1
hi! link javascriptBOMLocationMethod gruvboxdarkerFg1
hi! link javascriptBOMWindowMethod gruvboxdarkerFg1
hi! link javascriptStringMethod gruvboxdarkerFg1

hi! link javascriptVariable gruvboxdarkerOrange
" hi! link javascriptVariable gruvboxdarkerRed
" hi! link javascriptIdentifier gruvboxdarkerOrange
" hi! link javascriptClassSuper gruvboxdarkerOrange
hi! link javascriptIdentifier gruvboxdarkerOrange
hi! link javascriptClassSuper gruvboxdarkerOrange

" hi! link javascriptFuncKeyword gruvboxdarkerOrange
" hi! link javascriptAsyncFunc gruvboxdarkerOrange
hi! link javascriptFuncKeyword gruvboxdarkerAqua
hi! link javascriptAsyncFunc gruvboxdarkerAqua
hi! link javascriptClassStatic gruvboxdarkerOrange

hi! link javascriptOperator gruvboxdarkerRed
hi! link javascriptForOperator gruvboxdarkerRed
hi! link javascriptYield gruvboxdarkerRed
hi! link javascriptExceptions gruvboxdarkerRed
hi! link javascriptMessage gruvboxdarkerRed

hi! link javascriptTemplateSB gruvboxdarkerAqua
hi! link javascriptTemplateSubstitution gruvboxdarkerFg1

" hi! link javascriptLabel gruvboxdarkerBlue
" hi! link javascriptObjectLabel gruvboxdarkerBlue
" hi! link javascriptPropertyName gruvboxdarkerBlue
hi! link javascriptLabel gruvboxdarkerFg1
hi! link javascriptObjectLabel gruvboxdarkerFg1
hi! link javascriptPropertyName gruvboxdarkerFg1

hi! link javascriptLogicSymbols gruvboxdarkerFg1
hi! link javascriptArrowFunc gruvboxdarkerYellow

hi! link javascriptDocParamName gruvboxdarkerFg4
hi! link javascriptDocTags gruvboxdarkerFg4
hi! link javascriptDocNotation gruvboxdarkerFg4
hi! link javascriptDocParamType gruvboxdarkerFg4
hi! link javascriptDocNamedParamType gruvboxdarkerFg4

hi! link javascriptBrackets gruvboxdarkerFg1
hi! link javascriptDOMElemAttrs gruvboxdarkerFg1
hi! link javascriptDOMEventMethod gruvboxdarkerFg1
hi! link javascriptDOMNodeMethod gruvboxdarkerFg1
hi! link javascriptDOMStorageMethod gruvboxdarkerFg1
hi! link javascriptHeadersMethod gruvboxdarkerFg1

hi! link javascriptAsyncFuncKeyword gruvboxdarkerRed
hi! link javascriptAwaitFuncKeyword gruvboxdarkerRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword gruvboxdarkerAqua
hi! link jsExtendsKeyword gruvboxdarkerAqua
hi! link jsExportDefault gruvboxdarkerAqua
hi! link jsTemplateBraces gruvboxdarkerAqua
hi! link jsGlobalNodeObjects gruvboxdarkerFg1
hi! link jsGlobalObjects gruvboxdarkerFg1
hi! link jsFunction gruvboxdarkerAqua
hi! link jsFuncParens gruvboxdarkerFg3
hi! link jsParens gruvboxdarkerFg3
hi! link jsNull gruvboxdarkerPurple
hi! link jsUndefined gruvboxdarkerPurple
hi! link jsClassDefinition gruvboxdarkerYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved gruvboxdarkerAqua
hi! link typeScriptLabel gruvboxdarkerAqua
hi! link typeScriptFuncKeyword gruvboxdarkerAqua
hi! link typeScriptIdentifier gruvboxdarkerOrange
hi! link typeScriptBraces gruvboxdarkerFg1
hi! link typeScriptEndColons gruvboxdarkerFg1
hi! link typeScriptDOMObjects gruvboxdarkerFg1
hi! link typeScriptAjaxMethods gruvboxdarkerFg1
hi! link typeScriptLogicSymbols gruvboxdarkerFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects gruvboxdarkerFg1
hi! link typeScriptParens gruvboxdarkerFg3
hi! link typeScriptOpSymbols gruvboxdarkerFg3
hi! link typeScriptHtmlElemProperties gruvboxdarkerFg1
hi! link typeScriptNull gruvboxdarkerPurple
hi! link typeScriptInterpolationDelimiter gruvboxdarkerAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword gruvboxdarkerAqua
hi! link purescriptModuleName gruvboxdarkerFg1
hi! link purescriptWhere gruvboxdarkerAqua
hi! link purescriptDelimiter gruvboxdarkerFg4
hi! link purescriptType gruvboxdarkerFg1
hi! link purescriptImportKeyword gruvboxdarkerAqua
hi! link purescriptHidingKeyword gruvboxdarkerAqua
hi! link purescriptAsKeyword gruvboxdarkerAqua
hi! link purescriptStructure gruvboxdarkerAqua
hi! link purescriptOperator gruvboxdarkerBlue

hi! link purescriptTypeVar gruvboxdarkerFg1
hi! link purescriptConstructor gruvboxdarkerFg1
hi! link purescriptFunction gruvboxdarkerFg1
hi! link purescriptConditional gruvboxdarkerOrange
hi! link purescriptBacktick gruvboxdarkerOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp gruvboxdarkerFg3
hi! link coffeeSpecialOp gruvboxdarkerFg3
hi! link coffeeCurly gruvboxdarkerOrange
hi! link coffeeParen gruvboxdarkerFg3
hi! link coffeeBracket gruvboxdarkerOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter gruvboxdarkerGreen
hi! link rubyInterpolationDelimiter gruvboxdarkerAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier gruvboxdarkerRed
hi! link objcDirective gruvboxdarkerBlue

" }}}
" Go: {{{

hi! link goDirective gruvboxdarkerAqua
hi! link goConstants gruvboxdarkerPurple
hi! link goDeclaration gruvboxdarkerRed
hi! link goDeclType gruvboxdarkerBlue
hi! link goBuiltins gruvboxdarkerOrange

" }}}
" Lua: {{{

hi! link luaIn gruvboxdarkerRed
hi! link luaFunction gruvboxdarkerAqua
hi! link luaTable gruvboxdarkerOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp gruvboxdarkerFg3
hi! link moonExtendedOp gruvboxdarkerFg3
hi! link moonFunction gruvboxdarkerFg3
hi! link moonObject gruvboxdarkerYellow

" }}}
" Java: {{{

hi! link javaAnnotation gruvboxdarkerBlue
hi! link javaDocTags gruvboxdarkerAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen gruvboxdarkerFg3
hi! link javaParen1 gruvboxdarkerFg3
hi! link javaParen2 gruvboxdarkerFg3
hi! link javaParen3 gruvboxdarkerFg3
hi! link javaParen4 gruvboxdarkerFg3
hi! link javaParen5 gruvboxdarkerFg3
hi! link javaOperator gruvboxdarkerOrange

hi! link javaVarArg gruvboxdarkerGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter gruvboxdarkerGreen
hi! link elixirInterpolationDelimiter gruvboxdarkerAqua

hi! link elixirModuleDeclaration gruvboxdarkerYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition gruvboxdarkerFg1
hi! link scalaCaseFollowing gruvboxdarkerFg1
hi! link scalaCapitalWord gruvboxdarkerFg1
hi! link scalaTypeExtension gruvboxdarkerFg1

hi! link scalaKeyword gruvboxdarkerRed
hi! link scalaKeywordModifier gruvboxdarkerRed

hi! link scalaSpecial gruvboxdarkerAqua
hi! link scalaOperator gruvboxdarkerFg1

hi! link scalaTypeDeclaration gruvboxdarkerYellow
hi! link scalaTypeTypePostDeclaration gruvboxdarkerYellow

hi! link scalaInstanceDeclaration gruvboxdarkerFg1
hi! link scalaInterpolation gruvboxdarkerAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 gruvboxdarkerGreenBold
hi! link markdownH2 gruvboxdarkerGreenBold
hi! link markdownH3 gruvboxdarkerYellowBold
hi! link markdownH4 gruvboxdarkerYellowBold
hi! link markdownH5 gruvboxdarkerYellow
hi! link markdownH6 gruvboxdarkerYellow

hi! link markdownCode gruvboxdarkerAqua
hi! link markdownCodeBlock gruvboxdarkerAqua
hi! link markdownCodeDelimiter gruvboxdarkerAqua

hi! link markdownBlockquote gruvboxdarkerGray
hi! link markdownListMarker gruvboxdarkerGray
hi! link markdownOrderedListMarker gruvboxdarkerGray
hi! link markdownRule gruvboxdarkerGray
hi! link markdownHeadingRule gruvboxdarkerGray

hi! link markdownUrlDelimiter gruvboxdarkerFg3
hi! link markdownLinkDelimiter gruvboxdarkerFg3
hi! link markdownLinkTextDelimiter gruvboxdarkerFg3

hi! link markdownHeadingDelimiter gruvboxdarkerOrange
hi! link markdownUrl gruvboxdarkerPurple
hi! link markdownUrlTitleDelimiter gruvboxdarkerGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType gruvboxdarkerYellow
" hi! link haskellOperators gruvboxdarkerOrange
" hi! link haskellConditional gruvboxdarkerAqua
" hi! link haskellLet gruvboxdarkerOrange
"
hi! link haskellType gruvboxdarkerFg1
hi! link haskellIdentifier gruvboxdarkerFg1
hi! link haskellSeparator gruvboxdarkerFg1
hi! link haskellDelimiter gruvboxdarkerFg4
hi! link haskellOperators gruvboxdarkerBlue
"
hi! link haskellBacktick gruvboxdarkerOrange
hi! link haskellStatement gruvboxdarkerOrange
hi! link haskellConditional gruvboxdarkerOrange

hi! link haskellLet gruvboxdarkerAqua
hi! link haskellDefault gruvboxdarkerAqua
hi! link haskellWhere gruvboxdarkerAqua
hi! link haskellBottom gruvboxdarkerAqua
hi! link haskellBlockKeywords gruvboxdarkerAqua
hi! link haskellImportKeywords gruvboxdarkerAqua
hi! link haskellDeclKeyword gruvboxdarkerAqua
hi! link haskellDeriving gruvboxdarkerAqua
hi! link haskellAssocType gruvboxdarkerAqua

hi! link haskellNumber gruvboxdarkerPurple
hi! link haskellPragma gruvboxdarkerPurple

hi! link haskellString gruvboxdarkerGreen
hi! link haskellChar gruvboxdarkerGreen

" }}}
" Json: {{{

hi! link jsonKeyword gruvboxdarkerGreen
hi! link jsonQuote gruvboxdarkerGreen
hi! link jsonBraces gruvboxdarkerFg1
hi! link jsonString gruvboxdarkerFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! gruvboxdarkerHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! gruvboxdarkerHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
