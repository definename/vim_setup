" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif


set number 
set autoindent
set incsearch
set hlsearch

" set list
set winheight=60

function SetColorScheme()
	let color_scheme = "desert"
	execute "colorscheme " . color_scheme
endfunction

call SetColorScheme()

"colorscheme desert
set foldcolumn=3
