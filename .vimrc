set shellcmdflag=-Iic
set nocompatible " Disable vi-compatibility

"VUNDLE CONFIG DO NOT CHANGE
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on 
"END VUNDLE SETUP

Bundle 'vim-scripts/sudo.vim'
Bundle 'skalnik/vim-vroom'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'wincent/Command-T'
"Powerline setup
Bundle 'Lokaltog/vim-powerline'
set laststatus=2 " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
"Bundle 'Lokaltog/powerline'
"set rtp+={repository_root}/powerline/bindings/vim

au FileType c,cpp,java set cindent
let mapleader = ","

"disable arrows
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"redraw screen with ctrl-l
nnoremap <silent> <C-l> :nohl<CR><C-l>
"Custom maps"
nnoremap <C-b> :call XX()<cr>
nnoremap <Leader>t :tabnew<cr>:e 

"CamelCase movement in visual and insert
nnoremap <Leader>h :call search('\<\<Bar>\u', 'bW')<CR>
nnoremap <Leader>l :call search('\<\<Bar>\u', 'W')<CR>
"inoremap <Leader>h <C-o>:call search('\<\<Bar>\u', 'bW')<CR>
"inoremap <Leader>l <C-o>:call search('\<\<Bar>\u', 'W')<CR>
vnoremap <Leader>h <C-o>:call search('\<\<Bar>\u', 'bW')<CR>
vnoremap <Leader>l <C-o>:call search('\<\<Bar>\u', 'W')<CR>

"Directional movement between buffers
nnoremap <silent> gl <c-w>l
nnoremap <silent> gh <c-w>h
nnoremap <silent> gk <c-w>k
nnoremap <silent> gj <c-w>j

"(un)fold at line specified by count without changing cursor location`
nnoremap <Leader>o ggzo''
nnoremap <Leader>c ggzc''

"yank and put from system clipboard
nnoremap <Leader>Y :.w !pbcopy<cr><cr>
vnoremap <Leader>Y :w !pbcopy<cr><cr>
vnoremap <Leader>p :call PP()<cr>
nnoremap <Leader>p :call PP()<cr>

"with counts, paste at the end of specified line, cursor unchanged
nnoremap <Leader>L gg$p''
"with counts, delete specified line #, cursor unchanged
nnoremap <Leader>d ggdd''
"Move within splits
vnoremap <Leader>w <c-w>
nnoremap <Leader>w <c-w>
"Maximize current split
vnoremap <Leader>- <c-w>_
nnoremap <Leader>- <c-w>_
"equalize all splits space on screen
vnoremap <Leader>= <c-w>=
nnoremap <Leader>= <c-w>=

"move between tabs without shift keys
nnoremap gw gT
nnoremap ge gt

"quick config
nnoremap <Leader>v :tabnew ~/.vimrc<cr>
nnoremap <Leader>V :source $MYVIMRC<cr>

nnoremap tt /tags="\(\S*\s*)*

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
inoremap jj <Esc>
"don't jump over text wrapped lines
nnoremap j gj
nnoremap k gk

nnoremap <Leader>D :mapclear<cr>:map <Leader>V :source $MYVIMRC<cr>

set smartindent
set autoindent
set backspace=indent,eol,start
set scrolloff=5
set number
set ignorecase
set smartcase
set incsearch
set expandtab
set tabstop=2
set shiftwidth=2
set showmode
set showmatch
set textwidth=80
set pastetoggle=<f2>
set backspace=2
set hlsearch
set ruler
set foldmethod=syntax
set foldcolumn=3
set foldlevel=6
set foldnestmax=5
set guifont=Lucida_console:h12:CANSI
syntax enable
colorscheme pablo
highlight matchParen ctermbg=4

"backup options
"set backupdir=~/temp
"`set backup

"compile function
function!  CC()
	let fName=expand("%:r")
	exe ";!g++ " . fName . ".cpp -o " . fName . ".run"
	exe ";!" . fName . ".run"
endfunction

function! PP()
  set paste
  .!pbpaste
  set nopaste
endfunction
"
"4 way split
function! XX()
  vnew
  new
  winc l
  new
endfunction

if &t_Co > 1
	syntax enable
endif
"
"map compiler
"map mm :call CC()<cr>
