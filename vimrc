"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"activate pathogen
call pathogen#infect()

" map 'jj' to 'exit insert mode' "
:imap jj <Esc>

" unmap Shift+k to avoid annoying man entry halting thing "
:map <S-k> <Nop>

" map cmd-enter to insert newline BELOW in insert mode "
:imap <D-Enter> <C-O>o

" map cmd-shift-enter to insert newline ABOVE in insert mode "
:imap <S-D-Enter> <C-O>O

" display
set nowrap
"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
set showmatch " show matching bracket
set matchtime=2 " for 0.2 seconds
set matchpairs+=<:> " for html
set laststatus=2 " 2 line status bar
" syntax on
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termtrans = 1
set colorcolumn=85 " show right margin
" change cursor shape per mode in terminal vim
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" editing
set ignorecase " ignore case for searching unless using uppercase letters
set smartcase
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab " turn tabs into spaces

" multicursor settings "
" override default ctrl-n mapping: "
" let g:multi_cursor_use_default_mapping=0 "
" let g:multi_cursor_exit_from_visual_mode "
" let g:multi_cursor_exit_from_insert_mode "
"                                          "
" my mappings for multi-cursor             "
" let g:multi_cursor_next_key='<D-d>'      "
" let g:multi_cursor_prev_key='<S-D-p>'    "
" let g:multi_cursor_skip_key='<D-x>'      "
" let g:multi_cursor_quit_key='<Esc>'      "

" setup for ctrlp "
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
:nmap π :CtrlP<return>


" allows you press esc to turn off search highlight "
:nnoremap <esc> :noh<return><esc>


