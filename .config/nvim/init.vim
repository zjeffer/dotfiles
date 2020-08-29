"
" General Settings
"
syntax on
set noswapfile " disable swapfiles
set number     " show line numbers
set expandtab  " always indent using spaces
set tabstop=4  " use 4 spaces for indenting
set shiftwidth=4
set autoindent " automatically follow indentation
set visualbell " dont startle me with this shit...
set nowrap	   " dont wrap lines
set nohlsearch " dont highlight searches
set mouse=a    " allow mouse control
set ignorecase " case insensitive search
"
" Settings when not in vscode
"
if !exists('g:vscode') 
"
" Plugins -> using vim-plug plugin manager
" To install/update the plugins use :PlugInstall
"

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree' " File browser in sidebar
Plug 'Xuyuanp/nerdtree-git-plugin' " git icons for nerdtree 
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete engine
Plug 'ervandew/supertab' " use tab to cycle through autocompletions
Plug 'ternjs/tern_for_vim' " smarter autocompletions 
Plug 'prabirshrestha/async.vim' " depend for vim-lsp
Plug 'prabirshrestha/vim-lsp'   " langue server protocol support
Plug 'lighttiger2505/deoplete-vim-lsp' " language server support for deoplete
Plug 'billyvg/tigris.nvim', { 'do': './install.sh' } " better js highlight
Plug 'vim-airline/vim-airline' " airline theme engine
Plug 'vim-airline/vim-airline-themes' " airline themes
Plug 'arcticicestudio/nord-vim' " nord theme
call plug#end()


augroup nord-theme-overrides
  autocmd!
  " Use lighter color as foreground color for all comments.
  autocmd ColorScheme nord highlight Comment ctermfg=15 guifg=#6e7c99
augroup END



" NERDTree settings
" automatically open nerdtree if we open a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | exec 'NERDTreeFocus' | endif
" Close nvim when only NERDTree remains
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree File highlighting colors
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md',     'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('config', 'gray', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf',   'gray', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('jade',   'yellow', 'none', 'green', '#151515')
call NERDTreeHighlightFile('css',    'Red', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js',     'green', 'none', '#ffa500', '#151515')

" NERDTree git icons
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✹",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" deoplete settings
let g:deoplete#enable_at_startup = 1


" Automatically displays all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1

" for arrows in bar
let g:airline_powerline_fonts = 1

" For javascript language server
if (executable('javascript-typescript-stdio'))
    augroup LspJavascript
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'js-ls',
      \ 'cmd': {server_info->['javascript-typescript-stdio']},
      \ 'whitelist': ['javascript']
      \ })
    augroup END
endif


let g:nord_italic = 1
colorscheme nord
set termguicolors " correct colors


" supertab settings 
let g:SuperTabDefaultCompletionType = "<c-n>"

" enable tigris (better js hightlight)
let g:tigris#enabled = 1

"
" Keybindings
"

" disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>


" open and close NERDTree
map <C-n> :NERDTreeToggle<CR>

endif
