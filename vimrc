"map key1 key2
"map将key1映射为key2.  此外，vim有normal、insert、visual模式,在不同模式下,有各自的映射方式，分别为nmap、imap、vmap；
"map系列有个缺陷就是可能会导致递归映射，所以又有了非递归映射，分别为noremap、nnoremap、inoremap、vnoremap;(nore=no recursive)

"<CR>为回车键
"<Esc>
"<LEADER>
"<F2>
"<C-u>     为Ctrl+u
"<up>  <down>  <left>  <right>

"vi的默认leader键为”/“
let mapleader=","     "设置vim的leader键，一般为逗号或空格
"重新加载vimrc配置文件,"$MYVIMRC"指的是vimrc配置文件，如~/.vimrc
nnoremap <LEADER>r  :w<CR>:source $MYVIMRC<CR>

" 修改Caps_Lock键,silent !CMD
silent !xmodmap -e 'clear Lock' -e 'keycode 66 = Escape'
" 修改Esc键
"silent !xmodmap -e 'keycode 9 = Caps_Lock'
" change word to uppercase  :gU<motion>
inoremap <C-u> <Esc>gUiwea
nnoremap <C-u> gUiw

" 保存、退出
nnoremap <LEADER>w  :w<CR>
nnoremap <LEADER>q  :silent !xmodmap -e 'clear Lock' -e 'keycode 66 = Caps_Lock'<CR>:q!<CR>
nnoremap <LEADER>s  :silent !xmodmap -e 'clear Lock' -e 'keycode 66 = Caps_Lock'<CR>:wq<CR>

set number            "显示行号
set norelativenumber  "是否使用相对行号
syntax on             "语法高亮
set hlsearch          "搜索高亮
set incsearch         "边搜边高亮
noremap <LEADER><CR>  :nohlsearch<CR>   " 取消搜索高亮
set wrap              "自动换行
set cursorline        "显示游标线
set showcmd           "命令模式下，在底部显示，当前键入的指令。比如，键入的指令是2y3d，那么底部就会显示2y3，当键入d的时候，操作完成，显示消失。
set wildmenu          "命令模式自动补全

" 新打开的其他文件，高亮不会延续之前的关键字
exec "nohlsearch"
set ignorecase        "搜索忽略大小
set smartcase         "智能大小写搜索（使用小写搜索时忽略大小写；使用大小写混合或纯大写时，大小写敏感）

" paste模式开关
nnoremap <F2> :set invpaste paste?<CR>
inoremap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>


cnoremap w!! w !sudo tee % >/dev/null
com! FormatJSON %!python3 -m json.tool

"其他配置
set nocompatible      "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
filetype on           "侦测文件类型
filetype indent on    "为特定文件类型载入相关缩进文件
filetype plugin on    "载入文件类型插件
filetype plugin indent on
"set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫

set scrolloff=5       "光标永远停留在屏幕上下第五行
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" 分屏
nnoremap sh  :set nosplitright<CR>:vsplit<CR>   "向左分屏,即:vs
nnoremap sl  :set splitright<CR>:vsplit<CR>     "向右分屏
nnoremap sj  :set splitbelow<CR>:split<CR>      "向下分屏
nnoremap sk  :set nosplitbelow<CR>:split<CR>    "向上分屏,即:sp
" 垂直分屏与左右分屏的切换
nnoremap ss <C-w>t<C-w>H    " 切换为水平分屏
nnoremap sv <C-w>t<C-w>K    " 切换为垂直分屏
" 切换分屏
nnoremap <LEADER>h <C-w>h   "移动光标到左侧分屏;<C-w>表示ctrl+w
nnoremap <LEADER>j <C-w>j
nnoremap <LEADER>k <C-w>k
nnoremap <LEADER>l <C-w>l
" 移动光标到上一个vim窗(previous)
nnoremap <LEADER>p <C-w>p
inoremap <C-p>p <Esc><C-w>p
"调整分屏的大小
nnoremap <up> :res +5<CR>  
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

" 标签页操作
nnoremap te :tabe<CR>       "新建标签页
nnoremap th :-tabnext<CR>   "移动到左标签页
nnoremap tl :+tabnext<CR>   "移动到右标签页


" 替换占位符<++>
nnoremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" 自动plugin下载
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 插件安装
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'         "启动页面
Plug 'vim-airline/vim-airline'    " 状态栏
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'   " 主题
Plug 'kien/ctrlp.vim'             " ctrl+p模糊查询文件并打开
Plug 'easymotion/vim-easymotion'  "文件内快速定位
Plug 'tpope/vim-surround'         "修改成对内容: 增加:ys+motion:iw|t{char}|f{char}+surroundingChar     修改：cs ( }    删除： ds(
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } "多文件模糊搜索
Plug 'junegunn/fzf.vim'
Plug 'brooth/far.vim'             "多文件模糊替换
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " 文件管理器nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
"Plug 'ycm-core/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'
call plug#end()

" ===================================
" =connorholyday/vim-snazzy
" ===================================
let g:SnazzyTransparent = 1
colorscheme snazzy

" ===================================
" === NERDTree
" ===================================
nnoremap tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 如果剩下的唯一窗口是NERDTree，我如何关闭vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  
" NERDTree开关
nnoremap <leader>t :NERDTreeToggle<CR>
" 查找当前文件，跳转到nerdtree中的位置
nnoremap <leader>g :NERDTreeFind<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" ===================================
" = NERDTree-git
" ===================================
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===================================
" = vim-easymotion
" ===================================
nmap ss <Plug>(asymotion-s2)

" ===================================
" = You Complete ME
" ===================================
"nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap g/ :YcmCompleter GetDoc<CR>
"nnoremap gt :YcmCompleter GetType<CR>
"nnoremap gr :YcmCompleter GoToReferences<CR>
"let g:ycm_autoclose_preview_window_after_completion=0
"let g:ycm_autoclose_preview_window_after_insertion=1
"let g:ycm_python_interpreter_path = "/bin/python3"
"let g:ycm_python_binary_path = "/bin/python3"


" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']


" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

nmap <F9> <Plug>MarkdownPreviewToggle

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig


" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>


" ===
" === vim-signiture
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>
