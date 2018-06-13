set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" theme
Plugin 'altercation/vim-colors-solarized'

" for markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" All of your Plugins must be added before the following line
call vundle#end()            " required


" disable markdown folding
let g:vim_markdown_folding_disabled = 1


" my own setting
filetype plugin indent on
syntax enable
set hlsearch
set number
set ruler
autocmd Filetype java setlocal tabstop=2
setlocal textwidth=80

" Solarized stuff
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized


" escape shortcut
imap jj <Esc>
