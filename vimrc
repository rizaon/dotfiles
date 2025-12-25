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
" Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'

" for markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" fugitive
" Plugin 'tpope/vim-fugitive'

" souffle.vim
" Plugin 'souffle-lang/souffle.vim'

" vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required


" disable markdown folding
let g:vim_markdown_folding_disabled = 1


" indentation and syntax
filetype plugin indent on
syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype java setlocal tabstop=2
set textwidth=120
" sometimes, i wish to write long lines
" set textwidth=0
" set wrapmargin=0


" appearances and behavior
" set number
set ruler
set hlsearch

" Solarized stuff
"let g:solarized_termtrans = 1
"set background=dark
"colorscheme solarized
" Solarized vim-airline
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'

" gruvbox
colorscheme gruvbox
set bg=dark

" escape shortcut
imap jj <Esc>

" disable mouse reporting
set mouse=

" enable powerline fonts for airline
let g:airline_powerline_fonts = 1

" for faster gitgutter
set updatetime=1000
let g:gitgutter_enabled = 0

" Find file in directory
silent! nmap <C-P> :Files<CR>

" Find file registered in repository (Git)
silent! nmap <C-G> :GFiles<CR>

" Find file contaning string/regex
silent! nmap <C-f> :Rg!

