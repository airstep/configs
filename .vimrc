set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin section --------------------------

" universal debugger
Plugin 'Vdebug'

" changes the working directory to the project root 
"Plugin 'airblade/vim-rooter'

Plugin 'hsanson/vim-android'

au BufEnter *.java nmap <F5> <ESC>:Android assembleDebug<CR>
au BufEnter *.java nmap <F7> <ESC>:Android installDebug<CR>
let g:android_sdk_path="/opt/android-sdk"
let g:gradle_path="/usr/bin/gradle"

Plugin 'artur-shaik/vim-javacomplete2'

autocmd FileType java set omnifunc=javacomplete#Complete
nnoremap <F3> :JCimportAdd<cr>
inoremap <F3> <esc>:JCimportAddI<cr>

Plugin 'nanotech/jellybeans.vim'
Plugin 'honza/vim-snippets'
"Plugin 'isdamir/mswin.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
"Plugin 'tpope/vim-rails'
" git shortcuts (Gwrite, Gread, etc)
"Plugin 'tpope/vim-fugitive'

" html tags completion (example: div<Ctrl+E>)
" make :set filetype=html --> before usage
"Plugin 'rstacruz/sparkup'

" asynchronous evaluation of vim scripts
"Plugin 'xolox/vim-misc'

" shows a git diff
Plugin 'airblade/vim-gitgutter'

let g:gitgutter_max_signs=2000

" code syntax check
Plugin 'syntastic'

" clear whitespace
"Plugin 'StripWhiteSpaces'

"Plugin 'airblade/vim-rooter'

" stop plugin section  --------------------------
call vundle#end()            " required
filetype plugin indent on    " required

let g:EclimCompletionMethod = 'omnifunc'

" by default, hide gui menus
set guioptions=i

" for dark terminal
set background=dark

" set default scheme
set t_Co=256
colorscheme jellybeans

" text codepage by default
set termencoding=utf-8

" use ack instead of grep
set grepprg=ack

" syntax highlighting enables
if has("syntax")
  syntax on
endif

" popup menu doesn't select the first completion item
"set completeopt=longest,menuone

"indent settings
set nowrap
set tabstop=4
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set noerrorbells         " don't beep

" set working directory
" of the current file
set autochdir

" left treeview
let g:netrw_winsize = -28
let g:netrw_banner = 0

filetype plugin indent on

" events

" exit vim
map <Esc><Esc> :qa!<CR>

" F2 - fast save
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F4 - exit page
nmap <F4> :q!<cr>
vmap <F4> <esc> :q!<cr>i
imap <F4> <esc> :q!<cr>i

"quickfix
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" \ + r - execute current file
nnoremap <leader>r :!%:p<cr>

" before and after paste from GUI
set pastetoggle=<F12>

" toggle fullscreen
map <F11> <Esc>:call ToggleGUICruft()<cr>

map <C-\> :Lexplore<cr>

" functions

" hide menu and scrollbar
function! ToggleGUICruft()
  if &guioptions=='i'
    exec('set guioptions=imTrL')
  else
    exec('set guioptions=i')
  endif
endfunction

" fix for snippets autocomplete
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" always jump to the last cursor position on exit\open
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" auto-format xml (libxml2 must be installed)
au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

let g:EclimCompletionMethod = 'omnifunc'
