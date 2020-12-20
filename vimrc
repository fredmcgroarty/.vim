set nocompatible
set encoding=utf8

let g:ale_completion_enabled = 1

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Enable git changes to be shown in sign column
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'

" tags
Plugin 'tmm1/ripper-tags'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'

" Highlighting whitespace
Plugin 'bronson/vim-trailing-whitespace'

" auto completion
Plugin 'tpope/vim-surround'
" === Javascript Pluginins === "
" js/Typescript syntax highlighting
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'peitalin/vim-jsx-typescript'

" ReactJS JSX syntax highlighting
Plugin 'vim-ruby/vim-ruby'

" === Syntax Highlighting === "
Plugin 'vim-syntastic/syntastic'

" Syntax highlighting for nginx
Plugin 'chr4/nginx.vim'

" Improved syntax highlighting and indentation
"
" Syntax highlighting & other shit for elixir
Plugin 'elixir-editors/vim-elixir'

" Dictionary
Plugin 'reedes/vim-wordy'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'elixir-lsp/elixir-ls', { 'do': { -> g:ElixirLS.compile() } }
Plugin 'dense-analysis/ale'

" File explorer
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-projectionist'

" Themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Run specs in tmux
Plugin 'janko-m/vim-test'
Plugin 'jgdavey/tslime.vim'

" switch between vim & tmux pane using ctrl hjkl
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()


let g:coc_global_extensions = ['coc-elixir', 'coc-diagnostic']

set backupdir=~/.vimbackups,/tmp
set directory=~/.vimbackups,/tmp

set lazyredraw
set wildmode=list:longest,full   "make cmdline tab completion similar to bash
set wildmenu                     "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~      "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing /O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
"
"dont show epic message for swapfiles (most of these are bogus for me).
"Use :recover when we actually need to recover from swapfile
set shortmess+=A
"
""load ftplugins and indent files
filetype plugin on
filetype indent on

"turn on syntax highlighting
syntax on

"some stuff to get the mouse going in term
set mouse=a
if !has("nvim")
    set ttymouse=xterm2
endif

set termguicolors
set spelllang=en_gb
set directory=~/.vim/swapfiles//
set runtimepath^=~/.vim/bundle/ctrlp.vim
set hidden

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


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
autocmd BufWritePre * %s/\s\+$//e

:nnoremap <F12> :let &mouse=(empty(&mouse) ? 'a' : '')<CR>

let g:tslime_autoset_pane = 1
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
"ALE conf"
let g:ale_completion_autoimport = 1

let g:ale_linters = {}
let g:ale_linters.scss = ['stylelint']
let g:ale_linters.css = ['stylelint']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_linters.ruby = ['rubocop', 'ruby', 'solargraph']


let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fixers.javascript = ['eslint', 'prettier']
let g:ale_fixers.html = ['prettier']
let g:ale_fixers.scss = ['stylelint']
let g:ale_fixers.css = ['stylelint']
let g:ale_fixers.elm = ['format']
let g:ale_fixers.ruby = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers.elixir = ['mix_format']
let g:ale_fixers.xml = ['xmllint']

let g:ale_sign_column_always = 1
let g:ale_elixir_credo_strict = 1

let g:ale_elixir_elixir_ls_release="~/elixir-lang/release"

let g:deoplete#enable_at_startup = 1

nnoremap dt :ALEGoToDefinition<cr>
nnoremap df :ALEFix<cr>
nnoremap K :ALEHover<cr>

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
"
" Set ultisnips triggers
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ["~/.vim/UltiSnips"]

"CTRLp
" keep ctrl p for autocomplete
let g:ctrlp_map = '<leader>p'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_cmd = 'CtrlPMRU'
"vim-test settings
let test#strategy = "tslime"
let g:test#ruby#use_spring_binstub=1

" vim test
nnoremap <leader>tt :TestNearest<cr>
nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ta :TestSuite<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tg :TestVisit<cr>

"Ctags
let g:gutentags_ctags_exclude = ['vendor/*', 'tmp/*', 'log/*', 'coverage/*', 'doc/*']
"tagbar settings
let g:tagbar_sort = 0

" tag bar ruby
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

" tabar TS
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


" I can't see the background of the autocomplete menu'"
highlight Pmenu ctermbg=gray guibg=gray

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


set guifont=DejaVu\ Sans:s12