""" splitting "
" set default split opening to bottom and right: "
set splitbelow
set splitright

" remove need for C-w before navigating "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier pane opening
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

au BufRead,BufNewFile *.txt, *.md, *.markdown, *.mdown, *.mkd, *.mkdn setlocal filetype=markdown textwidth=80

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

"if has('gui_running')
"    set background=dark
"else
"    set background=dark
"endif

set shell=/bin/bash\ -li

" autosave on lost focus "
autocmd BufLeave,FocusLost * silent! wall

" map 'tt' to open up NERDTree "
:map tt :NERDTreeToggle

" map 'V' to show YankRing "
:map vv :YRShow

" open NERDTree automatically when vim starts "
if has("gui")
  autocmd vimenter * NERDTree
endif

" open NERDTree even if no files specified "
" autocmd vimenter * if !argc() | NERDTree | endif

" close vim if NERDTree is the only window left "
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" a function for switching between the number modes:
if exists("+relativenumber")
  if v:version >= 400
    set number
  endif
  set relativenumber " show relative line numbers
  set number
  set numberwidth=3  " narrow number column
  " cycles between relative / absolute / no numbering
  if v:version >= 400
    function! RelativeNumberToggle()
      if (&number == 1 && &relativenumber == 1)
        set nonumber
        set relativenumber relativenumber?
      elseif (&number == 0 && &relativenumber == 1)
        set norelativenumber
        set number number?
      elseif (&number == 1 && &relativenumber == 0)
        set norelativenumber
        set nonumber number?
      else
        set number
        set relativenumber relativenumber?
      endif
    endfunc
  else
    function! RelativeNumberToggle()
      if (&relativenumber == 1)
        set number number?
      elseif (&number == 1)
        set nonumber number?
      else
        set relativenumber relativenumber?
      endif
    endfunc
  endif
  nnoremap <silent> <leader>n :call RelativeNumberToggle()<CR>
else " fallback
  set relativenumber " show relative line numbers
  set number " show line numbers
  " inverts numbering
  nnoremap <silent> <leader>n :set number! number?<CR>
endif

" settings from scrooloose:

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"store lots of :cmdline history
set history=1000

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set nowrap      "dont wrap lines
" set linebreak   "wrap lines at convenient points

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

    " set colorcolumn=+1 "mark the ideal max text width
endif

"default indent settings
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set autoindent

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O

"load ftplugins and indent files
filetype plugin on
filetype indent on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"tell the term has 256 colors
set t_Co=256

"hide buffers when not displayed
set hidden

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

"display a warning if file encoding isnt utf-8
set statusline+=%#warningmsg#
set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype

"read only flag
set statusline+=%#identifier#
set statusline+=%r
set statusline+=%*

"modified flag
set statusline+=%#identifier#
set statusline+=%m
set statusline+=%*

set statusline+=%{fugitive#statusline()}

"display a warning if &et is wrong, or we have mixed-indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%{StatuslineTrailingSpaceWarning()}

set statusline+=%{StatuslineLongLineWarning()}

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"recalculate the trailing whitespace warning when idle, and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

"return '[\s]' if trailing white space is detected
"return '' otherwise
function! StatuslineTrailingSpaceWarning()
    if !exists("b:statusline_trailing_space_warning")

        if !&modifiable
            let b:statusline_trailing_space_warning = ''
            return b:statusline_trailing_space_warning
        endif

        if search('\s\+$', 'nw') != 0
            let b:statusline_trailing_space_warning = '[\s]'
        else
            let b:statusline_trailing_space_warning = ''
        endif
    endif
    return b:statusline_trailing_space_warning
endfunction


"return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

"recalculate the tab warning flag when idle and after writing
autocmd cursorhold,bufwritepost * unlet! b:statusline_tab_warning

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let b:statusline_tab_warning = ''

        if !&modifiable
            return b:statusline_tab_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        endif
    endif
    return b:statusline_tab_warning
endfunction

"recalculate the long line warning when idle and after saving
autocmd cursorhold,bufwritepost * unlet! b:statusline_long_line_warning

"return a warning for "long lines" where "long" is either &textwidth or 80 (if
"no &textwidth is set)
"
"return '' if no long lines
"return '[#x,my,$z] if long lines are found, were x is the number of long
"lines, y is the median length of the long lines and z is the length of the
"longest line
function! StatuslineLongLineWarning()
    if !exists("b:statusline_long_line_warning")

        if !&modifiable
            let b:statusline_long_line_warning = ''
            return b:statusline_long_line_warning
        endif

        let long_line_lens = s:LongLines()

        if len(long_line_lens) > 0
            let b:statusline_long_line_warning = "[" .
                        \ '#' . len(long_line_lens) . "," .
                        \ 'm' . s:Median(long_line_lens) . "," .
                        \ '$' . max(long_line_lens) . "]"
        else
            let b:statusline_long_line_warning = ""
        endif
    endif
    return b:statusline_long_line_warning
endfunction

"return a list containing the lengths of the long lines in this buffer
function! s:LongLines()
    let threshold = (&tw ? &tw : 80)
    let spaces = repeat(" ", &ts)
    let line_lens = map(getline(1,'$'), 'len(substitute(v:val, "\\t", spaces, "g"))')
    return filter(line_lens, 'v:val > threshold')
endfunction

"find the median of the given array of numbers
function! s:Median(nums)
    let nums = sort(a:nums)
    let l = len(nums)

    if l % 2 == 1
        let i = (l-1) / 2
        return nums[i]
    else
        return (nums[l/2] + nums[(l/2)-1]) / 2
    endif
endfunction

"nerdtree settings
let g:NERDTreeMouseMode = 2
let g:NERDTreeWinSize = 25

"Scratch settings
"nnoremap <leader><tab> :Scratch<cr>

"explorer mappings
nnoremap <f1> :BufExplorer<cr>
nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TagbarToggle<cr>

"source project specific config files
runtime! projects/**/*.vim

"dont load csapprox if we no gui support - silences an annoying warning
if !has("gui")
    let g:CSApprox_loaded = 1
endif

"make <c-l> clear the highlight as well as redraw
"nnoremap <C-L> :nohls<CR><C-L>
"inoremap <C-L> <C-O>:nohls<CR>

"map Q to something useful
noremap Q gq

" allow space to play macro
:nnoremap <Space> @q

"make Y consistent with C and D
nnoremap Y y$

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>


"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'svn\|commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal! g`\""
            normal! zz
        endif
    end
endfunction

"spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

"http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
"hacks from above (the url, not jesus) to delete fugitive buffers when we
"leave them - otherwise the buffer list gets poluted
"
"add a mapping on .. to view parent tree
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


