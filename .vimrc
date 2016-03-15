" set vim compability to off for MOAR POWER!!
set nocompatible

" Disable filetype before loading plugs
filetype off

" Initialise
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'othree/html5.vim'
Plug 'rking/ag.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'Valloric/YouCompleteMe'
Plug 'digitaltoad/vim-pug'

call plug#end()

filetype plugin indent on

" The almighty leader
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

nmap <leader>w :w<CR>
nmap <leader>q :q<CR><Esc>
nmap <leader>e :wq!<CR>
nmap <leader>; :tabedit $MYVIMRC<CR>
nmap <leader>p :NERDTreeToggle<CR>
nmap <leader>s :sp<CR>
nmap <leader>v :vsp<CR>

" allow backspace over line breaks, the start of insert and indents
set backspace=indent,eol,start

" enable default syntax highlighting
syntax enable

" dark solarized colour scheme
set background=dark

" make sure vim is using the 16 ascii colours from iterm
let g:solarized_termcolors = 16

" set the colour scheme to solarized
colorscheme solarized

" highlight and unhighlight the current line when in insert mode
" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul

" show line Numbers
set nu

" store some history for the future generations
let history=100

" when doing a search, show where it matches as it is typed
set incsearch

" splitting rules
set splitbelow
set splitright

" tab = 4 spaces by default
set tabstop=4

" user spaces by default
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

" change the leader for emmet
let g:user_emmet_leader_key='<C-E>'

" indentation based on filetype
autocmd Filetype html setlocal ts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
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

" powerline stuffs
set laststatus=2
set noshowmode		" we don't need mode as we are using powerline
set statusline+=%F
let g:lightline = {
  \ 'colorscheme': 'solarized',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \     [ 'fugitive', 'filename' ] ]
  \   },
  \   'component': {
  \     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
  \   },
  \     'component_visible_condition': {
  \     'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
  \   }
  \ }

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" enable css and html highlighting in js files
let javascript_enable_domhtmlcss = 1

" jsx syntax highlighting and indentation for js files
let g:jsx_ext_required = 0

" auto expanding carriage returns with delimitMate
let delimitMate_expand_cr = 1

" move around splits like a bose
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" command NT toggles NERDTree
command NT NERDTreeToggle

" remove trailing white space at the end of lines
autocmd BufWritePre * :%s/\s\+$//e

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
