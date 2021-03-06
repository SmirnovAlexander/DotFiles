"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=UTF-8         " Set UTF8 as standard encoding and en_US as the standard language.
set nocompatible           " Disable vi compatible mode.
set hidden                 " Buffer option
set clipboard=unnamedplus  " Single clipboard for vim and outer space.
set ignorecase             " Case insensetive search.
filetype plugin on         " Sets different options for different filetypes.
let mapleader = "\<Space>" " Setting leader key.

set noswapfile " Disable swap file.

" Edit text even if in russian layout.
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Folder vim code templates.
let $TEMPLATES = "~/.config/nvim/templates/"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

" Motions.
Plug 'tpope/vim-surround'                 " Surround motions.
Plug 'vim-scripts/ReplaceWithRegister'    " Replace motions.
Plug 'tpope/vim-commentary'               " Comments motions.

" Text objects.
Plug 'kana/vim-textobj-user'              " Plugin to add objects.
Plug 'kana/vim-textobj-indent'            " Indent object.
Plug 'kana/vim-textobj-line'              " Line object.
Plug 'kana/vim-textobj-entire'            " Whole file object.
Plug 'bps/vim-textobj-python'             " Python functions and classes objects.

" Visual changes.
Plug 'preservim/nerdtree'                 " File browser.
Plug 'vim-airline/vim-airline'            " Status line.
Plug 'junegunn/goyo.vim'                  " Zen mode.

" Color changes.
Plug 'ryanoasis/vim-devicons'             " Adding icons support (NerdTree).
Plug 'gko/vim-coloresque'                 " Highlight color text with it's color.
Plug 'mboughaba/i3config.vim'             " Coloring i3 config.
Plug 'rafi/awesome-vim-colorschemes'      " Color schemes.

" Editing.
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }   " Prettifying web files.
Plug 'dense-analysis/ale'                 " Linter.
Plug 'rhysd/vim-clang-format'             " Prettier cpp.
Plug 'ycm-core/YouCompleteMe'             " Autocompletions.

" Etc.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}       " Previewing md files.
Plug 'chrisbra/csv.vim'                   " csv editing.

call plug#end()

" Plugins settings.
" let g:loaded_youcompleteme = 1


let g:mkdp_browser = 'brave'                  " specify browser to open preview page
let g:prettier#autoformat_require_pragma = 0  " Do not require vim-prettier annotation to prettify.
let NERDTreeShowHidden=1                      " Show hidden files NerdTree.
let g:python3_host_prog = "/usr/bin/python3"
let g:airline#extensions#tabline#enabled = 1  " Enable tabline
let g:airline#extensions#tabline#formatter = 'unique_tail' " Display only filename.
let g:airline#extensions#tabline#enabled = 1           " enable airline tabline
let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
" let g:airline#extensions#tabline#fnamemod = ':t'       " disable file paths in the tab
let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
let g:airline#extensions#tabline#tab_min_count = 2     " minimum of 2 tabs needed to display the tabline
let g:airline#extensions#tabline#show_splits = 0       " disables the buffer name that displays on the right of the tabline
let g:airline#extensions#tabline#show_tab_nr = 0       " disable tab numbers
let g:airline#extensions#tabline#show_tab_type = 0     " disables the weird ornage arrow on the tabline

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
autocmd BufWinEnter * silent NERDTreeMirror   " Open the existing NERDTree on each new tab.

let b:csv_arrange_align = 'l'                " csv.vim arrange columns to left.

" Plugin remaps.
nnoremap <leader>n :NERDTreeToggle<CR>            " Toggle NerdTree.
nnoremap g[ [pfzz                                 " Go to next function with python textobj plugin.
nnoremap g] ]pfzz                                 " Go to previous function with python textobj plugin.
nnoremap <leader>a :%ArrangeColumn<CR>            " csv.vim arrange columns.
nnoremap <leader>u :%UnArrangeColumn<CR>          " csv.vim arrange columns.
nnoremap <leader>m :MarkdownPreview<CR>           " Toggle md preview.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remaps.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcutting split navigation, saving a keypress:
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
map <S-h> <C-w>h
map <S-j> <C-w>j
map <S-k> <C-w>k
map <S-l> <C-w>l

