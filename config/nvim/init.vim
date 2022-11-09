set number

set mouse=a
set selection=exclusive
set selectmode=mouse,key

let mapleader=" "

""NerdTree插件的配置信息
 
""打开vim时,自动打开NERDTree
autocmd vimenter * NERDTree
""将F2设置为开关NERDTree的快捷键
map <F2> :NERDTreeMirror<CR>
map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1


let g:python3_host_prog ="/Users/king/opt/miniconda3/bin/python3"

call plug#begin('/Users/king/.dotfiles/config/nvim/plugged')
  Plug 'Yggdroot/indentLine'  "缩进指示线
  Plug 'flazz/vim-colorschemes'


  Plug 'vim-airline/vim-airline' "状态栏
  Plug 'tpope/vim-sensible'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  nnoremap <silent> <C-p> :Files<CR>   " activate fzf by ctrl-p
  Plug 'simnalamburt/vim-mundo'  " mundo for navigate in undo-tree {
  Plug 'vim-airline/vim-airline'   " vim-airline for pretty status bar
  nnoremap <F4> :MundoToggle<CR>
  Plug 'vim-scripts/indentpython.vim' "python 代码缩进
Plug 'jiangmiao/auto-pairs' " 自动补全括号和引号等
Plug 'vim-airline/vim-airline-themes' "颜色演示地址 https://github.com/vim-airline/vim-airline/wiki/Screenshots 
let g:airline_solarized_bg='dark'
Plug 'scrooloose/nerdcommenter' "快速注释工具
Plug 'dense-analysis/ale' "代码检查工具
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-surround' " 
filetype plugin on
Plug 'scrooloose/nerdcommenter'

Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'elzr/vim-json'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
"Plug 'scrooloose/nerdtree-project-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'liuchengxu/vista.vim'




Plug 'mhinz/vim-startify'

Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500


Plug 'easymotion/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)


"" debugger配置
Plug 'idanarye/vim-vebugger'


" Telescope 配置
"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



call plug#end()


"""""" 主题颜色配置

colorscheme  tokyonight

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

nnoremap <Leader>a<Tab> :echom "Hello, World"<cr>
nnoremap <Leader>1 :echom "THis is one"<cr>
" 插件配置区域
" nerdtree 配置
map <leader>t :NERDTreeToggle<CR>
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=30
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
""""""""""""""""""""""""""""""
"nerdtree-git-plugin settings
""""""""""""""""""""""""""""""
let g:NERDTreeShowIgnoredStatus = 1

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


""""""""""""""""""""""""""""""
"vim-nerdtree-syntax-highlight settings
""""""""""""""""""""""""""""""
"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

"Show line number.
let g:NERDTreeShowlineNumber=1

"Show hide file.
let g:NERDTreeHidden=0

"Show Node model.
let NERDTreeDirArrows=1

"Delete help information at the top
let NERDTreeMinimalUI=1

let g:NERDTreeDirArrowExpandable = '|'

let g:NERDTreeDirArrowCollapsible = '/'

"Highlight full name (not only icons). You need to add this if you don't have vim-devicons and want highlight.
let g:NERDTreeHighlightFolders = 1

"highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1

"you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:Turquoise = "40E0D0"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = "FE405F"
let s:git_orange = "F54D27"
let s:gray = "808A87"

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['o'] = s:gray " sets the color of o files to blue
let g:NERDTreeExtensionHighlightColor['h'] = s:blue " sets the color of h files to blue
let g:NERDTreeExtensionHighlightColor['c'] = s:green " sets the color of c files to blue
let g:NERDTreeExtensionHighlightColor['cpp'] = s:green " sets the color of cpp files to blue
let g:NERDTreeExtensionHighlightColor['c++'] = s:green " sets the color of c++ files to blue


""""""""""""""""""""""""""""""
"vim-devicons settings
""""""""""""""""""""""""""""""`
set encoding=UTF-8

"Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1

"whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

"adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

"adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1



" which key 配置
"
" let g:mapleader="\<Space>"

