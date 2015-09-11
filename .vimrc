let mapleader=";"
let g:mapleader=";"
"在vim打开一个文件时尝试utf-8，gbk两种编码，支持windows拷贝过来的文件的中文支持
set fencs=utf-8,gbk
set termencoding=utf-8
set fileformats=unix
set encoding=prc
"去除vim一致性模式，避免以前版本的一些bug和局限
set nocompatible
"显示当前光标的行列信息
set ruler
"显示行号
set nu
"取消换行。
"set nowrap
"搜索时忽略大小写
set ignorecase
"在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=7
"语法高亮
syntax on
"寻找匹配时高亮度显示
set hlsearch
"查询时非常方便，如果要查找book，当输入到/b时，会自动找到第一个b开头的单词，
"当输入/bo时，会自动找到第一个bo开头的单词，依次类推，进行查找时使用此设置
"会快速找到答案，当你找到要匹配的单词时别忘记回车
set incsearch
"ctags设置tags文件，当前路径没有tags文件时向上级路径寻找
set tags=tags;
"set autochdir

"设置TAB健
"这个是用于程序中自动缩进所使用的空白长度指示的。一般来说为了保持程序的美观，和下面的参数最好一致。同时它也是符号移位长度的制定者
set shiftwidth=4
"定义tab所等同的空格长度
set tabstop=4
"如果我们希望改变程序中的缩进怎么办？shiftwidth和tabstop不一样的话，你会发现程序比较难看的。这时候，softtabstop就起作用了。可以从vim的说明中看到，一旦设置了softtabstop的值时，你按下tab键，插入的是空格和tab制表符的混合，具体如何混合取决于你设定的softtabstop，举个例子，如果设定softtabstop=8,那么按下tab键，插入的就是正常的一个制表符;如果设定softtabstop=16,那么插入的就是两个制表符；如果softtabstop=12,那么插入的就是一个制表符加上4个空格；如果softtabstop=4呢？那么一开始，插入的就是4个空格，此时一旦你再按下一次tab，这次的四个空格就会和上次的四个空格组合起来变成一个制表符。换句话说，softtabstop是“逢8空格进1制表符,前提是你tabstop=8
"set softtabstop=4
"设置四个空格代替tab健
set expandtab

"设置自动缩进,主要有cindent、smartindent和autoindent三种
"cindent Vim可以很好的识别出C和Java等结构化程序设计语言，并且能用C语言的缩进格式来处理程序的缩进结构。
"set cindent
"smartindent 在这种缩进模式中，每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出花括号，当遇到右花括号（}），则取消缩进形式。此外还增加了识别C语言关键字的功能。如果一行是以#开头的，那么这种格式将会被特殊对待而不采用缩进格式。
set smartindent
"autoindent 在这种缩进形式中，新增加的行和前一行使用相同的缩进形式。
"set autoindent

"设置匹配模式，显示括号配对情况
set showmatch
"括号补全
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap / //<ESC>i

"设置折叠，选择用空格键来开关折叠
set foldenable
set foldmethod=syntax
set foldlevelstart=99    "打开文件是默认不折叠代码
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"ctags cscope lookupfile设置
map <leader>lp :!(rm cscope.files cscope.in.out cscope.out cscope.po.out .filenametags tags -rf &&echo update cscope... ...&&find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files&&cscope -bkq -i cscope.files&&CSCOPE_DB=$(pwd)/cscope.out&&echo update tags ... ...&&ctags -R&&~/.vim/bash/mkfilenametags)<CR><CR>
"taglist设置
let Tlist_Show_One_File=1    "只显示当前文件的tags
let Tlist_WinWidth=30        "设置taglist宽度
let Tlist_Exit_OnlyWindow=1  "tagList窗口是最后一个窗口，则退出Vim
let Tlist_Use_Right_Window=1 "在Vim窗口右侧显示taglist窗口
"let Tlist_Auto_Open=1         "启动vim时自动打开taglist窗口
let TlistHighlightTag=1      "当前Tag高亮显示
let Tlist_GainFocus_On_ToggleOpen=1    	"为1则使用TlistToggle打开标签列表窗口后会获焦点至于标签列表窗口；为0则taglist打开后焦点仍保持在代码窗口
let Tlist_Close_On_Select=1    	"选择标签或文件后是否自动关闭标签列表窗口
map <leader>ll :Tlist<CR>
"map <leader>ll :TlistToggle<CR>    "命令同上
" 设置NerdTree
map <leader>kk :NERDTreeToggle<CR>
"下划线设置,当前行高亮
"ctermbg为背景色，ctermfg为前景色，可选颜色为black, brown, grey, blue, green,cyan, magenta, yellow, white等
set cursorline
"set nocursorline
hi CursorLine  cterm=NONE   ctermbg=cyan ctermfg=white
"设置列线显示
set cursorcolumn
"set nocursorcolumn
hi CursorColumn cterm=NONE ctermbg=cyan ctermfg=white
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    "set csto=0

    " add any cscope database in current directory
    "if filereadable("cscope.out")
    "    cs add cscope.out
    " else add the database pointed to by environment variable
    "elseif $CSCOPE_DB != ""
    "    cs add $CSCOPE_DB
    "endif

"liyatang add
"自动查找cscope.out文件
"if has("cscope")
"    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
    	cs add cscope.out
    "else search cscope.out elsewhere
    else
    	let cscope_file=findfile("cscope.out",".;")
    	let cscope_pre=matchstr(cscope_file,".*/")
    	if !empty(cscope_file) && filereadable(cscope_file)
    		exe "cs add" cscope_file cscope_pre
    	endif
    endif
"endif
"liyatang add end

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>

    "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    "nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

"不兼容vi
set nocp
"允许插件运行
filetype plugin on
"使用SuperTab
let g:SuperTabDefaultCompletionType="context"
"lookupfile设置
let g:LookupFile_TagExpr = '"./.filenametags"'
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

"显示行尾空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
"开启vim时去除行尾空格
function StripTrailingWhite()
    let winview = winsaveview()
    silent! %s/\s\+$//
    call winrestview(winview)
endfunction
autocmd BufReadPost * :call StripTrailingWhite()

" 让lookupfile插件忽略大小写
" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
	let _tags = &tags
	try
		let &tags = eval(g:LookupFile_TagExpr)
		let newpattern = '\c' . a:pattern
		let tags = taglist(newpattern)
	catch
		echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
		return ""
	finally
		let &tags = _tags
	endtry

	"Show the matches for what is typed so far.
	let files = map(tags, 'v:val["filename"]')
	return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'
