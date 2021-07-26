set nocompatible              " be iMproved, required
filetype off                  " required

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/"))
    echo "install neobundle..."
    :call system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'Shougo/vimshell'

" ファイル関連 Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-colorscheme'

" ウィンドウ関連
Plugin 'scrooloose/nerdtree' " Nerdtree導入
Plugin 'Xuyuanp/nerdtree-git-plugin' " Nerdtree各ディレクトリ・ファイルにgitのステータス表示
Plugin 'ryanoasis/vim-devicons' " Nerdtreeの各ディレクトリ・ファイルのアイコンを表示
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" マークダウン編集
Plugin 'previm/previm' " pv でブラウザ上にマークダウン表示
Plugin 'godlygeek/tabular'
Plugin 'h1mesuke/vim-alignta'
Plugin 'dhruvasagar/vim-table-mode'

" バッファコントロール
Plugin 'rbgrouleff/bclose.vim'

" ステータスライン設定
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" airline カラースキーマ
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'
Plugin 'dsolstad/vim-wombat256i'
Plugin 'junegunn/seoul256.vim'

" vim カラースキーマ 気分で変更
Plugin 'tomasr/molokai'
Plugin 'ltlollo/diokai'
Plugin 'YorickPeterse/happy_hacking.vim'

" 入力補助プラグイン
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mattn/emmet-vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter' " \cc => コメント \ci => コメント状態切替 \cA => 行末コメント追加 \cs => ブロックコメント追加

Plugin 'thinca/vim-quickrun'

" 構文チェックプラグイン
Plugin 'scrooloose/syntastic'

" align
Plugin 'junegunn/vim-easy-align'

" git blameやstatus等をvimで実行
Plugin 'tpope/vim-fugitive'

" 対応する[], ''などを削除
Plugin 'tpope/vim-surround'

" 複数行コメントイン・アウト
Plugin 'tpope/vim-commentary'

" ??
Plugin 'jiangmiao/auto-pairs'

" git line status
Plugin 'airblade/vim-gitgutter'

" go plugin
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'

call vundle#end()

filetype plugin indent on    " required

" color
syntax on
set background=dark

" colorscheme list
" 1. molokai
" 2. diokai
" 3. happy_hacking
"set termguicolors " * が付いているものを使用する場合にコメント解除
colorscheme diokai

" key-bindings
noremap j gj
noremap k gk
noremap v v$
noremap f $
noremap m 0
noremap t %
noremap , A
noremap . I
noremap ? O

" buffer key-binds
noremap <silent> <C-j> :bnext<CR>
noremap <silent> <C-k> :bprev<CR>

" NerdTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nnoremap <leader>a :cclose<CR>
" ESC2回押下で検索文字のハイライト表示終了
nmap <Esc><Esc> :nohlsearch<CR><Esc>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" インサートモードから抜ける
inoremap <silent> jj <ESC>

" jump pear blackets
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vim alias
cmap bc Bclose
cmap tm terminal
cmap pv PrevimOpen
cmap ali '<,'>Alignta <- //
cmap tme TableModeEnable
cmap tmd TableModeDisable
cmap pi PluginInstall
cmap pl PluginList

" Go alias
cmap gr GoRun
cmap gb GoBuild
cmap gtt GoTest
cmap gtf GoTestFunc
cmap gtc GoTestCompile
cmap gcc GoCoverage
cmap gcl GoCoverageClear
cmap gct GoCoverageToggle
cmap gcb GoCoverageBrowser
cmap gim GoImport
cmap gims GoImports
cmap gima GoImportAs
cmap gill GoInstall
cmap gdp GoDrop
"cmap cn cnext
"cmap cp cprevious

" GO カバレッジToggle
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" PHP
let g:PHP_vintage_case_default_indent = 1
let g:PHP_outdentphpescape = 0

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='jet'

"画面表示系
"set cursorcolumn " カーソル列のハイライト表示 ←カーソル遅くなる原因
set cursorline " カーソル行のハイライト表示 ←カーソル遅くなる原因
set number " 行数を表示
set showmatch " 対応する記号を強調して表示
set laststatus=2 " ステータス行を2行表示
set scrolloff=20 "常に20行目がセンターに来るよう移動表示

"ファイル系
set autoread "他でファイルに変更があった場合に読み込み
set noswapfile "スワップファイルの生成をしない
set hidden "保存されていないファイルがあっても別のファイルを表示可能
set nobackup "ファイル保存中にバックアップファイルを作らない
set fenc=utf-8 "保存ファイルの文字コード

set showcmd
set visualbell "ピープ音の無効化
set belloff=all
set ambiwidth=double

set splitbelow
set splitright

" tab indent
set expandtab "タブを入力したとき半角スペースの入力に置き換える
set tabstop=4 "tab押下時のタブ幅
set autoindent "改行時に前の行のインデントを継続するか
set smartindent "改行時前の行の構文をチェックし次のインデントを増減するか否か
set shiftwidth=4 "smartindentの増減幅
set clipboard=unnamed "unnamed指定でヤンク時にクリップボードに保存、autoselectはヤンク前にクリップボードに保存

" search
set ignorecase "検索パターンに大文字小文字の区別をしない
set incsearch "インクリメンタルサーチ、入力された1文字毎に検索を実行
set hlsearch "検索結果をハイライト表示する"
set nowrapscan "最後尾まで検索を終えたら次の検索で先頭に移る

" 行末タブや半角スペースなどの特殊文字
set list
set listchars=tab:>\ ,trail:-,nbsp:%,extends:>,precedes:<
" cursor
set backspace=eol,indent,start
set wildmode=list:longest
set nrformats=""

" 自動保存
set autowrite

" highlight
" ctermbg =>  - の色 ctermfg => 半角スペース可視化色
hi SpecialKey ctermbg=124 ctermfg=124

" PreVim起動時スクリプト
let g:previm_open_cmd = 'open -a Google\ Chrome'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" icon表示の設定
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" NerdTree不可視ファイル表示
let g:NERDTreeShowHidden=1

" バッファ外(空行)のチルダ非表示
highlight link EndOfBuffer Ignore

" vim と実行した場合に現在のディレクトリのノードツリー表示
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" vim-nerdtree-syntax-highlight プラグイン導入すると遅くなる問題解消設定
let g:NERDTreeLimitedSyntax = 1

" thincaさんのカーソルラインが原因で描画遅い問題解消設定
augroup vimrc-auto-cursorline
  autocmd!
  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
  autocmd WinEnter * call s:auto_cursorline('WinEnter')
  autocmd WinLeave * call s:auto_cursorline('WinLeave')

  let s:cursorline_lock = 0
  function! s:auto_cursorline(event)
    if a:event ==# 'WinEnter'
      setlocal cursorline
      let s:cursorline_lock = 2
    elseif a:event ==# 'WinLeave'
      setlocal nocursorline
    elseif a:event ==# 'CursorMoved'
      if s:cursorline_lock
        if 1 < s:cursorline_lock
          let s:cursorline_lock = 1
        else
          setlocal nocursorline
          let s:cursorline_lock = 0
        endif
      endif
    elseif a:event ==# 'CursorHold'
      setlocal cursorline
      let s:cursorline_lock = 1
    endif
  endfunction
augroup END

" 全角スペース
hi ZenkakuSpace cterm=underline ctermbg=124 ctermfg=124 guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/




" go用の設定

filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
au FileType go setlocal sw=4 ts=4 sts=4 noet
au FileType go setlocal makeprg=go\ build\ ./... errorformat=%f:%l:\ %m
filetype plugin indent on
syntax on
