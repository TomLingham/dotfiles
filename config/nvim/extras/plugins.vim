call plug#begin('~/.vim/plugged')

"----$ Autocomplate
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"----$ Elixir
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'

"----$ JavaScript
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'heavenshell/vim-jsdoc'

"----$ TypeScript
Plug 'HerringtonDarkholme/yats.vim'

"----$ Groovy
Plug 'modille/groovy.vim'

"----$ SCSS
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
Plug 'dracula/vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"----$ Python
Plug 'zchee/deoplete-jedi'

"----$ Markdown
Plug 'plasticboy/vim-markdown'

"----$ ...
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-nginx'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'


call plug#end()

"============================================================
" Language Client
"============================================================

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
  \ 'reason': ['ocaml-language-server', '--stdio'],
  \ 'ocaml': ['ocaml-language-server', '--stdio'],
  \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>


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

" Disable annoying markdown folding
let g:vim_markdown_folding_disabled = 1
set conceallevel=2
let g:vim_markdown_conceal = 1
let g:vim_markdown_strikethrough = 1


"============================================================
" Deoplete
"============================================================
call deoplete#custom#var('file', 'enable_buffer_path', v:true)
let g:deoplete#enable_at_startup = 1
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

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:airline#extensions#ale#enabled = 1

let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

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


"============================================================
" Node
"============================================================
let node_modules = finddir('node_modules', 'app;')

if node_modules != ''
  let node_bin = getcwd() . '/' . node_modules . '/.bin/'
else
  let node_bin = system('npm bin -g')
endif


"==========================================================o=
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

" Theme customisations
let custom_theme_settings=$HOME.'/.dotfiles/themes/'.$VIM_COLORSCHEME.'.vim'
if filereadable(custom_theme_settings)
  exec "source ".custom_theme_settings
endif
