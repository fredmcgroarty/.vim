set number 
syntax on 
filetype plugin indent on
filetype on  
filetype indent on

set spelllang=en_gb
set hidden

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

"auto remove trailing whitespace
autocmd BufWritePre *.rb :%s/\s\+$//e

set runtimepath^=~/.vim/bundle/ctrlp.vim

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
	" === Git Pluginins === "
	" Enable git changes to be shown in sign column
	Plugin 'mhinz/vim-signify'
	Plugin 'tpope/vim-fugitive'

	" auto completion 
	Plugin 'Shougo/deoplete.nvim'
	Plugin 'roxma/nvim-yarp'
	Plugin 'roxma/vim-hug-neovim-rpc'
	Plugin 'tpope/vim-surround'

	" === Javascript Pluginins === "
	" Typescript syntax highlighting
	Plugin 'HerringtonDarkholme/yats.vim'

	" ReactJS JSX syntax highlighting
	Plugin 'vim-ruby/vim-ruby'

	" === Syntax Highlighting === "

	Plugin 'vim-syntastic/syntastic'
	" Syntax highlighting for nginx
	Plugin 'chr4/nginx.vim'

	" Syntax highlighting for javascript libraries
	Plugin 'othree/javascript-libraries-syntax.vim'

	" Improved syntax highlighting and indentation
	Plugin 'othree/yajs.vim'

	" Dictionary 
	Plugin 'reedes/vim-wordy'
	
	" Snippets
	"
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'

	" === UI === "
	" File explorer
	Plugin 'scrooloose/nerdtree'

	" Themes 
	Plugin 'vim-airline/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

set mouse=a
let g:deoplete#enable_at_startup = 1
" SETTINGS

" Remap leader key to ,
let g:mapleader=','

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



