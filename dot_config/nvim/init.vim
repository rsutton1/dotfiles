set list
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase              " case insensitive
"set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
"set incsearch               " incremental search
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
"set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
lua <<EOF
print('hello from lua')
EOF

" line numbers
set number relativenumber

" tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" key bindings
inoremap jj <ESC>

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>k :nohlsearch<CR>
nmap <leader>Q :bufdo bdelete<cr>

" edit chezmoi
nmap <leader>ce :edit ~/.local/share/chezmoi/README.md<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" automatically set textwidth in markdown files
au BufRead,BufNewFile *.md setlocal textwidth=80

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

source ~/.config/nvim/plugins/plenary.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/dispatch.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/rainbow.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/ale.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/nvim-comment.vim
source ~/.config/nvim/plugins/vim-salt.vim
call plug#end()
doautocmd User PlugLoaded