" Remaps in normal mode.
nmap j gj
nmap k gk
nmap <CR> o<Esc>
nmap 1 A<esc>p
nnoremap <leader>ы :w<CR>               " Save.
nnoremap <leader>c :setlocal spell!<CR> " Toggle spellcheck.
nnoremap <leader>l :set lbr!<CR>        " Toggle word splits.
autocmd FileType tex nnoremap <Leader>p :%!latexindent<CR> " Prettify latex files.
autocmd FileType cpp nnoremap <Leader>p :ClangFormat<CR> " Prettify cpp files.
nnoremap _ :vertical resize -5<CR>      " Resizing shortcuts.
nnoremap + :vertical resize +5<CR>
map <C-o> <C-o>zz                       " Center screen after moving.
map <C-i> <C-i>zz
nnoremap <C-j> :join!<CR>               " Joing lines.

" Remaps in insert mode.
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Tabs switching.
" nnoremap <C-j> :tabprevious<CR>                                                                            
" nnoremap <C-k> :tabnext<CR>
nnoremap <S-j> :tabprevious<CR>                                                                            
nnoremap <S-k> :tabnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on          " Syntax highlighting.
set number         " Display current line number.
set relativenumber " Display relative line number.

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright

" Hints when entering commands.
set wildmenu                       
set wildmode=list:longest,full

" Changing cursor mode when entering insert mode.
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

set scrolloff=2  " Keep lines before and after cursor when scrolling.
" " Setting colorsheme.
" let g:gruvbox_contrast_dark = 'soft'
" colorscheme gruvbox

" " Transparent background.
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable autocomment on next line.
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Indentaion rules.
set expandtab     " Insert spaces when tab is pressed.
set tabstop=4     " Number of spaces to tab.
set shiftwidth=4  " Number of spaces inserted for indentation.
set smarttab      " Inserts blanks according to rules.
set smartindent   " Autoindenting when starting a new line.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute make watch in current directory.
command Mw execute '!tmux new -d make watch'

" Kill tmux session which was created from make watch.
" command Kt execute '!pkill -f "tmux new"'
command Kt execute '!killall make'

" Open pdf in same folder with same name.
let $NAME = expand('%:r')
command Pdf execute "silent !zathura $NAME.pdf > /dev/null 2>&1 &"
command Comp execute "silent !pandoc $NAME.md -o $NAME.pdf"

" Save file even with no access.
command Ss execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex shortcuts.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype tex nmap <leader>b :read $TEMPLATES/latex/frame.tex <CR>
autocmd filetype tex nmap <leader>i :read $TEMPLATES/latex/itemize.tex <CR>
autocmd filetype tex nmap <leader>f :read $TEMPLATES/latex/figure.tex <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" HTML shortcuts.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype html inoremap ,b <b></b><space><++><esc>fbt>i
autocmd filetype html inoremap ,it <em></em><space><++><esc>fet>i
autocmd filetype html inoremap ,1 <h1></h1><enter><enter><++><esc>2kf<i
autocmd filetype html inoremap ,2 <h2></h2><enter><enter><++><esc>2kf<i
autocmd filetype html inoremap ,3 <h3></h3><enter><enter><++><esc>2kf<i
autocmd filetype html inoremap ,p <p></p><enter><enter><++><esc>02kf>a
autocmd filetype html inoremap ,a <a<space>href=""><++></a><space><++><esc>14hi
autocmd filetype html inoremap ,e <a<space>target="_blank"<space>href=""><++></a><space><++><esc>14hi
autocmd filetype html inoremap ,ul <ul><enter><li></li><enter></ul><enter><enter><++><esc>03kf<i
autocmd filetype html inoremap ,li <esc>o<li></li><esc>f>a
autocmd filetype html inoremap ,ol <ol><enter><li></li><enter></ol><enter><enter><++><esc>03kf<i
autocmd filetype html inoremap ,im <img src="" alt="<++>"><++><esc>fcf"a
autocmd filetype html inoremap ,td <td></td><++><esc>fdcit
autocmd filetype html inoremap ,tr <tr></tr><enter><++><esc>kf<i
autocmd filetype html inoremap ,th <th></th><++><esc>fhcit
autocmd filetype html inoremap ,tab <table><enter></table><esc>o
autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType html inoremap ,di <div class=""><Enter><Enter></div><enter><enter><++><esc>3kcc
