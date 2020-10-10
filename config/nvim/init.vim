"============================================================
" General Settings
"============================================================

set shell=zsh

" Neovim support true colors
set termguicolors

" This is not vi...
set nocompatible

" Enable Mouse Scrolling
set mouse=a

" Enable syntax highlighting
syntax enable

" Super OP undo
set undofile
set undolevels=1000

" Change swap file Locations so we don't pollute the cwd
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set spellfile=~/.vim/spell/en.utf-8.add

" Allow backspace over line breaks, the start of insert and indents
set backspace=indent,eol,start

" Set netrw style to branch
"let g:netrw_liststyle=3
"let g:netrw_preview=1
"let g:netrw_alto=0
"let g:netrw_winsize=16
"let g:netrw_browse_split=4
"let g:netrw_chgwin = winnr()

" Hide dotfiles and more in netrw
"let g:netrw_list_hide='.*\.DS_Store$,.*\.tern-port$'
"
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" Show line Numbers
set nu

" Set paste toggle shortcut
set pastetoggle=<F10>

" NetRw leaves buffers open which I personally find very annoying
autocmd FileType netrw setl bufhidden=delete

" Command line history for vim commands
set history=200

" Allow entering :w or :W to write to file
command W w

" Disable line wrapping
set nowrap

" When doing a search, show where it matches as it is typed
set incsearch

" Window splitting rules
set splitbelow
set splitright

" Disable hackerz
set modelines=0

" Allow vim to reach Super Saiyan 3
set ttyfast

" Min amount of lines to show around cursor
set scrolloff=5

" Hardcore mode (Don't allow moving with arrow in normal mode)
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" indentation defaults
set tabstop=2
set shiftwidth=2
set expandtab

" indentation based on filetype
autocmd Filetype groovy setlocal ts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=4 sw=4 expandtab
autocmd Filetype go setlocal ts=4 sw=4 noexpandtab

" Prevent vim from using save features because it screws with file watchers
set backupcopy=yes

" Change Ack to use Silver Searcher (Ag)
if executable('rg')
  let g:ackprg = $ACK_COMMAND
endif

" highlight and unhighlight the current line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

" Set filetypes for some files that aren't magically recognized
autocmd BufNewFile,BufRead */nginx/*/default set filetype=nginx
autocmd BufNewFile,BufRead .babelrc set filetype=json
autocmd BufNewFile,BufRead .tern-project set filetype=json
autocmd BufNewFile,BufRead .tmux.conf set filetype=sh
autocmd BufNewFile,BufRead Dockerfile-* set filetype=dockerfile
autocmd BufNewFile,BufRead hosts set filetype=dosini
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
autocmd BufNewFile,BufRead supervisord.conf set filetype=dosini
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
autocmd BufNewFile,BufRead *.md setlocal textwidth=80
autocmd BufNewFile,BufRead *.vue set filetype=html

"============================================================
" Macros
"============================================================

let @i = 'Iciwimportf=xifromf df(i f)xI'
let @u = 'Go## o---kkA'

"============================================================
" Leader Key Setup <Space>
"============================================================

" Map Leader
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"

" Leader commands
nmap <leader>;  :tabedit $MYVIMRC<CR>
nmap <leader>s  :sp<CR>
nmap <leader>v  :vsp<CR>
nmap <leader>p  :NERDTreeToggle<CR>
nmap <leader>gf  :e <cfile><CR>
nmap <leader>'  :StripWhitespace<CR>
nmap <silent>   <leader><leader> :nohls<CR>
nmap <leader>9  :call <SID>SynStack()<CR>
nmap <leader>d  :JsDoc<CR>
nmap <leader>q  :TernDef<CR>
nmap <leader>n  :e <cfile><CR>
nmap <leader>f  :ALEFix<CR>

nmap <leader>t @o;
nmap <leader>l @u;


"============================================================
" Commands
"============================================================
"command! -nargs=1 Toml call TomlScript(<f-args>)
command Toml toml-script

"============================================================
" Custom Functions
"============================================================

" Show syntax highlighting groups for word under cursor
function! s:SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"============================================================
" Source Extra Files
"============================================================

" Plugins
source $HOME/.config/nvim/extras/plugins.vim
