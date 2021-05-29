""""""""""""""""""""""
" Macros
" LaTex
let @t=":w \<cr> :!pdflatex -output-directory '%:p:h'  '%:p' \<cr> :!rm '%:p:r.aux' '%:p:r.log' '%:p:r.out' \<cr>"
let @1="i\\begin{lstlisting}[language=R]"
" System
let @s=":!wakeonlan -i 192.168.86.255 9c:5c:8e:bf:fc:c3 \<cr> i ssh ling@222.164.164.230 -p 99 \<Esc> yydd"
" R
let @r=":term Rscript % \<cr>"
" Python
let @p=":term python % \<cr>"

let g:SimpylFold_docstring_preview=1
let python_highlight_all=1
let R_assign = 0

"""""""""""""""
" Preferences
syntax on
set number
set tabstop=4
set softtabstop=4
set textwidth=120
set autoindent
set fileformat=unix
set shiftwidth=4
set expandtab
set foldmethod=indent
set foldlevel=99
set encoding=utf-8
set ignorecase "ignore search case
set cmdheight=2
set updatetime=300
set spelllang=en "spell check
set spell " always on spell check

"""""""""""""""""""
" Plugin
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

""""""""""""""""""
" R plug in
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'

"""""""""""""""""
" Python plug in
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/indentpython.vim'

" Syntax check
Plug 'vim-syntastic/syntastic'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" LaTeX
Plug 'vim-scripts/Latex-Text-Formatter'
            
" status bar
Plug 'vim-airline/vim-airline'

" terminal fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" gruvbox
Plug 'morhetz/gruvbox'

" navigation shortcut
Plug 'christoomey/vim-tmux-navigator'

" vim interact with kernel
Plug 'preservim/vimux'

" Initialize plugin system
call plug#end()

""""""""""""""
" Gruvbox
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"

"""""""""""""""
" map keys
" map find files
nmap <silent> <C-f> :Files<CR>
" map vimux command
map <Leader>vp :VimuxPromptCommand<CR>

" COC settings
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
