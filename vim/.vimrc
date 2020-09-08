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

" FZF Vim integration (https://github.com/junegunn/fzf/blob/master/README-VIM.md)
Plug 'junegunn/fzf'

" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. 
" The plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-surround'

call plug#end()

" set shell=/bin/zsh

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

" Tive que retirar por enquanto. 27/04/2020
" map I :! pdflatex %<CR><C0R>
" map S :! evince $(echo % \| sed 's/tex$/pdf/') & bg<CR><CR>

" Plugin Auto Save (deu merda quando rodei uma macro)
"let g:auto_save = 1  " enable AutoSave on Vim startup

" Mapeamento: Seleciona todo o texto.
map <C-a> <esc>ggVG<CR>

" Configuração do NERDTree
" autocmd vimenter * NERDTree

" Leitor PDF.
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78


" Configuração do FZF:

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
set number

" Configura filtro :Filter command.
"" command! -nargs=? Filter let @a='' | execute 'g/<args>/y A' | new | setlocal bt=nofile | put! a

" Pega a saída do comando acima e direciona para uma nova tela:
""  "nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

" Seta a verificação ortográfica pt_BR
" set spelllang=pt_BR
" set spell

" Configura tabulação dos arquivos Yaml e Python
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

