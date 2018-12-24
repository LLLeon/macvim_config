
set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash
set t_Co=256

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugin
" call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundle.vim'
" 引擎
Plugin 'SirVer/ultisnips'
" 代码块集合
Plugin 'honza/vim-snippets' 
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'drmingdrmer/xptemplate'
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/neosnippet-snippets'

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'dyng/ctrlsf.vim'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'terryma/vim-multiple-cursors' "回车选中相同单词，类似Sublime Command+D

Plugin 'chrisbra/csv.vim'

Plugin 'gregsexton/gitv'
Plugin 'vim-scripts/matchit.zip'
Plugin 'tomtom/tcomment_vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-surround'

Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
Plugin 'raymond-w-ko/vim-lua-indent'
Plugin 'fatih/vim-go'
Plugin 'godoctor/godoctor.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" UI
Plugin 'scrooloose/nerdtree'
"Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'zaki/zazen'
Plugin 'noahfrederick/vim-hemisu'

" Themes
" Plugin 'lifepillar/vim-solarized8'
Plugin 'tomasr/molokai'

Plugin 'ianva/vim-youdao-translater'
Plugin 'AndrewRadev/splitjoin.vim'


call vundle#end()            " required
filetype plugin indent on    " required
syntax on

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.

set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2

set expandtab
set shiftwidth=4
set tabstop=4
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set clipboard=unnamed

let mapleader = ','
set linespace=0
set updatetime=100
set cursorline
" set switchbuf=usetab,newtab     " open new buffers always in new tabs
set switchbuf=usetab,usetab     " open new buffers always in new tabs
set formatoptions+=tcroqw
autocmd FileType go :set noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json :set cole=0
let g:ackhighlight=1
let g:TagmaBufMgrLastLine = 1
let g:NERDTreeDirArrows = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
"}}}
" Colorscheme {{{
" let macvim_skip_colorscheme=1
" let g:molokai_original=1
" set background=light
" }}}
" Map {{{
nmap <c-]> g<c-]>
nmap t ,,s
vmap t ,,s
nmap gst :Gst<CR>
" Run current .go {{{
nmap <S-H> :bp<CR>
nmap <S-L> :bn<CR>
" nmap <S-H> gt
" nmap <S-L> gT
nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> 9gt
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
nmap <expr> <C-J> &diff ? ']c' : '<C-J>'
nmap <expr> <C-K> &diff ? '[c' : '<C-K>'

cmap w!! %!sudo tee > /dev/null %
" simple surround {{{
vmap " S"
vmap ' S'
vmap ` S`
vmap [ S[
vmap ( S(
vmap { S{
vmap } S}
vmap ] S]
vmap ) S)
"}}}

set guioptions=''
" map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l
map <C-h> <C-W>h
set guifont=Source\ Code\ Pro\ Light:h14
set background=dark
colorscheme molokai
" colorscheme solarized8_dark
set fillchars=vert:\ 
" set guifontwide=方正启体简体
"set guifontwide=FZQiTi-S14S
let g:airline_powerline_fonts = 1
set clipboard+=unnamed
set numberwidth=4
func! MyCtrlPTag()
        let g:ctrlp_prompt_mappings = {
                                \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                                \ 'AcceptSelection("t")': ['<c-t>'],
                                \ }
        CtrlPBufTag
