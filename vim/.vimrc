" BASIC CONFIG -------------------------------------------------------------- {{{

" 取消与vi兼容
set nocompatible

" 开启文件类型检测
filetype on

" 启用与文件类型相关插件
filetype plugin on

" 启用与文件类型相关的自动缩进
filetype indent on

" 开启语法高亮
syntax on

" 显示行号
set number

" 显示相对行号
set relativenumber

" 突出显示光标所在行
set cursorline

" 设置自动缩进宽度为4个空格
set shiftwidth=4

" 设置tab宽度为4个空格
set tabstop=4

" 使用空格替代tabs
set expandtab

" 不保存backup files
set nobackup

" 光标距离屏幕上下边缘的最小行数
set scrolloff=10

" 禁用行折叠
set nowrap

" 启用增量搜索
set incsearch

" 搜索忽略大小写
set ignorecase

" 启用智能搜索
set smartcase

" 在屏幕底部显示正在输入的命令的部分内容
set showcmd

" 在屏幕的最后一行显示当前模式
set showmode

" 自动匹配括号
set showmatch

" 高亮所有匹配的搜索结果
set hlsearch

" 设置命令历史记录的保存条数
set history=1000

" 启动wildmenu功能
set wildmenu

" 设置wildmenu补全的行为
set wildmode=list:longest

" 设置文件补全时忽略部分文件
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" 设置编码
set encoding=utf-8

" 设置更新延迟为 300ms
set updatetime=300

" 使用显示 signcolumn
set signcolumn=yes

" 提高高亮效果的性能
set lazyredraw

" 启用折叠
set foldenable
set foldmethod=manual

" 剪切板设置
set clipboard=unnamedplus

" }}}

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs', {'do': 'git fetch --depth 1'}
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-illuminate'
Plug 'ap/vim-buftabline'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'github/copilot.vim'
Plug 'DanBradbury/copilot-chat.vim'

call plug#end()


" }}}

" GLOBAL SETTING ---------------------------------------------------------{{{

" buffer 配置
let g:buftabline_show = 1
let g:buftabline_number = 2
let g:buftabline_indicators = 1


" theme config
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox
" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" 设置默认前导键为space
let mapleader = " "

" NERDTree map
nnoremap <leader>e :NERDTreeToggle<CR>

" Coc map
" 跳转到定义
nmap <silent><nowait> gd <Plug>(coc-definition)
" 跳转到实现
nmap <silent><nowait> gi <Plug>(coc-implementation)
" 跳转到引用
nmap <silent><nowait> gr <Plug>(coc-references)
" 打开链接
nmap <silent><nowait> gx <Plug>(coc-openlink)

" 使用 K 键显示文档
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" 使用 Tab 触发补全
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 Shift+Tab 来导航到上一个补全项
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" 使用 Enter 确认补全
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-w)
nmap <leader>j <Plug>(easymotion-j)
nmap <leader>k <Plug>(easymotion-k)

" Code Relative Action
nmap <leader>ca <Plug>(coc-codeaction-cursor)
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cd <Plug>(coc-diagnostic-info)
nmap <leader>cf <Plug>(coc-format)


" Diagnostic
nmap ]d <Plug>(coc-diagnostic-next)
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]e <Plug>(coc-diagnostic-next-error)
nmap [e <Plug>(coc-diagnostic-prev-error)



" 配置buffer快捷键
nnoremap L :bnext<CR>
nnoremap H :bprevious<CR>
nnoremap <leader>bd :bd<CR>

" 配置搜索快捷键
nnoremap <leader>ss :Vista!!<CR>
nnoremap <leader>sS :Rg<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>ft :terminal<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sc :Commands<CR>
nnoremap <leader>gg :Git<CR>
nnoremap <leader>sf :Filetypes<CR>

" 配置分屏
nnoremap <leader>ww :wincmd w<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wd :close<CR>
nnoremap <leader><Bar> :vsplit<CR>

" 代码折叠快捷键
nnoremap <leader>za :foldtoggle<CR>


" Copilot 快捷键
imap <C-Right> <Plug>(copilot-accept-word)
imap <C-M-Right> <Plug>(copilot-accept-line)
nmap <leader>aa :CopilotChatToggle<CR>
nmap <leader>am :CopilotChatModels<CR>
nmap <leader>af :CopilotChatFocus<CR>
nmap <leader>an :CopilotChatOpen<CR>

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
augroup filetype_verilog
  autocmd!
  autocmd BufNewFile,BufRead *.v,*.vh set filetype=verilog
  autocmd BufNewFile,BufRead *.sv,*.svh set filetype=systemverilog
  autocmd FileType verilog,systemverilog setlocal tabstop=4 shiftwidth=4 expandtab
augroup END

augroup assembly
  autocmd!
  autocmd BufRead,BufNewFile *.asm set filetype=asm
  autocmd BufRead,BufNewFile *.s set filetype=asm
  autocmd BufRead,BufNewFile *.S set filetype=asm
augroup END



" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif


" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
endif

if (has("termguicolors"))
  set termguicolors
endif

" }}}
