""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SEARCH OPTIONS

" Jump to search result when typing
set incsearch
" Highlight all found results
set hlsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VISUAL OPTIONS

" Relative line number"
" set rnu
" Show line number
set number
" Show horizontal ruler (line and  symbol number)
set ruler
" Show all characters
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" Show whitespace characters
set list
" Save indentetion from previous line when <CR>
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS

"""""""""""""""""""""""""" CTRLP

" Turn off ctrlp cwd feature
let g:ctrlp_working_path_mode = 0

"""""""""""""""""""""""""" NERDTree

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Run NERDTree
map <F4> :NERDTreeToggle<CR>
imap <F4> <Esc>:NERDTreeToggle<CR>
vmap <F4> <Esc>:NERDTreeToggle<CR>

""""""""""""""""""""""""""" Taglist

" Run Taglist
map <F2> :TlistToggle<CR>
imap <F2> <Esc>:TlistToggle<CR>
vmap <F2> <Esc>:TlistToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WINDONWS

" Window resizing
map <F5> <C-W><
map <F6> <C-W>>
map <F7> <C-W>+
map <F8> <C-W>-
" Full size
map <F3> <ESC>:vertical resize<cr>:resize<cr>
" Equal size
map <F10> <ESC><C-w>=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Probaby has to be deleted!

" Set colorschema using function
function SetColorScheme()
	let color_scheme = "desert"
	execute "colorscheme " . color_scheme
endfunction
call SetColorScheme()
