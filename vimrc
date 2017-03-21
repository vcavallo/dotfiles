"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
 set nocompatible

 let g:pathogen_blacklist = []
 "call add(g:pathogen_blacklist, 'ctrlp.vim')
 "call add(g:pathogen_blacklist, 'vim-vinegar')
 "call add(g:pathogen_blacklist, 'vim-unimpaired')
 "call add(g:pathogen_blacklist, 'vim-rspec')
 call add(g:pathogen_blacklist, 'rust')
 call add(g:pathogen_blacklist, 'nvim')
 call add(g:pathogen_blacklist, 'itchy')
 call add(g:pathogen_blacklist, 'pad')
 call add(g:pathogen_blacklist, 'vim-rails')
 call add(g:pathogen_blacklist, 'vim-bundler')

"activate pathogen
 call pathogen#infect()

" map 'jj' to 'exit insert mode' "
 :imap jj <Esc>

" unmap Shift+k to avoid annoying man entry halting thing "
 :map <S-k> <Nop>

 set clipboard=unnamed

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
 colorscheme tender
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

autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.less set syntax=css
autocmd BufRead,BufNewFile *.ledger,*.journal set filetype=ledger
autocmd BufRead,BufNewFile *.ledger,*.journal set syntax=ledger
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn set filetype=markdown
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal syntax=markdown
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal spell
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal wrap linebreak
" autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal textwidth=80

" if you give a file the .die extension, it won't be saved/saveable
 autocmd BufRead,BufNewFile *.die setlocal buftype=nofile
 autocmd BufRead,BufNewFile *.die setlocal bufhidden=hide
 autocmd BufRead,BufNewFile *.die setlocal noswapfile

 au FileType xhtml,xml so ~/.vim/bundle/html-autoclosetag.vim

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
 :au FocusLost * silent! wa

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

" Toggle relative line number
  function! NumberToggle()
    if(&relativenumber)
      set norelativenumber
      set number
    else
      set relativenumber
      set number
    endif
  endfunc
  nnoremap <C-n> :call NumberToggle()<cr>

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
 " let g:airline_theme='gruvbox'
 let g:airline_theme='tender'
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#left_sep = ' '
 let g:airline#extensions#tabline#left_alt_sep = '|'
 let g:airline_powerline_fonts = 1
 let g:airline_right_sep = ''
 let g:airline_left_sep = ''

" let g:tender_airline = 1
" let g:airline_theme='tender'

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

" centers the current pane as middle of 4 imaginary columns
" should be called in a window with a single pane
 function CenterPane()
   lefta vnew
   wincmd w
   exec 'vertical resize '. string(&columns * 0.75)
 endfunction
 nnoremap <leader>c :call CenterPane()<cr>

"recalculate the trailing whitespace warning when idle, and after saving
 autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" provides :Shell command to pipe shelled output to new scratch buffer
 command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
 function! s:RunShellCommand(cmdline)
   echo a:cmdline
   let expanded_cmdline = a:cmdline
   for part in split(a:cmdline, ' ')
      if part[0] =~ '\v[%#<]'
         let expanded_part = fnameescape(expand(part))
         let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
      endif
   endfor
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
   call setline(2, 'Expanded Form:  ' .expanded_cmdline)
   call setline(3,substitute(getline(2),'.','=','g'))
   execute '$read !'. expanded_cmdline
   setlocal nomodifiable
   1
 endfunction

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

" allows you press esc to turn off search highlight "
 :nnoremap <esc> :noh<return><esc>
