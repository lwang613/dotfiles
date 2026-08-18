" ------------------------------------------------------------------------------
" Core
" ------------------------------------------------------------------------------
filetype plugin indent on  " Load per-language indent rules (Python, sh, R, make)
syntax on                  " Enable syntax highlighting
set encoding=utf-8         " Avoid mangled characters in files from other systems

" ------------------------------------------------------------------------------
" Display
" ------------------------------------------------------------------------------
set number                 " Show line numbers
set cursorline             " Highlight current line
set ruler                  " Show cursor position in the corner
set laststatus=2           " Always show the status bar, even with one file open
set scrolloff=3            " Keep 3 lines of context above/below cursor
set termguicolors          " 24-bit color — remove if using Apple Terminal.app

" ------------------------------------------------------------------------------
" Indentation
" ------------------------------------------------------------------------------
set expandtab              " Insert spaces instead of tab characters
set tabstop=4              " A literal tab renders as 4 columns
set shiftwidth=4           " >> and << shift by 4
set softtabstop=4          " Backspace deletes a full 4-space indent, not one space
set autoindent             " Carry current line's indent to the next line
autocmd FileType make setlocal noexpandtab  " Makefiles require literal tabs

" ------------------------------------------------------------------------------
" Search
" ------------------------------------------------------------------------------
set incsearch              " Jump to matches while typing, before pressing Enter
set hlsearch               " Highlight all matches; clear with :noh
set ignorecase             " Case-insensitive searching
set smartcase              " ...unless the search contains a capital letter

" ------------------------------------------------------------------------------
" Quality of life
" ------------------------------------------------------------------------------
set backspace=indent,eol,start  " Make backspace behave like every other editor
set mouse=a                     " Mouse clicking and scrolling
set clipboard=unnamed,unnamedplus  " System clipboard; see note on macOS builds
set noswapfile                  " Don't scatter .swp files next to your work
set nobackup
