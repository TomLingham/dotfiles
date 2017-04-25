" set vim compability to off for MOAR POWER!!
set nocompatible
set esckeys

" Disable filetype before loading plugs
filetype off

"-----------------
" Plug Packages
"-----------------
call plug#begin('~/.vim/plugged')

"----$ Elixir
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
"----$ Javascript
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'heavenshell/vim-jsdoc'
"----$ HTML
Plug 'othree/html5.vim'
Plug 'mattn/emmet-vim'
"----$ Rust
Plug 'rust-lang/rust.vim'
Plug 'sebastianmarkow/deoplete-rust'
"----$ Toml
Plug 'cespare/vim-toml'
"----$ Git
Plug 'tpope/vim-fugitive'
"----$ Theme & Style
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
"----$ Python
Plug 'zchee/deoplete-jedi'
"----$ ...
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-nginx'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'

call plug#end()

filetype plugin indent on

syntax enable

" Super OP undo
set undofile
set undolevels=1000

"--------------------------
" Set Color Scheme
"--------------------------
set background=dark
let g:airline_theme='gruvbox'
let g:gruvbox_italic=1
set fillchars+=vert:\ 
colorscheme gruvbox

"----------
" Commands
"----------
command W w

"----------
" Deoplete
"----------
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

" Use deoplete.
let g:tern_request_timeout = 5
let g:tern_show_signature_in_pum = '0'
set completeopt-=preview

" Some python sugar
call deoplete#enable()

autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
autocmd CompleteDone * pclose " To close preview window of deoplete automagically

"----------
" Setup Ag
"----------
if executable('ag')
  let g:ackprg = 'ag --vimgrep --ignore node_modules'
endif

"------------------
" Setup ListToggle
"------------------
let g:lt_height = 5

"-------
" JsDoc
"-------
nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)

"------------------
" Setup Leader Key
"------------------
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

nmap <leader>; :tabedit $MYVIMRC<CR>
nmap <leader>s :sp<CR>
nmap <leader>v :vsp<CR>
nmap <leader>p :Explore<CR>
nmap <leader>gf :e <cfile><CR>
nmap <leader>D :JsDoc<CR>
nmap <leader>' :StripWhitespace<CR>

"----------------------------------
" Setup Default Makers for Neomake
"----------------------------------
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

" Stop neomake running on :wq
autocmd! QuitPre * let g:neomake_verbose = 0

"-------------------------
" Setup Auto Run Commands
"-------------------------

" run neomake on file save
autocmd BufWritePost,BufEnter * Neomake

" highlight and unhighlight the current line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Set filetypes for some files that aren't magically recognized
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead Dockerfile-* set filetype=dockerfile
autocmd BufNewFile,BufRead hosts set filetype=dosini
autocmd BufNewFile,BufRead supervisord.conf set filetype=dosini
autocmd BufNewFile,BufRead .tmux.conf set filetype=sh
autocmd BufNewFile,BufRead */nginx/*/default set filetype=nginx
autocmd BufNewFile,BufRead .tern-project set filetype=json
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy

"------------
" Rust Racer
"------------
let g:deoplete#sources#rust#racer_binary = '~/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '~/Source/rust/src'
let g:deoplete#sources#rust#documentation_max_height = 20

"-----------------------
" Airline Configuration
"-----------------------
set laststatus=2
set noshowmode
set noru
set statusline+=%F

let g:airline_powerline_fonts = 1

"--------
" Tweaks
"--------

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
let history=500

" Disable linewrap cause its poo
set nowrap

" Stop AutoPairs closing over line
let g:AutoPairsMultilineClose=0

" when doing a search, show where it matches as it is typed
set incsearch

" splitting rules
set splitbelow
set splitright

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
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\    'attribute_name': {'class': 'styleName', 'for': 'htmlFor'}
\  },
\}

" indentation defaults
set tabstop=2
set shiftwidth=2
set expandtab

" indentation based on filetype
autocmd Filetype groovy setlocal ts=4 sw=4 expandtab
autocmd Filetype php setlocal ts=4 sw=4 expandtab

" change swap file Locations so we don't pollute the cwd
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" FZF Config
nnoremap <C-p> :FZF<CR>
let g:fzf_layout = { 'down': '~26%' }

" enable css and html highlighting in js files
let javascript_enable_domhtmlcss = 1

" jsx syntax highlighting and indentation for js files
let g:jsx_ext_required = 0

" Prevent vim from using the awesome save features because it screws with
" watchers
set backupcopy=yes

" Show syntax highlighting groups for word under cursor
nmap <leader>9 :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

