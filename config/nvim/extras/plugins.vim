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
Plug 'ternjs/tern_for_vim'
Plug 'heavenshell/vim-jsdoc'

"----& FlowJS
Plug 'flowtype/vim-flow'
Plug 'wokalski/autocomplete-flow'

"----& SCSS
Plug 'cakebaker/scss-syntax.vim'

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
Plug 'whatyouhide/vim-gotham'
Plug 'TomLingham/dracula.vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"----$ Python
Plug 'zchee/deoplete-jedi'

"----$ ...
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-nginx'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'


call plug#end()


"============================================================
" Visual Tweaks
"============================================================

" Remove pipe character between window splits. The whitespace
" character after the \ is required!
set fillchars+=vert:\ 

" Style JsDocs
let g:javascript_plugin_jsdoc=1

" Enable CSS and HTML highlighting in js files
let javascript_enable_domhtmlcss=1

" JSX syntax highlighting and indentation for JS files
let g:jsx_ext_required=0

" Enable flow by default
let g:javascript_plugin_flow = 1


"============================================================
" Deoplete
"============================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:tern_request_timeout = 2
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [
\   'jsx',
\   'javascript.jsx',
\   'javascript',
\ ]

" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

set completeopt-=preview


"============================================================
" Ale
"============================================================
let g:ale_sign_error = ''
let g:ale_sign_warning = '――'
let g:ale_echo_msg_format = '%linter% says: "%s"'


"============================================================
" Emmet
"============================================================
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_settings={
\  'javascript.jsx' : {
\    'extends' : 'jsx',
\    'attribute_name': {'class': 'styleName', 'for': 'htmlFor'}
\  },
\}

"
"============================================================
" FZF
"============================================================
nnoremap <C-p> :FZF<CR>
let g:fzf_layout={ 'down': '~26%' }


"============================================================
" Rust Racer
"============================================================
let g:deoplete#sources#rust#racer_binary=$HOME.'/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path=$RUST_SRC_PATH
let g:deoplete#sources#rust#documentation_max_height=20


"============================================================
" Airline
"============================================================
set laststatus=2
set noshowmode
set noru
set statusline+=%F

let g:airline_powerline_fonts=1

"============================================================
" Miscellaneous
"============================================================

" Stop AutoPairs closing over line
let g:AutoPairsMultilineClose=0

