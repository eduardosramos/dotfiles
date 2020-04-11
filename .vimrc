set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Entrada para configuração dos Plugins
call plug#begin('~/.vim/plugged')

" The NERDTree is a file system explorer for the Vim editor
Plug 'preservim/nerdtree'

" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'

" Browse GitHub events (user dashboard, user/repo activity) in Vim.
Plug 'junegunn/vim-github-dashboard'

" A code-completion engine for Vim
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

" This plugin will allow Vim to utilize multiple cursors simultaneously.
" Plug 'paradigm/vim-multicursor'

" Bringing Sublime Text's awesome multiple selection feature into Vim,
Plug 'terryma/vim-multiple-cursors'

" vimtex is a Vim plugin that provides support for writing LaTeX documents.
Plug 'lervag/vimtex'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Auto-save
Plug '907th/vim-auto-save'

" AirLine themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plugin for CSV files
Plug 'chrisbra/csv.vim'

" Plugin The jedi autocompletion library for VIM.
Plug 'davidhalter/jedi-vim'

call plug#end()
set shell=/bin/zsh

" Tema durant
let g:airline_theme='durant'

" Habilitando o uso de tabs para transitar entre os arquivos:
" para usar é preciso criar uma tab. :tabnew
" para transitar é só usar as teclas gt
let g:airline#extensions#tabline#enabled = 1

" Mapeamento do multicursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" vim-latex-live-preview settings
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'mupdf-gl'

let g:livepreview_cursorhold_recompile = 0

map I :! pdflatex %<CR><C0R>
map S :! evince $(echo % \| sed 's/tex$/pdf/') & bg<CR><CR>

" Plugin Auto Save (deu merda quando rodei uma macro)
"let g:auto_save = 1  " enable AutoSave on Vim startup

" Mapeamento: Seleciona todo o texto.
map <C-a> <esc>ggVG<CR>

" Configuração do NERDTree
autocmd vimenter * NERDTree