endfunc
com! MyCtrlPTag call MyCtrlPTag()
if has("gui_macvim")
        "set transparency=10 " Make the window slightly transparent
        "set fullscreen
	let g:ctrlp_map = '<D-p>'
	nmap <C-]> g<c-]>
        nmap <D-r> :MyCtrlPTag<cr>
        imap <D-r> <esc>:MyCtrlPTag<cr>
	nmap <D-R> :CtrlPBufTagAll<cr>
	imap <D-R> <esc>:CtrlPBufTagAll<cr>
    " 关闭缓冲区，不退出窗口(对未保存的有点小问题)
	nmap <D-w> :bp<bar>sp<bar>bn<bar>bd<CR>
	imap <D-w> <esc>:bp<bar>sp<bar>bn<bar>bd<CR>
	map <D-/> :TComment<cr>
	vmap <D-/> :TComment<cr>gv
	nmap <D-f> :CtrlSF <C-R>=expand("<cword>")<CR>
	imap <D-f> <ESC>:CtrlSF <C-R>=expand("<cword>")<CR>
	vnoremap <D-f>  y :CtrlSF"<C-R>=escape(@", '"')<CR>"
	vnoremap <D-S-f>  y :a
	map <D-e> :NERDTreeTabsToggle<CR>
	map <leader>e :NERDTreeFind<CR><CR>
	"Open sidebar with cmd+k
	" map <D-k> :NERDTreeTabsToggle<CR>
	" Window switch map {{{
	map <D-j> <C-W>j
	map <D-k> <C-W>k
	map <D-l> <C-W>l
	map <D-h> <C-W>h

	" cscope {{{"
	nmap <D-[> :cs find c <C-R>=expand("<cword>")<CR><CR><C-O>:copen<CR>
	nmap <D-\> :cs find s <C-R>=expand("<cword>")<CR><CR><C-O>:copen<CR>
	nmap <D-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
	" }}}
        
        "Sublime Command+Enter 
        inoremap <D-CR> <ESC>A<CR>
endif

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/cscope*,*/*.csv/,*/*.log,*tags*,*/bin/*        " Linux/MacOSX

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

let g:ctrlp_cmd = 'CtrlPMixed'			" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'	" search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 1		" show the match window at the top of the screen
let g:ctrlp_max_height = 10				" maxiumum height of match window
let g:ctrlp_switch_buffer = 'Et'		" jump to a file if it's open already
let g:ctrlp_use_caching = 1				" enable caching
let g:ctrlp_clear_cache_on_exit=1  		" speed up by not removing clearing cache evertime
let g:ctrlp_mruf_max = 250 				" number of recently opened files
let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.build|github.com|labix.org|bin|pkg)$',
                        \ 'file': '\v(\.exe|\.so|\.dll|\.a|\.xls|\.csv|\.json|\.log|\.out|gs|gw|gm|tags|gotags|\/U)$',
                        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
                        \ }
let g:ctrlp_buftag_types = {
                        \ 'go'         : '--language-force=go --golang-types=ftv',
                        \ 'as'         : '--language-force=actionscript --actionscript-types=fpvc',
                        \ 'actionscript': '--language-force=actionscript --actionscript-types=fpvc',
                        \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
                        \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
                        \ 'objc'       : '--language-force=objc --objc-types=mpci',
                        \ 'rc'         : '--language-force=rust --rust-types=fTm'
                        \ }
let g:ctrlp_prompt_mappings = {
                        \ 'PrtBS()':              ['<bs>', '<c-]>'],
                        \ 'PrtDelete()':          ['<del>'],
                        \ 'PrtDeleteWord()':      ['<c-w>'],
                        \ 'PrtClear()':           ['<c-u>'],
                        \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
                        \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
                        \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
                        \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
                        \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
                        \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
                        \ 'PrtHistory(-1)':       ['<c-n>'],
                        \ 'PrtHistory(1)':        ['<c-p>'],
                        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
                        \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
                        \ 'AcceptSelection("t")': ['<c-t>'],
                        \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
                        \ 'ToggleFocus()':        ['<s-tab>'],
                        \ 'ToggleRegex()':        ['<c-r>'],
                        \ 'ToggleByFname()':      ['<c-d>'],
                        \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
                        \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
                        \ 'PrtExpandDir()':       ['<tab>'],
                        \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
                        \ 'PrtInsert()':          ['<c-\>'],
                        \ 'PrtCurStart()':        ['<c-a>'],
                        \ 'PrtCurEnd()':          ['<c-e>'],
                        \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
                        \ 'PrtCurRight()':        ['<c-l>', '<right>'],
                        \ 'PrtClearCache()':      ['<F5>'],
                        \ 'PrtDeleteEnt()':       ['<F7>'],
                        \ 'CreateNewFile()':      ['<c-y>'],
                        \ 'MarkToOpen()':         ['<c-z>'],
                        \ 'OpenMulti()':          ['<D-o>'],
                        \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
                        \ }

let g:delimitMate_expand_cr = 1
let delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_space = 2

imap <expr> <TAB> delimitMate#ShouldJump() ? "<Plug>delimitMateS-Tab" : "<TAB>"
inoremap <expr> <S-Tab> delimitMate#JumpAny()

let g:syntastic_check_on_wq=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_error_symbol = "▶▶"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_mode_map = { "mode": "passive",
			\ "active_filetypes": ["ruby", "php", "go" ],
			\ "passive_filetypes": ["shell" ] }
let g:syntastic_go_checkers = ['govet', 'errcheck']

command! CO CtrlSFOpen

" 不搜索Go、nodejs的库目录
let g:ctrlsf_ignore_dir = ["node_modules", "vendor"]

" Remember last location{{{
autocmd BufReadPost *
                        \ if line("'\"")>0&&line("'\"")<=line("$") |
                        \   exe "normal g'\"" |
                        \ endif ""'")
"}}}
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
map <D-y> :TagbarToggle<cr>
let g:tagbar_autofocus=1
let g:tagbar_sort=0
let g:tagbar_type_go = {
                        \ 'ctagstype' : 'go',
                        \ 'kinds'     : [
                        \ 'p:package',
                        \ 'i:imports:1',
                        \ 'c:constants',
                        \ 'v:variables',
                        \ 't:types',
                        \ 'n:interfaces',
                        \ 'w:fields',
                        \ 'e:embedded',
                        \ 'm:methods',
                        \ 'r:constructor',
                        \ 'f:functions'
                        \ ],
                        \ 'sro' : '.',
                        \ 'kind2scope' : {
                        \ 't' : 'ctype',
                        \ 'n' : 'ntype'
                        \ },
                        \ 'scope2kind' : {
                        \ 'ctype' : 't',
                        \ 'ntype' : 'n'
                        \ },
                        \ 'ctagsbin'  : 'gotags',
                        \ 'ctagsargs' : '-sort -silent'
                        \ }
if has("cscope")
        " set csprg=/usr/local/bin/cscope
        set csto=0
	set cscopequickfix=s-,c-,d-,i-,t-,e-
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
                cs add cscope.out
                " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
                cs add $CSCOPE_DB
        endif
        set csverb
end

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#bufferline#enabled = 1

" YouCompleteMe {{{
  " preview window settiing
  let g:ycm_add_preview_to_completeopt = 1
  let g:ycm_autoclose_preview_window_after_completion = 0
  let g:ycm_autoclose_preview_window_after_insertion = 1

  " typing 2 chars
  let g:ycm_min_num_of_chars_for_completion = 2
  " Completion when typing inside comments
  let g:ycm_complete_in_comments = 1  
  " Query the UltiSnips plugin
  let g:ycm_use_ultisnips_completer = 1 
  " Collect identifiers from strings and comments and tag fiels
  let g:ycm_collect_identifiers_from_comments_and_strings = 1   
  let g:ycm_collect_identifiers_from_tags_files = 1

  " some symbols
  let g:ycm_error_symbol = '>>'
  let g:ycm_warning_symbol = '>*'

  " Specifies Python interpreter to run jedi
  let g:ycm_python_binary_path = 'python3'

  " " Seed its identifier database
  " let g:ycm_seed_identifiers_with_syntax=1
  
  " youcompleteme select keys
  let g:ycm_key_list_select_completion = ['<Down>']
  let g:ycm_key_list_previous_completion = ['<Up>']

  " Where GoTo* commands result should be opened, same-buffer
  let g:ycm_goto_buffer_command = 'horizontal-split'
  " nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
  nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>

  let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
  " blacklist
  let g:ycm_filetype_blacklist = {
      \ 'gitcommit' : 1,
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

" }}}


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_functions = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
"let g:go_def_mode = 'guru'
let g:go_def_mode = 'godef'

function! OnGolangCompleteDone()
	if !exists('v:completed_item') || empty(v:completed_item)
		return
	endif

	let complete_str = v:completed_item.word
	if complete_str == ''
		return
	endif

	let line = getline('.')
	let next_char = line[col('.')-1]
        if  next_char == "("
                return
        end
	let cur_char =line[col('.')-2]

	let abbr = v:completed_item.abbr
	let startIdx = match(abbr,"(")
	let endIdx = match(abbr,")")
	if endIdx - startIdx > 1
		let argsStr = strpart(abbr, startIdx+1, endIdx - startIdx -1)
		let argsList = split(argsStr, ",")
		let snippet = ""
		if cur_char != "("
			let snippet = "("
		end
		let c = 1
		for i in argsList
			if c > 1 
				let snippet = snippet. ", "
			endif
			" strip space
			let arg = substitute(i, '^\s*\(.\{-}\)\s*$', '\1', '') 
			let snippet = snippet . '${'.c.":".arg.'}'
			let c += 1
		endfor
		let snippet = snippet . ")$0"
		call UltiSnips#Anon(snippet)
	endif
endfunction

" autocmd FileType lua :set shiftwidth=4 


set relativenumber
augroup CursorLineOnlyInActiveWindow
        autocmd!
	autocmd InsertLeave * setlocal relativenumber
	autocmd InsertEnter * setlocal norelativenumber
	autocmd BufEnter * setlocal cursorline
	autocmd BufLeave * setlocal nocursorline
	autocmd CompleteDone *.go  call OnGolangCompleteDone()
augroup END

let g:ycm_min_num_of_chars_for_completion = 1

au BufWritePost *.go GoImports

nmap <Leader>gt :GoTest<CR>
nmap <Leader>gi :GoInstall<CR>
nmap <Leader>gr :GoRename<CR>
nmap <Leader>ge :GoReferrers<CR>
nmap <Leader>gl :Gpull<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>cc :Gstatus<CR>
nmap <Leader>gs :Gstatus<CR>

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

set fileencodings=utf-bom,utf-8,gbk,gb2312,gb18030,cp936,latin1
hi Pmenu      guifg=#F6F3E8 guibg=#444444
" hi PmenuSel   guifg=#FFFFFF guibg=#0077DD
hi PmenuSel   guifg=#FFFFFF guibg=#11AADD
hi PMenuSbar  guibg=#5A647E
hi PMenuThumb guibg=#AAAAAA
" hi Visual     guibg=#1122FF
" hi Visual     guibg=#0066FF
hi Visual     guibg=#2566FA
" hi VertSplit guibg=#272822
hi VertSplit guibg=#1B1D1E
hi Cursor guibg=#FF0000

let g:ctrlsf_winsize = '30%'

autocmd BufNewFile,BufRead *.define setf define

"youdao dict
vnoremap <silent> <Leader>y :<C-u>Ydv<CR>
nnoremap <silent> <Leader>y :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR> 

"NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
