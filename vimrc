"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"activate pathogen
call pathogen#infect()

" map 'jj' to 'exit insert mode' "
:imap jj <Esc>

" unmap Shift+k to avoid annoying man entry halting thing "
:map <S-k> <Nop>

" %% on command line will give you current path of buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>
" map <leader>e :edit %%
" map <leader>v :view %%

" display
set nowrap
" set linebreak " wrap lines at convenient points

"vertical/horizontal scroll off settings
set scrolloff=10
set sidescrolloff=7
set sidescroll=1
set showmatch " show matching bracket
set matchtime=2 " for 0.2 seconds
set matchpairs+=<:> " for html
set laststatus=2 " 2 line status bar
set number
" syntax on
syntax enable
set background=dark
" colorscheme smyck
" colorscheme solarized
colorscheme gruvbox
" let g:solarized_termtrans = 1

set colorcolumn=85 " show right margin
" change cursor shape per mode in terminal vim
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" markdown stuff
" these all start off with <Leader>m
" increase header: leader-m then + (really =)
:map <Leader>m= ^i#<esc>
" decrease header: leader-m then -
:map <Leader>m- ^x

" taskpaper stuff
" these all start off with <Leader>d (for donut. uh, i mean 'do')
:map <Leader>dd A @done<esc>
" mark done - d
:map <Leader>da kmxj:.m/[Aa]rchive/<Cr>`x<esc>
:vmap <leader>da :m/[Aa]rchive/<cr><esc>
:map <leader>dA :g/@done/.m/[Aa]rchive/<cr><cr><esc>
" move to top of archive - a
:map <Leader>d<S-d> kmxjA @done<esc>:.m/[aA]rchive/<Cr>`x<esc>
" done and top of archive - D

:nnoremap vv :set invpaste paste?<CR>
" toggle paste modes
:map <Leader>p vv"*]pvv
" enter paste mode, paste at current indent level, leave paste mode
:map <leader>o o<C-o>O
" add blank line above and below and enter insert mode

" editing
set ignorecase " ignore case for searching unless using uppercase letters
set smartcase
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab " turn tabs into spaces

" use shift-tab to insert tabs in INSERT mode
inoremap <S-Tab> <C-V><Tab>

" setup for ctrlp "
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'
:nmap π :CtrlP<return>

augroup BgHighlight
    autocmd!
    autocmd WinEnter * set colorcolumn=80
    " autocmd WinEnter * set cul

    autocmd WinLeave * set colorcolumn=0
    " autocmd WinLeave * set nocul
augroup END

" allows you press esc to turn off search highlight "
:nnoremap <esc> :noh<return><esc>

vmap <C-c>:w !pbcopy<CR><CR>

""" splitting "
" set default split opening to bottom and right: "
set splitbelow
set splitright

" remove need for C-w before navigating "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" toggle to previous buffer
map <leader>\ <C-^>

" DANGEROUS
" execute ./ the most-recently changed file in working directory
map <leader>cc :!unset -v latest; for file in *;do [[ $file -nt $latest ]] && latest=$file; done; ./$(basename $latest)<cr>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Cucumber mappings
" Run currently open cucumber feature file
map <Leader>ct :w<cr>:!cucumber %<cr>

" Run current cucumber scenario
map <Leader>cs :w<cr>:exe "!cucumber %" . ":" . line(".")<cr>

" Run all cucumber feature files
map <Leader>ca :w<cr>:!cucumber<cr>

autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn set filetype=markdown
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal syntax=markdown
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal spell
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal wrap linebreak
" autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal textwidth=80

" if you give a file the .die extension, it won't be saved/saveable
autocmd BufRead,BufNewFile *.die setlocal buftype=nofile
autocmd BufRead,BufNewFile *.die setlocal bufhidden=hide
autocmd BufRead,BufNewFile *.die setlocal noswapfile

" vimwiki
let wiki_trunk = {}
let wiki_trunk.path = '~/Dropbox/wiki/notes'
let wiki_trunk.syntax = 'markdown'
let wiki_trunk.ext = '.markdown'

let g:vimwiki_list = [wiki_trunk]

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html'] }

set shell=/bin/bash\ -li

" autosave on lost focus "
autocmd BufLeave,FocusLost * silent! wall

" map 'tt' to open up NERDTree "
" :map tt :NERDTreeToggle<cr>
:map tt :Vexplore<cr>

" resize splits on focus:
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" highlight current line
set cursorline
" highlight current column
" set cursorcolumn

" close vim if NERDTree is the only window left "
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" a function for switching between the number modes:
if exists("+relativenumber")
  if v:version >= 400
    set number
  endif
  " set relativenumber " show relative line numbers
  set number
  set numberwidth=5
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

"show incomplete cmds down the bottom
set showcmd

"show current mode down the bottom
set showmode

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
endif

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

"Airline theme setup:
" let g:airline_theme='kalisi'
let g:airline_theme='gruvbox'

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

"display a warning if fileformat isnt unix
set statusline+=%#warningmsg#
set statusline+=%{&ff!='unix'?'['.&ff.']':''}
set statusline+=%*

" display a warning if using dos line endings
set statusline+=%#warningmsg#
set statusline+=\ %9*%{&ff=='unix'?'':&ff.'\ format'}%*
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

"return a warning for long lines where long is either &textwidth or 80 (if
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
" let g:NERDTreeMouseMode = 2
" let g:NERDTreeWinSize = 25

"source project specific config files
runtime! projects/**/*.vim

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
autocmd BufReadPost fugitive:/[* set bufhidden=delete
autocmd BufReadPost fugitive://*
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif


