set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"  Color schemes and themes
Plugin 'crusoexia/vim-monokai'

" Compile and see errors
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
"" C++ zone --
" switch between .h and .cpp files
Plugin 'derekwyatt/vim-fswitch'

" " Autocompletion via clang
Plugin 'Valloric/YouCompleteMe'
" YCM fix
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Sometimes YCM is built under a different python version than a system one.
" Fix it:
" let g:ycm_server_python_interpreter = '/usr/bin/python'
"let g:ycm_python_binary_path = '/usr/local/bin/python3'

" " Better syntax highlightning for C++11/14/17
Plugin 'octol/vim-cpp-enhanced-highlight'
let c_no_curly_error=1
"" -- C++ zone

Plugin 'bronson/vim-trailing-whitespace'
" Vim implementation of Sublime Text's plugin PlainTask
Plugin 'elentok/plaintasks.vim'
" Bindings for comments
Plugin 'tpope/vim-commentary'
" Plugin for iTerm (enables FocusGained, FocusLost, etc)
Plugin 'sjl/vitality.vim'
" Home page for vim
Plugin 'mhinz/vim-startify'

" Asynchronous Lint checker
Plugin 'w0rp/ale'

" Python virtual env
Plugin 'jmcantrell/vim-virtualenv'

" For viewing and editing column separated data
Plugin 'chrisbra/csv.vim'

" Sidebar displaying a current file's structure
Plugin 'majutsushi/tagbar'
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_width = 40

" NEDRtree for displayin folders tree on the left
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30

" Fuzzy search on files/buffers/tags/etc.
Plugin 'kien/ctrlp.vim'

" LaTeX plugin
Plugin 'lervag/vimtex'

" LaTeX live preview
Plugin 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'open -a Preview'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
" how many spaces will be inserted after pressing tab
set tabstop=2
" how many spaces will be inserted by indentation rules after newline
set shiftwidth=2
set expandtab
"set nowrap
set wrap linebreak nolist
set hls
set is
syntax on
colorscheme monokai
let &colorcolumn=join(range(81,999),",")
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:clang_user_options = '-std=c++14 -fopenmp'
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Set rulers for 80 and 120 characters
let &colorcolumn="80,".join(range(120, 999),",")

" Open split panes only right and bottom
set splitbelow
set splitright

" Move cursor to last position when reopening file:"
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set backspace=indent,eol,start
set mouse=a

" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif


set relativenumber

" Switch between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" Also, show absoulute line numbers when vim loses focus
autocmd FocusLost * set norelativenumber
autocmd FocusGained * set relativenumber

" Let's use absolute ine numbers when we're in insert mode
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber

nnoremap <C-n> :call NumberToggle()<cr>


" Disable vertical arrow keys in Visual mode
vmap <up> <nop>
vmap <down> <nop>

" yank to clipboard
" If you are using macOS, see: http://www.markcampbell.me/2016/04/12/setting-up-yank-to-clipboard-on-a-mac-with-vim.html
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Fix a weird bug when a mouse doesn't work after a 220th column
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" Always set the vim's cwd to a current file's directory
autocmd BufEnter * lcd %:p:h
