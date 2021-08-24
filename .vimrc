syntax on

" —————————— Plugins ——————————
call plug#begin('~/.vim/plugged')

Plug 'danilo-augusto/vim-afterglow'
Plug 'bignimbus/pop-punk.vim'
Plug 'rakr/vim-one'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
Plug 'mattn/emmet-vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

" —————————— General Settings ——————————
set noerrorbells            " No beeps
set tabstop=2 softtabstop=2 shiftwidth=2
set expandtab
set smartindent
set number                  " Show line numbers
set nowrap                  " Stop line breaking
set smartcase               " But not it begins with upper case 
set noswapfile              " Don't use swapfile
set nobackup                " Don't create annoying backup files
set undofile
set undodir=~/.vim/undodir
set incsearch               " Shows the match while typing
set splitright              " Split vertical windows right to the current windows
set autowrite               " Automatically save before :next, :make etc.
set pumheight=10            " Completion window max size
set noshowmode              " Disabled default text view 'INSERT-NORMAL' etc.

colorscheme one

if executable('rg')
  let g:rg_derive_root='true'
endif

let g:ctrlp_user_command=['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader=' '
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:ctrlp_dont_split='nerdtree'
let g:ctrlp_use_caching=0
let g:airline_theme='one'
" let g:airline_section_c = '🎸 %F'
" let g:terminal_ansi_colors = pop_punk#AnsiColors()
let g:prettier#autoformat=0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync

" Emmet config for jsx
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

" Open Nerd Tree when there was no file on the command line:
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

" Autocomplete Menu color settings
function! s:SetHighlightings()
  highlight Pmenu ctermbg=LightGray ctermfg=Black
  highlight PmenuSel ctermbg=Black ctermfg=LightGray
  highlight Pmenu guibg=gray10 guifg=LightSteelBlue4
  highlight PmenuSel guibg=gray10 guifg=LightSteelBlue1
endfunction
call s:SetHighlightings()
autocmd ColorScheme * call <SID>SetHighlightings()

" —————————— Custom Maps ——————————
nnoremap <leader><Left> :wincmd h<CR>
nnoremap <leader><Down> :wincmd j<CR>
nnoremap <leader><Up> :wincmd k<CR>
nnoremap <leader><Right> :wincmd l<CR>
nnoremap <leader>v :vsp<CR>
nnoremap <leader>t :term<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :TagbarToggle<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
imap <leader><Tab> <C-y>,

" Move line single or multiple
nnoremap <S-UP> :m .-2<CR>==
nnoremap <S-DOWN> :m .+1<CR>==
vnoremap <S-UP> :m '<-2<CR>gv=gv
vnoremap <S-DOWN> :m '>+1<CR>gv=gv
