if &compatible
  set nocompatible
endif

set encoding=utf-8

scriptencoding utf-8

set runtimepath+=/Users/masakazutakewaka/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/masakazutakewaka/.vim/bundle')
  call dein#begin(expand('/Users/masakazutakewaka/.vim/bundle'))

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('bronson/vim-trailing-whitespace')
  call dein#add('tpope/vim-endwise')
  call dein#add('justinmk/vim-syntax-extra')
  call dein#add('fatih/vim-go')
  call dein#add('rust-lang/rust.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('posva/vim-vue')
  call dein#add('slim-template/vim-slim')
  call dein#add('slm-lang/vim-slm')
  call dein#add('jparise/vim-graphql')
  call dein#add('morhetz/gruvbox')
  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

map <C-e> :NERDTreeToggle<CR>
map <C-n> gt
map <C-p> gT

"esc →jj"
inoremap <silent> jj <ESC>
"search highlighting off"
nnoremap <C-h> :noh<CR>

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" [Go] syntax highlight 'err'"
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

syntax enable
" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" show hidden files
let NERDTreeShowHidden=1

" 見た目系
" 色
syntax on
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan

" □や○文字が崩れる問題を解決
set ambiwidth=double
