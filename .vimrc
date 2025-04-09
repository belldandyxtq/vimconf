"installing plugin
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/taglist.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/errormarker.vim'
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
Plug 'tpope/vim-repeat'
Plug 'github/copilot.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim' " async completion
Plug 'prabirshrestha/asyncomplete-lsp.vim' " lsp source
Plug 'dense-analysis/ale' " Asynchronous Lint Engine (uses vim-lsp)
Plug 'sheerun/vim-polyglot' " syntax highlighting for all
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'lambdalisue/vim-pyenv'
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

function! SideToggle()
:GitGutterToggle
:ALEToggle
:set nu! rnu!
:set list!
let g:indentLine_char = '┆'
:set foldcolumn=0
endfunction
let g:ale_completion_enabled = 0
let g:ale_linters = {
            \ 'python': ['flake8'],
            \}
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'python': ['autopep8', 'black', 'isort'],
            \   'javascript': ['eslint'],
            \}
let g:ale_python_black_options = '--line-length 120'
let g:ale_fix_on_save = 1

nnoremap <C-d> :NERDTreeToggle<CR>
nnoremap <C-t> :TlistToggle<CR>
nnoremap <C-a> :Autoformat<CR>
nnoremap <C-n> :cn <CR>
nnoremap <C-p> :cN <CR>
nnoremap <C-]> g<C-]>
nnoremap <tab> :call SideToggle()<CR>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

inoremap <C-c> <Esc>

autocmd Filetype c      set omnifunc=ccomplete#Complete
autocmd Filetype html   set omnifunc=htmlcomplete#CompleteTags
autocmd Filetype xml    set omnifunc=xmlcomplete#CompleteTags
autocmd Filetype tex    set omnifunc=syntaxcomplete#Complete
autocmd FileType nerdtree set norelativenumber
autocmd FileType taglist set norelativenumber
autocmd filetype c,cpp inoremap { {<CR>}<Esc>ko
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

set tabstop=4
set expandtab
set shiftwidth=4
set list

hi Terminal ctermfg=blue guibg=lightgrey guifg=blue
set laststatus=2

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

set encoding=utf-8

set cursorline
set scrolloff=10

" auto select the first complete
let g:SuperTabLongestHighlight = 1

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" disable deletion on the autoindent, but allow delete old words and start
set backspace=eol,start,indent

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

" jedi setting
let g:jedi#show_call_signatures = 2
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0
if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:ale_linters = {
      \   'python': ['mypy'],
      \}

let g:ale_fixers = {
            \   'python': ['isort', 'black', "autopep8"],
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \}

let g:ale_fix_on_save = 1
let g:ale_mypy_options = '--line-length 120'

autocmd ColorScheme * highlight ALEVirtualTextError guifg=#FF0000 guibg=#ECEC53
autocmd ColorScheme * highlight ALEVirtualTextWarning guifg=#38ff38 guibg=#318ce7
highlight Pmenu ctermbg=gray guibg=gray


let g:deoplete#enable_at_startup = 0
