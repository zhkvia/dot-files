set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Plugins --
" let Vundle manage bundle, required
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin for git commands
Plugin 'tpope/vim-fugitive'
" plugin for different CVSes
Plugin 'vim-scripts/vcscommand.vim'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"  Color schemes and themes
" Plugin 'crusoexia/vim-monokai'
Plugin 'altercation/vim-colors-solarized'

" Compile and see errors
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"" C++ zone --
" C++ >> switch between .h and .cpp files
Plugin 'derekwyatt/vim-fswitch'

" C++ >> Autocompletion, syntax checking, browsing via clang
Plugin 'Valloric/YouCompleteMe'
" C++ >> YCM fix --
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter = '/usr/bin/python'
let g:ycm_python_binary_path = '/usr/local/bin/python3'
" C++ >> --YCM fix

let g:ycm_collect_identifiers_from_tags_files = 1

" C++ >> Use YCM for autocompletion only (no syntax checking)
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1

let g:ycm_auto_trigger = 1

" C++ >> YCM shortcuts
nnoremap <leader>d :YcmCompleter GoToDefinition<cr>
nnoremap <leader>g :YcmCompleter GetDoc<cr>

" C++ >> Better syntax highlightning for C++11/14/17
Plugin 'octol/vim-cpp-enhanced-highlight'
let c_no_curly_error=1

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:clang_user_options = '-std=c++14'
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

" Asynchronous Lint checker (ALE)
" ALE --
Plugin 'w0rp/ale'
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 200
" -- ALE

" Python zone --
" Check Python files with flake8 and pylint.
let g:ale_pattern_options = {
\ '*\.py$': {'ale_linters': ['flake8'], 'ale_fixers': []}
\}
" Python virtual env
Plugin 'jmcantrell/vim-virtualenv'
" -- Python zone

" For viewing and editing column separated data
Plugin 'chrisbra/csv.vim'

" Sidebar displaying a current file's structure
Plugin 'majutsushi/tagbar'
nmap <C-t> :TagbarToggle<CR>
let g:tagbar_width = 40

" NEDRtree for displaying a folders tree on the left
Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 30

" To change cwd to a project root every time some file is opened
Plugin 'airblade/vim-rooter'
" Don't echo new cwd every time it changes
let g:rooter_silent_chdir = 1
" To change directory for the current window only
let g:rooter_use_lcd = 1

" Fuzzy search on files/buffers/tags/etc.
" FZF zone --
"$ brew install fzf
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

" Find files only in a project root folder
command! ProjectFiles execute 'Files' s:find_git_root()

nmap ; :Buffers<CR>
nmap ,f :ProjectFiles<CR>
nmap ,t :Tags<CR>
" -- FZF zone

" For distraction-free writing
Plugin 'junegunn/goyo.vim'

" Syntax highlighting for every language you could probably think of
Plugin 'sheerun/vim-polyglot'

" LaTeX plugin
Plugin 'lervag/vimtex'

" LaTeX live preview
Plugin 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'open -a Preview'

" Utilsnips for snippets
" Snippets --
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" -- Snippets

" JS/HTML --
" html autocomplete and bindings
Plugin 'mattn/emmet-vim'
"" -- JS/HTML

" --Plugins
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

" Indentation
" filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set wrap linebreak nolist
set hls
set is
set cursorline

" Speeding Vim up
" Set an old version of a regexp engine. Makes scrolling MUCH FASTER
set re=1
" to make a cursor always be in a vertical center
set scrolloff=9999

syntax enable
" Solarized --
set background=dark
colorscheme solarized
call togglebg#map("<F5>")  " toggle between light and dark themes
" -- Solarized

let &colorcolumn=join(range(81,999),",")
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Set rulers for 80 and 140 characters
let &colorcolumn="80,".join(range(140, 999),",")

" Open split panes only right and bottom
set splitbelow
set splitright

" Restore a cursor position when reopening a file
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set backspace=indent,eol,start
set mouse=a

" Relative numbers --
set relativenumber

" Switch between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

nnoremap <C-m> :call NumberToggle()<cr>
" -- Relative numbers

" Disable vertical arrow keys in Visual mode
vmap <up> <nop>
vmap <down> <nop>

" yank to a clipboard
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

" Allow vim to switch between buffers with unsaved changes
set hidden
