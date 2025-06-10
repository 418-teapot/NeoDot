" set colorscheme
colorscheme evening

" not generate swapfile
setlocal noswapfile

" always start editing with no code folds
set foldlevelstart=99

" allow the cursor can be positioned where there is no actual character
" in visual block mode
set virtualedit=block

" enable 24-bit RGB color in the TUI
set termguicolors

" enable builtin status line
set laststatus=2

" show show the line and column number of the cursor position
set ruler

" always show builtin tab page line
set showtabline=2

" set builtin status line show format
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ Ln\ %l,\ Col\ %c/%L%)

" string to put at the start of lines that have been wrapped
set showbreak=↳

" show the line number relative to line with the cursor
set number
set relativenumber

" highlight the text line with the cursor
set cursorline

" highlight 81 column
set colorcolumn=81

" `sp` will put the new window below
set splitbelow
" `vsp` will put the new window right
set splitright

" set indent
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set shiftround
set smartindent

" go to previous/next line with h, l, left and right arrow when cursor
" reaches end/beginning of line
set whichwrap=b,s,<,>,[,],h,l

" ignore case when the pattern contains lowercase letters only
set ignorecase
set smartcase

" highlight search content
set hlsearch

" set fold
set foldenable
" set syntax method may slow
" set foldmethod=syntax
set foldmethod=indent
set foldcolumn=0
setlocal foldlevel=1

" set keymap
nnoremap <SPACE> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
vnoremap < <gv
vnoremap > >gv

