set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" git shortcuts (Gwrite, Gread, etc)
Plugin 'tpope/vim-fugitive'

" html tags completion (example: div<Ctrl+E>)
" make :set filetype=html --> before usage
Plugin 'rstacruz/sparkup'

" navigation of the Rails directory structure
" syntax highlighting (CTRL-X CTRL-U)
Plugin 'rails.vim'

" fuzzy finder for Ctrl+P
Plugin 'kien/ctrlp.vim'

" explore filesystem tree
Plugin 'scrooloose/nerdtree'

" asynchronous evaluation of vim scripts
Plugin 'xolox/vim-misc'

" scheme
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'jellybeans.vim'

" status
Plugin 'vim-airline'

" code syntax check
Plugin 'syntastic'

" useful snippets first expand the #! snippet
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" shows a git diff
Plugin 'airblade/vim-gitgutter'

" shell prompt
Plugin 'edkolev/promptline.vim'

" clear whitespace
Plugin 'StripWhiteSpaces'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" text codepage by default
set termencoding=utf-8

" use ack instead of grep
set grepprg=ack

" for dark terminal
set background=dark

set t_Co=256
colorscheme jellybeans

" syntax highlighting enables
if has("syntax")
  syntax on
endif

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

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

" F5 - execute current file
" ! to run, % to refer to the file
" :p to use the full path of the current file
nmap <F5> :! %:p<cr>
nnoremap <leader>r :!%:p<cr>

" toggle tree
map <C-\> :NERDTreeToggle<cr>

" toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

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

" syntastic check
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" show airline
set laststatus=2
"let g:airline_theme='luna'

" always jump to the last cursor position on exit\open
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif

let g:promptline_preset = 'full'
let g:promptline_theme = 'jelly'
