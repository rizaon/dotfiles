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
Plugin 'morhetz/gruvbox'

" for markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" powerline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" fugitive
Plugin 'tpope/vim-fugitive'

" vim-highlight
Plugin 'jaxbot/semantic-highlight.vim'

" souffle.vim
Plugin 'souffle-lang/souffle.vim'

" vim-gitgutter
" Plugin 'airblade/vim-gitgutter'

" C++ autocomplete for vim
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required


" disable markdown folding
let g:vim_markdown_folding_disabled = 1


" indentation and syntax
filetype plugin indent on
syntax enable
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
autocmd Filetype java setlocal tabstop=2
autocmd Filetype python setlocal shiftwidth=2 softtabstop=2 expandtab
set textwidth=90
" sometimes, i wish to write long lines
" set textwidth=0
" set wrapmargin=0


" appearances and behavior
set number
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


" enable powerline fonts for airline
let g:airline_powerline_fonts = 1

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
" Disable auto suggestion
let g:ycm_min_num_of_chars_for_completion = 99
