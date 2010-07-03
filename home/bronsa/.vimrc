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
set background=dark 
set wildmenu
set wildmode=longest:full
set linespace=0 
set numberwidth=4
set scrolloff=10
set statusline=%F%m%r%h%w[%L][%p%%][%04l,%04v]


autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au BufRead *-sup.*        set ft=mail


hi StatusLine ctermfg=black ctermbg=white
hi StatusLineNC ctermfg=black ctermbg=black
hi Pmenu ctermfg=white ctermbg=darkgray
hi PmenuSel ctermfg=darkred ctermbg=black
hi Comment     term=bold ctermfg=darkgrey
hi SpecialKey    term=bold  ctermfg=darkgray
hi Normal        ctermfg=gray 
hi errormsg     term=standout  ctermfg=white ctermbg=red
hi nontext     term=bold  ctermfg=darkgray
hi PreProc     term=underline ctermfg=darkgreen
hi Constant    term=underline ctermfg=darkred
hi Type        term=underline ctermfg=darkred
hi Statement   term=bold ctermfg=darkyellow
hi Identifier  term=underline ctermfg=darkgreen
hi Ignore      term=bold ctermfg=darkgray
hi Special     term=underline ctermfg=brown
hi Error       term=reverse ctermfg=gray
hi LineNr     ctermfg=darkgrey


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


set viminfo='10,\"100,:20,%,n~/.viminfo
