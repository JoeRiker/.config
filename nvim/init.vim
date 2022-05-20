" Alexandro Ghettini 2022
" .vimrc Compatibile con ViM e NeoViM
"
" Variabili percorso da personalizzare
let g:percorso_autoload='~/.local/share/nvim/site/autoload'
let g:percorso_plugin='~/.local/share/nvim/site/plugged'
let g:github_plugmanager='https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

" Impostazioni di base
:syntax enable			" Abilita colorazione codice
:set number				" Imposta numeri di linea
:set relativenumber		" Imposta numerazione di linea relativa
:set autoindent			" Attiva auto indentazione
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

" Auto installa vim-plug se non presente
if empty(glob(g:percorso_autoload.'/plug.vim'))
  exe "silent !curl -fLo ".g:percorso_autoload."/plug.vim --create-dirs ".
    \ g:github_plugmanager
endif

" Definizione Plugins
call plug#begin(g:percorso_plugin)

Plug 'http://github.com/tpope/vim-surround'					" Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree'				" NerdTree
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'		" git 4 NerdTree
Plug 'https://github.com/tpope/vim-commentary'				" For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline'			" Status bar
Plug 'https://github.com/lifepillar/pgsql.vim'				" PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color'					" CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes'		" Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'					" Auto Completion
Plug 'https://github.com/tc50cal/vim-terminal'				" Vim Terminal
Plug 'https://github.com/preservim/tagbar'					" Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors'		" CTRL + N for multiple cursors
" Plug 'https://github.com/ryanoasis/vim-devicons'			" Developer Icons
Plug 'https://github.com/ryanoasis/vim-webdevicons'			" Developer Icons

call plug#end()

" Esegue PlugInstall se trova dei plugin impostati ma non ancora scaricati
" In caso di installazione, riavviare vim/neovim
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Flasha il bordo schermo in caso di errori invece del noioso BEEP
" Non sembra funzionare con neovim
set visualbell

" Usa Unicode
set encoding=UTF-8

" Schema Colori
:colorscheme deus
:hi Normal guibg=NONE ctermbg=NONE

" Imposta retrocompatibilità con ViM
set nocompatible

" Mostra limite 80 caratteri con barra colorata
set colorcolumn=80

" Carico WebDevIcons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Mappatura shortcuts
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <F3> :hi Normal guibg=NONE ctermbg=NONE<CR>
nnoremap <F4> :colorscheme deus<CR>
nnoremap <F8> :TagbarToggle<CR>

:set completeopt-=preview           " For No Previews

" Forza NERDTree a mostrare + (più) per le cartelle chiuse e
" ~ (tilde) per quelle aperte.
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
if argc() == 0
	au VimEnter * ++once NERDTreeToggle
endif

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

