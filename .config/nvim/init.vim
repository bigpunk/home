" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" EasyAlign helps quickly align text blocks around symbols.
Plug 'junegunn/vim-easy-align'

" Add a better status line w/support for open tabs.
Plug 'bling/vim-airline'

" Load nerdtree to browser directory structure in vim.
Plug 'scrooloose/nerdtree'

" vim-go provides go support in vim.
Plug 'fatih/vim-go'

" Allows splitting and joining of lines to convert between single and
" multi line code.
Plug 'AndrewRadev/splitjoin.vim'

" take fatih's color scheme for go.
Plug 'fatih/molokai'

" TODO/bigpunk add snipets support for auto generating code.
" Plug 'SirVer/ultisnips' or 'shougo/neosnippet'

" Plugin options, go code completion.  TODO/bigpunk look at using
" this in the near future.
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Initialize plugin system
call plug#end()

" map leader to ',' character.
let mapleader = ','

" NerdTree configs.
nnoremap <Leader>f :NERDTreeToggle<Enter>

" map hitting j twice in a row to ESC so fingers don't need to leave home row
" as much.
inoremap jj <ESC>

" Set fold level to be very high for now and base it on indenting.
" xxx/bigpunk experiment more with code folding in the future.
set foldmethod=indent
set foldlevelstart=10
set foldlevel=10

" Easy align mappings
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" vim-go suggested mappings and settings.
" autowrites file when calling :make/:GoBuild/etc
set autowrite

" map scrolling through compile errors after calling :GoBuild
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Map to :GoInfo which will display gunction signature in status bar.
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" map building, running, testing, coverage using leader.
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" run :GoBuild or :GoTestCompile based on the go file.
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#test#Test(0,1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" make all list types of type quickfix.  This allows the <C-n> and friends 
" mappings above to work in other lists that vim may have.
let g:go_list_type = "quickfix"

" go testing time out.  This is 10s by default so setting 
" this is meant more as a place holder.
let g:go_test_timeout = '10s'

" highlight matching identifiers
let g:go_auto_sameids = 1

" go syntax highlighting.
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

" set tab-width to 4 for go
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

" Turn on molokai color scheme for go files.
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai


