" Set leader to ','
let mapleader = ","

""""""""""""""""""""""
"    Colorscheme     "
""""""""""""""""""""""
syntax enable
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

colorscheme molokai

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
augroup NERD
	autocmd!
	autocmd BufEnter * silent! lcd %:p:h
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * silent! :call NERDTreeInit()
	autocmd BufEnter * silent! :call BufInit()
augroup END

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 22

function! BufInit()
   if !(exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
      exe ':NERDTreeFind | wincmd p'
   endif
endfunction

function! NERDTreeInit()
   " If NERDTree is open in the current buffer
   if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
      exe ":NERDTreeFind | wincmd p"
   else
      if (expand("%:t") != '')
         exe ":NERDTreeFind"
      else
         exe ":NERDTreeClose"
      endif
   endif
endfunction

"""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'find %s -type f'

"""""""""""""""""""""

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled = 1
let g:airline_highlighting_cache = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""""""""
let g:vim_logo = [
	\ '	    ##############..... ##############  ', 
	\ '	    ##############......##############  ', 
	\ '	      ##########..........##########    ', 
	\ '	      ##########........##########      ', 
	\ '	      ##########.......##########       ', 
	\ '	      ##########.....##########..       ', 
	\ '	      ##########....##########.....     ', 
	\ '	    ..##########..##########.........   ', 
	\ '	   ...##########.#########............  ', 
	\ '	    ..################JJJ............   ', 
	\ '	      ################.............     ', 
	\ '	      ##############.JJJ.JJJJJJJJJJ     ', 
	\ '	      ############...JJ...JJ..JJ  JJ    ', 
	\ '	      ##########....JJ...JJ..JJ  JJ     ', 
	\ '	      ########......JJJ..JJJ JJJ JJJ    ', 
	\ '	      ######    .........               ', 
	\ '	                  .....         v'.v:version, 
	\]
let g:startify_custom_header =
      \ 'map(g:vim_logo, "\"   \".v:val")'
let g:startify_enable_special      = 0
let g:startify_files_number        = 10 
let g:startify_relative_path       = 1
let g:startify_change_to_dir       = 1
let g:startify_update_oldfiles     = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]
let g:startify_bookmarks = [
        \ { 'HOME': '~/' },
        \ ]
hi StartifyBracket ctermfg=240
hi StartifyFooter  ctermfg=240
hi StartifyHeader  guifg=#2589D0
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set secure			" Run in secure mode
set noro
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set fileencoding=utf-8
set autoread                    " Automatically read changed files
set autoindent                  " Enable Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=longest,menuone
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set updatetime=1000
set cmdheight=2

if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
" Act like D and C
nnoremap Y y$

function! Tabbufn()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bn
    else
        :tabnext
    endif
endfunction

function! Tabbufp()
    let s:tab_count = tabpagenr('$')
    if s:tab_count <= 1
        :bp
    else
        :tabprev
    endif
endfunction

nnoremap <Leader>1 :1b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>2 :2b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>3 :3b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>4 :4b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>5 :5b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>6 :6b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>7 :7b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>8 :8b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>9 :9b<Bar>NERDTreeFind<Bar>wincmd p<CR>
nnoremap <Leader>0 :10b<Bar>NERDTreeFind<Bar>wincmd p<CR>

nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
