set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin section --------------------------

" General

" universal debugger
Plugin 'Vdebug'

" shows a git diff
Plugin 'airblade/vim-gitgutter'
let g:gitgutter_max_signs=3000

" code syntax check
Plugin 'syntastic'
let g:syntastic_check_on_open=1

Plugin 'vimprj'
Plugin 'DfrankUtil'
Plugin 'amiorin/vim-project'

if filereadable(".projects.vimrc")
    so .projects.vimrc
endif

Plugin 'kien/ctrlp.vim'
let g:ctrlp_root_markers = ['.git']
" always open in your project's root directory
let g:ctrlp_working_path_mode=2

Plugin 'scrooloose/nerdtree'
let g:NERDTreeChDirMode=2

Plugin 'Xuyuanp/nerdtree-git-plugin'

" jump around documents \\w
Plugin 'Lokaltog/vim-easymotion'

Plugin 'nanotech/jellybeans.vim'
Plugin 'honza/vim-snippets'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'

" html tags completion (div<Ctrl+E>)
Plugin 'rstacruz/sparkup'

" clear whitespace
Plugin 'StripWhiteSpaces'

" automate some typing
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
imap <C-c> <CR><Esc>O

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'

" PHP
Plugin 'alvan/vim-php-manual'
Plugin 'shawncplus/phpcomplete.vim'

autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1
let g:phpcomplete_mappings = { 'jump_to_def': ',g', }
set completeopt=longest,menuone

" Android
Plugin 'tfnico/vim-gradle'
Plugin 'hsanson/vim-android'

au BufEnter *.java nmap <F5> <ESC>:Android assembleDebug<CR>
au BufEnter *.java nmap <F7> <ESC>:Android installDebug<CR>
let g:android_sdk_path="/opt/android-sdk"
let g:gradle_path="/usr/bin/gradle"

Plugin 'artur-shaik/vim-javacomplete2'

autocmd FileType java set omnifunc=javacomplete#Complete
nnoremap <F3> :JCimportAdd<cr>
inoremap <F3> <esc>:JCimportAddI<cr>

" stop plugin section  --------------------------
call vundle#end()            " required
filetype plugin indent on    " required

" by default, hide gui menus
set guioptions=i

" for dark terminal
set background=dark

" set default scheme
set t_Co=256
colorscheme jellybeans

" default file encoding
set encoding=utf-8

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

" tree
map <C-\> :NERDTreeToggle<cr>

" autocomplete ctrl+space
imap <C-Space> <C-X><C-O>

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

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('java', 'Magenta', 'none', '#24a8d3', '#151515')
