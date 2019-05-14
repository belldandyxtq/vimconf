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
Plug 'rhysd/vim-grammarous'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/Align'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'mileszs/ack.vim'
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
nnoremap <C-i> :set nu! rnu!<CR>:set foldcolumn=0<CR>
nnoremap <C-d> :NERDTreeToggle<CR>
nnoremap <C-t> :TlistToggle<CR>
nnoremap <C-a> :Autoformat<CR>
nnoremap <C-n> :cn <CR>
nnoremap <C-p> :cN <CR>
nnoremap <C-]> g<C-]> 

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" Autocomplete [{'"
inoremap [ []<Esc>i
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap { {}<Esc>i

function! Enable_dictionary_completion()
	set dict+=/usr/share/dict/words
	set spell 
	set spelllang=en_us
	set complete+=k
endfunction

function! Disable_dictionary_completion()
	set dict&
	set spell&
	set spelllang&
	set complete&
endfunction

call Enable_dictionary_completion()

autocmd Filetype c      set omnifunc=ccomplete#Complete
autocmd Filetype html   set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml    set omnifunc=xmlcomplete#CompleteTags
autocmd Filetype tex    set omnifunc=syntaxcomplete#Complete
autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber
autocmd filetype c,cpp inoremap { {<CR>}<Esc>ko
autocmd filetype c,cpp,python,java call Disable_dictionary_completion()
autocmd filetype c,cpp,python,java setlocal completeopt-=preview

set omnifunc=syntaxcomplete
let NERDTreeQuitOnOpen = 1
let NERDTreeWinPos= "right"
let g:NERDTreeDirArrows = 1
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 0
let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1 
let &errorformat="%f:%l:%c: %t%*[^:]:%m,%f:%l: %t%*[^:]:%m," . &errorformat

let g:formatdef_CFormat = '"astyle --style=google --align-reference=name --align-pointer=name --mode=c --pad-header"'
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

let g:ale_linters = {'python': ['flake8'], 'c': ['gcc'], 'cpp': ['g++']}

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

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
let g:ycm_filetype_whitelist = {'c': 1, 'cpp': 1,  'python': 1 }
let g:ycm_semantic_triggers =  {
  \   'c': ['->', '.'],
  \   'cpp,cuda': ['->', '.', '::'],
  \   'java,javascript,python': ['.']}
set splitbelow

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" disable deletion on the autoindent, but allow delete old words and start
set backspace=eol,start

" ctrlp setting
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_map='<c-e>'

" vsearch.vim
" Visual mode search
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  " Use this line instead of the above to match matches spanning across lines
  "let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>

cabbrev Ack Ack!
