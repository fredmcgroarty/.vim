set number
set re=0
syntax on
filetype plugin indent on

set spelllang=en_gb
set hidden

autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2
" for jsx files
autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2

" Remap leader key to ,
let g:mapleader=','

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i

" switch buffers
:nnoremap <Tab> :bnext<CR>
:nnoremap <S-Tab> :bprevious<CR>

" create new line without entering edit
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"auto remove trailing whitespace
"autocmd BufWritePre *.js, *.jsx :%s/\s\+$//e
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    keepp %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


:nnoremap <F12> :let &mouse=(empty(&mouse) ? 'a' : '')<CR>



set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ale_completion_enabled = 1

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	" === Git Pluginins === "
	" Enable git changes to be shown in sign column
	Plugin 'mhinz/vim-signify'
	Plugin 'tpope/vim-fugitive'

	Plugin 'tpope/vim-unimpaired'
	Plugin 'tpope/vim-repeat'
	" tags
	Plugin 'tmm1/ripper-tags'
	Plugin 'ludovicchabant/vim-gutentags'
	Plugin 'majutsushi/tagbar'

	" auto completion
	Plugin 'roxma/vim-hug-neovim-rpc'
	Plugin 'tpope/vim-surround'
        Plugin 'Shougo/deoplete.nvim'

	Plugin 'mustache/vim-mustache-handlebars'

	" === Javascript Pluginins === "
	" Typescript syntax highlighting
	Plugin 'HerringtonDarkholme/yats.vim'

	" ReactJS JSX syntax highlighting
	Plugin 'vim-ruby/vim-ruby'

	" === Syntax Highlighting === "

	Plugin 'vim-syntastic/syntastic'
	" Syntax highlighting for nginx
	Plugin 'chr4/nginx.vim'

	" Improved syntax highlighting and indentation
	Plugin 'othree/yajs.vim'

	" Syntax highlighting & other shit for elixir
	Plugin 'slashmili/alchemist.vim'
	Plugin 'elixir-editors/vim-elixir'
	" Dictionary
	Plugin 'reedes/vim-wordy'

	" Snippets
	"
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'

	" === UI === "
	" File explorer
	Plugin 'scrooloose/nerdtree'
	Plugin 'ctrlpvim/ctrlp.vim'

	" Themes
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'

	" Run specs in tmux
	Plugin 'janko-m/vim-test'
	Plugin 'jgdavey/tslime.vim'

	" switch between vim & tmux pane using ctrl hjkl
	Plugin 'christoomey/vim-tmux-navigator'

	" SYntax checker
	Plugin 'dense-analysis/ale'	" SYntax checker Plugin 'dense-analysis/ale'
call vundle#end()

"ALE
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_completion_autoimport = 1
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0},'\.rb$': {'ale_enabled': 0}}

let g:airline#extensions#ale#enabled = 1

let g:deoplete#enable_at_startup = 1
" SETTINGS
nmap <leader>a :ALEToggleBuffer<CR>


" Spellchecking etc"
nmap <silent> <leader>s :set spell!<CR>

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>


" show/hide line number "
nmap <leader>l :set invnumber<CR>



" Ultisnips Stuff

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips", "UltiSnips"]

"CTRLp

" keep ctrl p for autocomplete
let g:ctrlp_map = '<leader>p'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_cmd = 'CtrlPMRU'
"vim-test settings
let test#strategy = "tslime"
let g:test#ruby#use_spring_binstub=1
nnoremap <leader>tt :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ta :TestSuite<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tg :TestVisit<cr>


"Ctags
let g:gutentags_ctags_exclude = ['vendor/*', 'tmp/*', 'log/*', 'coverage/*', 'doc/*']
"tagbar settings
let g:tagbar_sort = 0
if executable('ripper-tags')
    let g:tagbar_type_ruby = {
        \ 'kinds'      : ['m:modules',
                        \ 'c:classes',
                        \ 'C:constants',
                        \ 'F:singleton methods',
                        \ 'f:methods',
                        \ 'a:aliases'],
        \ 'kind2scope' : { 'c' : 'class',
                         \ 'm' : 'class' },
        \ 'scope2kind' : { 'class' : 'c' },
        \ 'ctagsbin'   : 'ripper-tags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
endif

nnoremap <leader>] :TagbarToggle<cr>

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
