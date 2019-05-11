"installing plugin
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer'}
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/errormarker.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/vim-grammarous'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
call plug#end()

set history=1000
set autoread
set nu rnu
set showmatch
set hlsearch
set ruler
set cmdheight=1
syntax enable
syntax on
syntax enable
filetype plugin indent on
set incsearch
set ai
set si
set omnifunc=syntaxcomplete
nnoremap <F1> :set nu! rnu!<CR>:set foldcolumn=0<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :TlistToggle<CR>
noremap <F4> :Autoformat<CR>
nnoremap <C-n> :cn <CR>
nnoremap <C-p> :cN <CR>
nnoremap <C-t> :cw <CR>
nnoremap <C-c> <ESC>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Autocomplete [{'"
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap { {}<Esc>i


autocmd Filetype c      set omnifunc=ccomplete#Complete
autocmd Filetype html   set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml    set omnifunc=xmlcomplete#CompleteTags
autocmd Filetype tex    set omnifunc=syntaxcomplete#Complete
autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber

set dict+=/usr/share/dict/words
set spell spelllang=en_us complete+=k
au filetype c,cpp inoremap { {<CR>}<Esc>ko

set omnifunc=syntaxcomplete
let NERDTreeQuitOnOpen = 1
let NERDTreeWinPos= "right"
let g:NERDTreeDirArrows=0
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window=0
let Tlist_Show_One_File=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_SingleClick= 1 
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

let g:formatdef_CFormat = '"astyle --align-reference=name --align-pointer=name --mode=c --pad-header --style=google"'
let g:formatdef_javaFormat = '"astyle --style=attach --pad-oper"'
let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']
let g:formatters_cpp = ['CFormat']
let g:formatters_c = ['CFormat']
let g:formatters_cc = ['CFormat']
let g:formatters_java = ['javaFormat']
set tabstop=4
set shiftwidth=4

set background=dark
colorscheme solarized
let g:lightline = { 'colorscheme': 'solarized' }
set laststatus=2

" syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_checkers = ['g++']
let g:syntastic_c_checkers = ['gcc']

let b:ale_linters = ['pyflakes', 'flake8', 'pylint']

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set encoding=utf-8

set cursorline
set scrolloff=10

hi clear SpellBad
hi SpellBad cterm=underline
highlight SpellBad ctermfg=009

" auto select the first complete
let g:SuperTabLongestHighlight = 1

" You complete Me config
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_python_binary_path = "python"
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_autoclose_preview_window_after_insertion = 1
" "let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1,  'python': 1 }
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'cpp,cuda': ['->', '.', '::'],
  \   'java,javascript,python': ['.']}
set splitbelow
