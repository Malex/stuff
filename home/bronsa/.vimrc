set nocompatible 
set ls=2       
set tabstop=4   
set shiftwidth=4 
set scrolloff=3 
set showcmd     
set hlsearch     
set incsearch     
set ruler          
set visualbell t_vb=
set novisualbell 
set nobackup  
set number    
set ignorecase 
set ttyfast     
set modeline     
set shortmess=atI  
set nostartofline   
set autoindent  
set smartindent  
set cindent       
set sm         	   
syntax on           
set wildmenu
set wildmode=longest:full
set linespace=0 
set numberwidth=4
set scrolloff=10
set statusline=%F%m%r%h%w[%L][%p%%][%04l,%04v]
set ofu=syntaxcomplete#Complete


filetype plugin on

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set complete=.,w,b,u,t,i
set completeopt=menuone,menu,longest,preview
set omnifunc=syntaxcomplete#Complete

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au BufRead *-sup.*        set ft=mail

"source .vim/plugins/supertab.vim

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

set fileencodings=utf-8
set encoding=utf-8
set termencoding=utf-8

map <C-t> :tabnew<CR>
map <C-c> :tabclose<CR>
map <C-N> :tabNext<CR>
map <C-P> :tabprevious<CR>
map Q :q!<CR>
map S :shell<CR>
map W :w<CR>
map q :q<CR>
map s :s<CR>
map t :tabnew<CR>:e 
map . <C-r>

filetype plugin indent on
set spelllang=it
set viminfo='10,\"100,:20,%,n~/.viminfo

