" set vim compability to off for MOAR POWER!!
set nocompatible
set esckeys

" Disable filetype before loading plugs
filetype off

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction<Paste>

"-----------------
" Initialise Plug
"-----------------
call plug#begin('~/.vim/plugged')

"----- Elixir
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
"----- Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'carlitux/deoplete-ternjs'
"----- HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"----- Git
Plug 'tpope/vim-fugitive'
"----- Theme & Style
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"----- Misc.
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'

call plug#end()

"----------
" Deoplete
"----------
let g:deoplete#enable_at_startup = 1

filetype plugin indent on

"--------------------------
" Set Gruvbox Color Scheme
"--------------------------
colorscheme gruvbox
set background=dark

"----------
" Setup Ag
"----------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"------------------
" Setup Leader Key
"------------------
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

nmap <leader>w :w<CR>
nmap <leader>q :q<CR><Esc>
nmap <leader>e :wq!<CR>
nmap <leader>; :tabedit $MYVIMRC<CR>
nmap <leader>s :sp<CR>
nmap <leader>v :vsp<CR>
nmap <leader>p :Explore<CR>

"----------------------------------
" Setup Default Makers for Neomake
"----------------------------------
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

"-------------------------
" Setup Auto Run Commands
"-------------------------

" run neomake on file save
autocmd BufWritePost,BufEnter * Neomake

" highlight and unhighlight the current line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" remove trailing white space at the end of lines
autocmd BufWritePre * :%s/\s\+$//e

" Set .babelrc file to json format on open and new
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Dockerfile-* set filetype=dockerfile

"----------------------------
" Airline Configuration
"----------------------------
set laststatus=2
set noshowmode
set noru
set statusline+=%F

let g:airline_powerline_fonts = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''

"--------
" Tweaks
"--------

" enable default syntax highlighting
syntax enable

" allow backspace over line breaks, the start of insert and indents
set backspace=indent,eol,start

" Set netrw style to branch
let g:netrw_liststyle=3

" show line Numbers
set nu

" Set paste toggle shortcut
set pastetoggle=<F10>

" hide files in netrw
let g:netrw_list_hide= '.*\.DS_Store$'

" store some history for the future generations
let history=100

" Disable linewrap cause its poo
set nowrap

" Stop AutoPairs closing over line
let g:AutoPairsMultilineClose = 0

" when doing a search, show where it matches as it is typed
set incsearch

" splitting rules
set splitbelow
set splitright

" tab = 4 spaces by default
set tabstop=4

" use spaces by default
set expandtab

" auto indent should use the 4 spaces by default
set shiftwidth=4

" make tabs smart
set smarttab

" disable hackerz
set modelines=0

" make vims power level go over 9000!
set ttyfast

" min amount of lines to show around cursor
set scrolloff=5

" hardcore mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Toggle search highlighting
nnoremap <F3> :set hlsearch!<CR>

" change the leader for emmet
let g:user_emmet_leader_key='<C-E>'

" indentation based on filetype
autocmd Filetype html setlocal ts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype elixir setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sw=2 expandtab
autocmd Filetype pug setlocal ts=2 sw=2 expandtab

" change swap file Locations so we don't pollute the cwd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|vendor\|bower_components\|log\|tmp\|compiled_lib$',
  \ 'file': '\.so\|\.dat\|\.DS_Store|\*?.log$'
  \ }

" CTRLP to show hidden by default
let g:ctrlp_show_hidden = 1

" enable css and html highlighting in js files
let javascript_enable_domhtmlcss = 1

" jsx syntax highlighting and indentation for js files
let g:jsx_ext_required = 0

" move around splits like a boss
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
