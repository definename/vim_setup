" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

set number
set autoindent
set incsearch
set hlsearch

" Show all characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Set colorschema using function
function SetColorScheme()
	let color_scheme = "desert"
	execute "colorscheme " . color_scheme
endfunction
call SetColorScheme()
