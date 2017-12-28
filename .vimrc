set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on    " required

set exrc
"eShows line numbers on left side
set number

" Sets tab char width to 4
set tabstop=4
" Sets tab and backspace width to 4 
set softtabstop=4
" Does softtabstop # of spaces instead of tab char (4)
set expandtab
" Sets the width of doing >> and <<
set shiftwidth=4
" Automatic indentation based on previous line
set autoindent

" Turns off word wrapping
set nowrap

" Asks to confirm when quitting without saving
set confirm

" Mouse control
set mouse=a

" Shows trailing spaces and tab chars as >---
set list
set listchars=tab:>-,trail:.

" Shows syntax highlighting
syntax on

" Shows command usedin bottom right
set showcmd
" Shows a menu for tab completing commands
set wildmenu

" Highlights as search is being typed
set incsearch
" Highlights all search matches
set hlsearch

" Sets mapleading key as comma
let mapleader=","

" Clears hlsearch with ,<space>
nnoremap <leader><space> :nohlsearch<CR>
set title
colorscheme 0x7A69_dark
"set cursorline
