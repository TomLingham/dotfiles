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
Plug 'neomake/neomake'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'


call plug#end()


"============================================================
" Visual Tweaks
"============================================================

" Remove pipe character between window splits
set fillchars+=vert:\ 

" Style JsDocs
let g:javascript_plugin_jsdoc=1

" Enable CSS and HTML highlighting in js files
let javascript_enable_domhtmlcss=1

" JSX syntax highlighting and indentation for JS files
let g:jsx_ext_required=0


"============================================================
" Deoplete
"============================================================
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1
let g:tern_request_timeout = 2
let g:tern_show_signature_in_pum = '0'
set completeopt-=preview


"============================================================
" NeoMake
"============================================================
let g:neomake_javascript_enabled_makers=['eslint']
let g:neomake_jsx_enabled_makers=['eslint']
let g:neomake_javascript_eslint_exe=system('PATH=$(npm bin):$PATH && which eslint | tr -d "\n"')

" Stop neomake running on quit
autocmd! QuitPre * let g:neomake_verbose=0

" Run neomake on file save
autocmd BufWritePost,BufEnter * Neomake


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

