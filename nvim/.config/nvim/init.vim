if &compatible
  set nocompatible
endif

" package manager {{{ "
" load packager only when you need it
function! PackagerInit() abort
    packadd vim-packager
    call packager#init()
    call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })

    call packager#add('tpope/vim-sensible')
    call packager#add('tpope/vim-speeddating')
    call packager#add('tpope/vim-surround')
    call packager#add('tpope/vim-repeat')
    call packager#add('tpope/vim-fugitive')

    call packager#add('editorconfig/editorconfig-vim')

    " writing
    call packager#add('junegunn/limelight.vim', { 'type': 'opt' })
    call packager#add('junegunn/goyo.vim', { 'type': 'opt' })
    call packager#add('vim-pandoc/vim-pandoc')
    call packager#add('vim-pandoc/vim-pandoc-syntax')
    call packager#add('vim-pandoc/vim-criticmarkup')

    " R
    call packager#add('jalvesaq/Nvim-R')
    call packager#add('mllg/vim-devtools-plugin')

    " colorschemes
    call packager#add('morhetz/gruvbox', { 'type': 'opt' })
    call packager#add('reedes/vim-colors-pencil', { 'type': 'opt' })
    call packager#add('crusoexia/vim-monokai', { 'type': 'opt' })
endfunction

" package manager
command! PackagerInstall call PackagerInit() | call packager#install()
command! PackagerUpdate call PackagerInit() | call packager#update()
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()
" }}}

" general config {{{ "
" set mapleader
let mapleader = ";"
let maplocalleader = ","

" remap esc
inoremap jk <esc>
tnoremap jk <C-\><C-N>

" switch between windows/even in terminal mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
tnoremap <A-w> <C-\><C-N><C-w>w
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-w> <C-\><C-N><C-w>w
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-w> <C-w>w

" turn off swap/backup files
set noswapfile
set nobackup
set nowritebackup

" undo
if has('persistent_undo')
    silent !mkdir ~/.local/share/nvim/undodir
    set undodir=~/.local/share/nvim/undodir
    set undofile
endif

" modeline
set modeline

" use relative numbers in visual mode
set number
set relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &number | set relativenumber | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &number | set norelativenumber | endif
augroup END

" indentation
set expandtab		" use spaces instead of tab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" show matching brackets
set showmatch

" folding
set foldmethod=syntax

" wrap long lines
set wrap
set textwidth=80
set linebreak       " try to break at spaces etc and not in words
let &showbreak='+++ '
" formatoptions: t = autowrap at textwidth
set formatoptions+=t

" colors
syntax enable
set termguicolors 	 " use true colors
set background=dark
silent! colorscheme gruvbox
set colorcolumn=80  " mark character 80

" disable mouse support
set mouse=

"
set complete+=kspell
" }}}

" autocmd {{{
" remove whitespaces at line endings
autocmd BufWritePre <buffer> call s:TrimTrailingWhitespace()

" (n)vim thinks *.md is Modula-2 but we want markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" coupling of Goyo + Limelight
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" augroup {{{
augroup mail
    autocmd!
    autocmd Filetype mail setlocal spell spelllang=en_us,de_de
    autocmd Filetype mail packadd goyo.vim
    autocmd Filetype mail packadd limelight.vim
    autocmd Filetype mail colorscheme pencil
    autocmd Filetype mail :Goyo
    autocmd BufEnter alot* :normal ggo
augroup END

augroup markdown
    autocmd!
    autocmd Filetype markdown,mkd packadd goyo.vim
    autocmd Filetype markdown,mkd packadd limelight.vim
    autocmd Filetype markdown,mkd colorscheme pencil
augroup END
" }}}

" functions {{{
" take from https://github.com/editorconfig/editorconfig-vim/blob/master/plugin/editorconfig.vim
function! s:TrimTrailingWhitespace()
    if &l:modifiable
        " don't lose user position when trimming trailing whitespace
        let s:view = winsaveview()
        try
            silent! keeppatterns %s/\s\+$//e
        finally
            call winrestview(s:view)
        endtry
    endif
endfunction

" take from https://github.com/junegunn/goyo.vim
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction
" }}}

" abbrevations {{{
ab sgh Sehr geehrter Herr
ab sgf Sehr geehrte Frau
ab sgdh Sehr geehrte Damen und Herren,
ab vg Viele Grüße,<CR><CR>Sebastian
ab bw Best wishes,<CR><CR>Sebastian
ab mfg Mit freundlichen Grüßen<CR><CR>Sebastian Gibb
ab kr Kind regards,<CR><CR>Sebastian Gibb
" }}}

" plugin configuration {{{
" nvim-R
let R_esc_term = 0
let R_path='~/opt/bin/'
let rout_follow_colorscheme = 1
autocmd FileType r set tags+=~/.cache/Nvim-R/Rtags
nmap <LocalLeader>tt :RTestFile<CR>

" markdown, code syntax highlighting in code blocks
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'r']

" ensure that fugitiv/remote access and EditorConfig work together
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}

" vim:foldenable:foldmethod=marker
