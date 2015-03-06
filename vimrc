execute pathogen#infect()

t insert mode' "
:imap jj <Esc>

" map cmd-enter to insert newline BELOW in insert mode "
:imap <D-Enter> <C-O>o

" map cmd-shift-enter to insert newline ABOVE in insert mode "
:imap <S-D-Enter> <C-O>O

syntax on

" multicursor settings "
" override default ctrl-n mapping: "
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_exit_from_visual_mode=0
let g:multi_cursor_exit_from_insert_mode=0

" my mappings for multi-cursor
let g:multi_cursor_next_key='<D-d>'
let g:multi_cursor_prev_key='<S-D-p>'
let g:multi_cursor_skip_key='<D-x>'
let g:multi_cursor_quit_key='<Esc>'

source ~/.vim/vimrc

" setup for ctrlp "
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
:nmap Ï€ :CtrlP<return>


" allows you press esc to turn off search highlight "
:nnoremap <esc> :noh<return><esc>

" set vertical ruler "
set colorcolumn=85

""" splitting """
" set default split opening to bottom and right: "
set splitbelow
set splitright

" remove need for C-w before navigating "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

syntax enable
set background=dark
colorscheme solarized

if has('gui_running')
    set background=dark
else
    set background=dark
endif

set shell=/bin/bash\ -li

" autosave on lost focus "
autocmd BufLeave,FocusLost * silent! wall

" map 'tt' to open up NERDTree "
:map tt :NERDTreeToggle

" map 'V' to show YankRing "
:map vv :YRShow

" open NERDTree automatically when vim starts "
autocmd vimenter * NERDTree

" open NERDTree even if no files specified "
" autocmd vimenter * if !argc() | NERDTree | endif

" close vim if NERDTree is the only window left "
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" always show line numbers "
set number
