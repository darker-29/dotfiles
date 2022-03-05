set nocompatible
filetype off

let mapleader = "\<SPACE>"

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/"))
    echo "install neobundle..."
    :call system("git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim")
endif

" set the runtime path to include Vundle and initialize set rtp+=~/.vim/bundle/Vundle.vim call vundle#begin()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 自動保存設定プラグイン
"https://github.com/vim-scripts/vim-auto-save
" Plugin 'vim-scripts/vim-auto-save'

" shellコマンドの補完機能提供プラグイン
" https://github.com/Shougo/vimshell.vim
Plugin 'Shougo/vimshell'

" NerdTree本体
" https://github.com/preservim/nerdtree
Plugin 'preservim/nerdtree'

" Nerdtree各ディレクトリ・ファイルにgitのステータス表示
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" NerdTreeに表示されるファイルの拡張子ごとにアイコンを表示
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim-nerttree-syntax-highlightの依存先プラグイン
" https://github.com/ryanoasis/vim-devicons
Plugin 'ryanoasis/vim-devicons'

" マークダウンをブラウザ上でプレビュー
" :pv 入力で PrevimOpenを実行
" https://github.com/previm/previm
Plugin 'previm/previm'

" テーブルマークダウン編集モードプラグイン
" :tme 入力で TableModeEnableを実行
" :tmd 入力で TableModeDisableを実行
" https://github.com/dhruvasagar/vim-table-mode
Plugin 'dhruvasagar/vim-table-mode'

" ステータスライン設定
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" vim カラースキーマ 気分で変更
Plugin 'tomasr/molokai'
Plugin 'ltlollo/diokai'
Plugin 'morhetz/gruvbox'

" 入力補助プラグイン
Plugin 'ervandew/supertab'

" コメント入力補助
" \cc => コメント \ci => コメント状態切替 \cA => 行末コメント追加 \cs => ブロックコメント追加
" https://github.com/preservim/nerdcommenter
Plugin 'preservim/nerdcommenter'

" ファイルの即時実行
" https://github.com/thinca/vim-quickrun
Plugin 'thinca/vim-quickrun'

" 構文チェックプラグイン
Plugin 'scrooloose/syntastic'

" git blameやstatus等をvimで実行
Plugin 'tpope/vim-fugitive'

" 矩形選択の拡張プラグイン
" 大文字Kを押す度に拡大、大文字Jを押す度に縮小
" https://github.com/terryma/vim-expand-region'
Plugin 'terryma/vim-expand-region'

" 対応する[], ''などを削除
Plugin 'tpope/vim-surround'

" ??
Plugin 'jiangmiao/auto-pairs'

" git line status
" Plugin 'airblade/vim-gitgutter'

" go plugin
Plugin 'fatih/vim-go'
Plugin 'AndrewRadev/splitjoin.vim'

" jump
Plugin 'easymotion/vim-easymotion'

" PHP補完
Plugin 'phpactor/phpactor'

" Terraformインデント揃え
Plugin 'hashivim/vim-terraform'

" plantumlのシンタックスチェック
Plugin 'aklt/plantuml-syntax'

Plugin 'tyru/open-browser.vim'

call vundle#end()
filetype plugin indent on

" color
syntax on
set background=dark

" favorite colorscheme list
" 1. molokai
" 2. gruvbox
colorscheme gruvbox

" key-bindings
noremap j gj
noremap k gk
noremap vv v$
noremap f $
noremap m 0
noremap , A
noremap ; I
noremap ? O

" buffer key-binds
noremap <silent> <C-j> :bnext<CR>
noremap <silent> <C-k> :bprev<CR>

" NerdTree Enter2回
nnoremap <silent> <Enter><Enter> :NERDTreeToggle<CR>

" ESC2回押下で検索文字のハイライト表示終了
nmap <Esc><Esc> :nohlsearch<CR><Esc>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" インサートモード終了
inoremap <silent> jj <ESC>

" インサートモード終了 & 保存 & 終了
inoremap <silent> <C-j><C-j> <ESC>:wq<Enter>

" ノーマルモードから保存 & 終了
noremap <silent> <Space>nn :wq<Enter>

" ウィンドウ分割
noremap <silent> <Space>vs :vs<Enter>
noremap <silent> <Space>vv :sp<Enter>

" カーソル外のウィンドウ閉じ
noremap <silent> <Space>oo <C-w>o

" ウィンドウ切り替え
noremap <silent> <Space>mm <C-w><C-w>

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
" cmap ali '<,'>Alignta <- //
cmap tme TableModeEnable
cmap tmd TableModeDisable
cmap pinst PluginInstall
cmap plist PluginList
cmap qrun QuickRun

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

" GO カバレッジToggle
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

" PHP用設定
let g:PHP_vintage_case_default_indent = 1
let g:PHP_outdentphpescape = 0
autocmd FileType php,ctp set dictionary=~/.vim/dict/php.dict
inoremap <silent> cc <C-x><C-k>
" autocmd FileType php set makeprg=php\ -l\ %
" autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif

" autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" ステータスバーの設定
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" vim-nerdtree-syntax-highlight プラグインを導入すると遅くなる問題解消設定
" アイコンを表示する拡張子を下記に限定
" .bmp, .c, .coffee, .cpp, .cs, .css, .erb, .go, .hs, .html, .java, .jpg, .js, .json, .jsx, .less, .lua, .markdown, .md, .php, .png, .pl, .py, .rb, .rs, .scala, .scss, .sh, .sql, .vim
let g:NERDTreeLimitedSyntax = 1

"画面表示系
set cursorcolumn " カーソル列のハイライト表示 ←カーソル遅くなる原因
set cursorline " カーソル行のハイライト表示 ←カーソル遅くなる原因
set number " 行数を表示
set showmatch " 対応する記号を強調して表示
set laststatus=2 " ステータス行を2行表示
set scrolloff=20 " 常に20行目がセンターに来るよう移動表示

"ファイル系
set autoread " 他でファイルに変更があった場合に読み込み
set noswapfile " スワップファイルの生成をしない
set hidden " 保存されていないファイルがあっても別のファイルを表示可能
set nobackup " ファイル保存中にバックアップファイルを作らない
set fenc=utf-8 " 保存ファイルの文字コード

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
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

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

" NerdTree vim を実行した場合に現在のディレクトリの表示
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


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

" Terraformのインデント揃え
let g:terraform_fmt_on_save = 1

map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" Chrome上でplantuml表示
au FileType plantuml command! OpenUml : !open "/Applications/Google Chrome.app"

command! LG : !lazygit
