"  Matt Humphries 
"
" Windows Version: 
" 2.25 09/21/2016
"
" Intro							
"	This vimrc is made to help customize, make vim a bit friendlier,
"	speed up learning and as a resource for those how did I do that again
"	moments.
"	

"	The sections are essentialls divided into two parts: SectionName_I for
"	information and SectionName_C for the actual code. This allows quicker
"	access for what you want. 

" Sections:						
" 	Plugins 									|.01|
" 	General										|.02|
"	Tags										|.03|
"   Colors and Fonts							|.04|
"   Files and backups							|.05|
"   Visual mode related							|.06|
"   Moving around, tabs and marks buffers		|.07|
"   Status line									|.08|
"   Edit mappings								|.09|
"   vimgrep searching and copy displaying		|.10|
"   Spell checking								|.11|
"   Misc										|.12|
"   Helper functions							|.13|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""


""*.01*"""""""""PLUGINS"""""""""""""""""""""""""""""""
"	Plugins_I: 
"	{{{
"	
"	|usr_05.4.txt|  vim help to add a package
" 	vim8 only:
"		the <unique> argument to ":map": only add a mapping when it wasn't
"		defined before.
"
"	vim-plug is set to be the plug-in manager
" 	!may change with vim 8.0 release as a manager
" 	is now baked in
"	
"	vim-plug: https://github.com/junegunn/vim-plug
"
"	Install instructions, if copy/pasting removing leading double quotes from each line:
"	
"	Powershell
"
"		md ~\vimfiles\autoload
"		$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"		(New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))

"	unix
"	
"		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"		:https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"
"		Important Note, if migrating from most other managers which use
"		a bundle directory make changes to match below:
"	
"	For Mac/Linux user
"	call plug#begin('~/.vim/bundle')
"
" 	For Windows users
"	call plug#begin('~/vimfiles/bundle')
"	
"
"	plug-vim Commands:
"
"	PlugInstall [name ...] [#threads]	Install plugins
"	PlugUpdate [name ...] [#threads]	Install or update plugins
"	PlugClean[!]				Remove unused directories (bang version will clean without prompt)
"	PlugUpgrade				Upgrade vim-plug itself
"	PlugStatus				Check the status of plugins
"	PlugDiff				Examine changes from the previous update and the pending changes
"	PlugSnapshot[!] 			[output path]	Generate script for restoring the current snapshot of the plugins

" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Plugins_C: 
" {{{ 

" Enable filetype plugins are commented out as vim-plug takes care of it in
" plug#begin
"
" filetype plugin on
" filetype indent on
" set nocompatible    


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/vimfiles/') "required line
" Add plugins below

" Plug 'whatyouhide/vim-gotham'

	Plug 'https://github.com/xolox/vim-easytags', has('nvim') ? {} : { 'on': [] } 

	Plug 'https://github.com/xolox/vim-misc', has('nvim') ? {} : { 'on': [] } 


"	May not need so we'll see 
	Plug 'vim-scripts/ScrollColors'
 
	Plug 'https://github.com/easymotion/vim-easymotion'

	Plug 'https://github.com/scrooloose/syntastic'


"Not sure about this one
"	Plug 'scrooloose/nerdcommenter'

	Plug 'https://github.com/vim-scripts/undofile.vim'

	Plug 'https://github.com/ajh17/VimCompletesMe'

"	Prolly dont need
"	Plug  'https://github.com/vim-scripts/colorscheme_template.vim' 


" All of your Plugins must be added before the following line
call plug#end()            " required line
" 
"	}}}


""*.02*"""""""""GENERAL"""""""""""""""""""""""""""""""
"	General_I:
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	General_C:
"	{{{

" For linux
" runtime path so vim searches the .vim/
"	runtime! plugin/**/*.vim
" 	This should work and is platform/plugin agnostic: fnamemodify(expand("$MYVIMRC"), ":p:h")

"	set runtimepath=~/vimfiles/

" Sets how many lines of history VIM has to remember
	set history=1000

" Set to auto read when a file is changed from the outside
	set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
	let mapleader = ","
	let g:mapleader = ","

" Fast saving
	nmap <leader>w :w!<cr>


" Set 7 lines to the cursor - when moving vertically using j/k
	set so=7


" Use spaces instead of tabs
"	set expandtab

" Be smart when using tabs ;)
	set smarttab

" 1 tab == 4 spaces
	set shiftwidth=4
	set tabstop=4
	set softtabstop=4

" Linebreak on 500 characters
	set lbr
	set tw=500

	set ai "Auto indent
	set si "Smart indent
	set wrap "Wrap lines

" Turn on the WiLd menu
	set wildmenu

" Ignore compiled files
	set wildignore=*.o,*~,*.pyc

" Always show current position
	set ruler
	set nu
" Height of the command bar
	set cmdheight=2

" A buffer becomes hidden when it is abandoned
	set hid

" Configure backspace so it acts as it should act
	set backspace=eol,start,indent
	set whichwrap+=<,>,h,l

" Ignore case when searching
	set ignorecase

" When searching try to be smart about cases 
	set smartcase

" Highlight search results
	set hlsearch

" Makes search act like search in modern browsers
	set incsearch

" Don't redraw while executing macros (good performance config)
	set lazyredraw

" For regular expressions turn magic on
	set magic

" Show matching brackets when text indicator is over them
	set showmatch
" How many tenths of a second to blink when matching brackets
	set mat=2

" No annoying sound on errors
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500
"	
"	}}}


""*.03*"""""""""TAGS""""""""""""""""""""""""""""""""""
"	Tags_I: 
"	{{{ 

 "place a mark in a file with mx and jump to that position with `x "

"	The `g:easytags_dynamic_files` option
"
"	By default `:UpdateTags` only writes to the global tags file, but
"	 it can be configured to look for project specific tags files by
"	 adding the following lines to your [vimrc script] [vimrc]:

"	:set tags=./tags;
"    	:let g:easytags_dynamic_files = 1
"	You can change the name of the tags file, the important thing is
"	that it's relative to your working directory or the buffer 
"	(using a leading `./`). When `g:easytags_dynamic_files` is set to
"	1 the easytags plug-in will write to the first existing tags file
"	seen by Vim (based on the ['tags' option] [tags_opt]). In other 
"	words: If a project specific tags file is found it will be used,
"	otherwise the plug-in falls back to the global tags file (or a file 
"	type specific tags file).

"	If you set `g:easytags_dynamic_files` to 2 the easytags plug-in will 
"	automatically create project specific tags based on the first name in 
"	the 'tags' option. In this mode the the global tags file or file type 
"	specific tags files are only used for directories where you don't have 
"	write permissions.
"	WARNING: The longer the tags file, the slower this will be, and the more
"	memory Vim will consume.
"	____
"
"	Following vim commands can be used to navigate through relevant functions

"	:ts  shows the list.
"	:tn  goes to the next tag in that list.
"	:tp  goes to the previous tag in that list.
"	:tf  goes to the function which is in the first of the list.
"	:tl  goes to the function which is in the last of the list.
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Tags_C:
"	{{{ 

"	If you want to highlight all the tags in your file, you can use the following
"mappings.

"	<F11>	-- Generate tags.vim file, and highlight tags.
"	<F12>	-- Just highlight tags based on existing tags.vim file.

	:map <F11>  :sp tags<CR>:%s/^\([^	:]*:\)\=\([^	]*\).*/syntax keyword Tag \2/<CR>:wq! tags.vim<CR>/^<CR><F12>
"  :map <F12>  :so tags.vim<CR>

"in visual mode when word is highlighted. mouse middle button will
"try to jump to tag
	vnoremap <MiddleMouse> <C-]>:w<CR>

"set local directory for tagfile, recursivly down directory, option2
	:set tags=./tags;
	let g:easytags_dynamic_files = 2

"maps alt+ mouse button to next/prev tag jump
	nnoremap <A-RightMouse> <C-o>:tprev
	vnoremap <A-RightMouse> <C-o>:tprev
	cnoremap <A-RightMouse> <C-o>:tprev
	inoremap <A-RightMouse> <C-o>:tprev

	nnoremap <A-LeftMouse> <C-o>:tnext
	vnoremap <A-LeftMouse> <C-o>:tnext
	cnoremap <A-LeftMouse> <C-o>:tnext
	inoremap <A-LeftMouse> <C-o>:tnext
"	
"	}}}


""*.04*"""""""""COLORS_FONT_SIZE""""""""""""""""""""""
"	Colors_Font_Size_I:  
"	{{{
"	 
" 	Good website for color options in hex
"	colors pagehttp://www.color-hex.com/color/8b5064 
"
"	As changes are made to see affects us :so % to update source
"
"	comment from gcb about ordering in vimrc
"	http://stackoverflow.com/questions/8640276/how-do-i-change-my-vim-highlight-line-to-not-be-an-underline"
" 	first thing is entering vim mode, not plain vi
" 	force 256 colors on the terminal
"	set t_Co=256
" 
" 	load the color scheme before anything
"	colorscheme darkblue " or desert... or anything
" 	the syntax cmd is when the colorscheme gets parsed, i think..
"	syntax on
"	____
"
"	Syntax groups/subgroups		{{{
"
"  	*Comment		any comment

"	*Constant		any constant
"	 String			a string constant:  "this is a string"
"	 Character		a character constant: 'c', '\n'
"	 Number			a number constant: 234, 0xff

"  	 Boolean		a boolean constant: TRUE, false
"	 Float			a floating point constant: 2.3e10

"	*Identifier	any variable name
"	 Function		function name (also: methods for classes)

"	*Statement		any statement
"	 Conditional	if, then, else, endif, switch, etc.
"	 Repeat			for, do, while, etc.
"	 Label			case, default, etc.
"	 Operator		"sizeof", "+", "*", etc.
"	 Keyword		any other keyword
"	 Exception		try, catch, throw

"	*PreProc		generic Preprocessor
"	 Include		preprocessor #include
"	 Define			preprocessor #define
"	 Macro			same as Define
"	 PreCondit		preprocessor #if, #else, #endif, etc.

"	*Type			int, long, char, etc.
"	 StorageClass	static, register, volatile, etc.
"	 Structure		struct, union, enum, etc.
"	 Typedef		A typedef
"
"	*Special		any special symbol
"	 SpecialChar	special character in a constant
"	 Tag			you can use CTRL-] on this
"	 Delimiter		character that needs attention
"	 SpecialComment	special things inside a comment
"	 Debug			debugging statements

"	*Underlined	text that stands out, HTML links

"	*Ignore			left blank, hidden  |hl-Ignore|

"	*Error			any erroneous construct

"	*Todo			anything that needs extra attention; mostly the
"					keywords TODO FIXME and XXX
" }}}
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Color_Font_Size_C:	
"	{{{ 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"guifont	list of font names to be used in the GUI
 	set gfn=Lucida_Console:h11:cANSI
"guifontwide	list of font names to be used for double-wide characters


"	colorscheme <insert path to existing color scheme>

"	Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"	NOTE: the code below located between 'Color_Begin' and 
"	''color_End' is located in the vimrc due to restrictions
"	in lab computers. The actual colorscheme is CrushedPlum

"	color_Begin 
"	Vim color file
"	Maintainer:   Matt Humphries
"	Last Change:  2015/10/04

"	Dark color scheme
set background=dark
hi clear
if exists("syntax_on")
   syntax reset
endif


"	Typically the line below is used to set a prefered colorscheme 
"let g:colors_name="crushedplum"


"	Changes color of the status line and the line numbers for each input mode 
"	http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode

function! InsertStatuslineColor(mode)
"  
  if a:mode == 'i'
    hi statusline guibg=#3c7889
	hi lineNr guibg=#3c7889
  elseif a:mode == 'r'
    hi statusline guibg=#c54e4e
	hi lineNr guibg=#c54e4e
  else
    hi statusline guibg=red
  endif
"  
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=#110022
au InsertLeave * hi lineNr guibg=#334444


"	TIP: use :hi to see all current highlight group values, see section
"		 header for  syntax groups or use the command-
"		 :so $VIMRUNTIME/syntax/hitest.vim is similar, but opens new top 
"		 window with same info, not entirely clear


"	if gvim is available use gui color scheme, else if term with limited
"	colors run on limited pallette
" if has("gui_runing")
	" GUI Color Scheme settings
	" 
	"	defines cursor behavior
	set guicursor+=i:ver40-icursor


	hi Normal      	gui=NONE		guifg=#fbcce7		guibg=#110022
	hi boolean      gui=BOLD		guifg=#bf94e4

	hi NonText     	gui=NONE		guifg=#ff9999		guibg=#444444
	hi Function    	gui=NONE		guifg=#7788ff		guibg=#110022
	hi Statement   	gui=BOLD		guifg=#b8860b		guibg=#110022
	hi label		gui=BOLD		guifg=#b8860b		guibg=#110022

	hi Special     	gui=NONE		guifg=Cyan			guibg=#110022
	hi Constant    	gui=NONE		guifg=#a09aab		guibg=#110022
	hi Comment     	gui=NONE		guifg=#d19fe8		guibg=#110022
	hi Preproc     	gui=NONE		guifg=#33ff66		guibg=#110022
	hi Type        	gui=NONE		guifg=#73b6c7		guibg=#110022
	hi Identifier  	gui=NONE		guifg=Cyan			guibg=#110022
	hi StatusLine  	gui=NONE		guifg=White			guibg=#110022
	hi StatusLineNC	gui=NONE		guifg=Yellow		guibg=blue

	hi Visual    	gui=NONE		guifg=White			guibg=#00aa33		
	hi Search      	gui=BOLD		guibg=Yellow		guifg=DarkBlue
	hi VertSplit   	gui=NONE		guifg=White			guibg=#666666
	hi Directory   	gui=NONE		guifg=Green			guibg=#110022
	hi WarningMsg  	gui=STANDOUT	guifg=#0000cc		guibg=Yellow
	hi Error       	gui=NONE		guifg=White			guibg=Red
	hi Cursor      	gui=BOLD		guifg=White			guibg=#00ff33
	hi LineNr      	gui=NONE		guifg=#d19fe8		guibg=#334444

	"the box at bottom left showing mode
	hi ModeMsg     	gui=NONE		guifg=Blue			guibg=White
	hi Question    	gui=NONE		guifg=#66ff99		guibg=#110022
	hi Operator		gui=NONE		guifg=#979445		guibg=#110022
	hi character   	gui=NONE		guifg=#979445		guibg=#110022
	hi lCursor     	gui=NONE		guibg=Purple		guifg=Yellow  

	"icursor bg is the look during insert mode while the set command is the thickness
	hi ICursor		gui=NONE		guibg=#00ff33		guifg=Blue 

	"Cursorline changes line apearance
	hi CursorLine	guibg=#1b0036    

	hi CursorIM		gui=NONE		guibg=Red			guifg=Cyan

	"	Duplicate, delete one or the other on 470
	hi PreProc		guifg=Yellow

	hi structure    gui=BOLD		guifg=#73b6c7

	" Use Unix as the standard file type
	set ffs=unix,dos,mac
	" 
	" end GUI color settings
" else
	"non-gui scheme
	" Terminal window - color scheme Settings
	" 

	"Terminal, simplified color, 16bit
	hi Normal       term=NONE cterm=NONE ctermfg=LightGray   ctermbg=Black
	hi NonText      term=NONE cterm=NONE ctermfg=Brown       ctermbg=Black
	hi Function     term=NONE cterm=NONE ctermfg=DarkCyan    ctermbg=Black
	hi Statement    term=BOLD cterm=BOLD ctermfg=DarkBlue    ctermbg=Black
	hi Special      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=Black
	hi SpecialChar  term=NONE cterm=NONE ctermfg=Cyan        ctermbg=Black
	hi Constant     term=NONE cterm=NONE ctermfg=Blue        ctermbg=Black
	hi Comment      term=NONE cterm=NONE ctermfg=DarkGray    ctermbg=Black
	hi Preproc      term=NONE cterm=NONE ctermfg=DarkGreen   ctermbg=Black
	hi Type         term=NONE cterm=NONE ctermfg=DarkMagenta ctermbg=Black
	hi Identifier   term=NONE cterm=NONE ctermfg=Cyan        ctermbg=Black
	hi StatusLine   term=BOLD cterm=NONE ctermfg=Yellow      ctermbg=DarkBlue
	hi StatusLineNC term=NONE cterm=NONE ctermfg=Black       ctermbg=Gray
	hi Visual       term=NONE cterm=NONE ctermfg=White       ctermbg=DarkCyan
	hi Search       term=NONE cterm=NONE ctermbg=Yellow      ctermfg=DarkBlue
	hi VertSplit    term=NONE cterm=NONE ctermfg=Black       ctermbg=Gray
	hi Directory    term=NONE cterm=NONE ctermfg=Green       ctermbg=Black
	hi WarningMsg   term=NONE cterm=NONE ctermfg=Blue        ctermbg=Yellow
	hi Error        term=NONE cterm=NONE ctermfg=DarkRed     ctermbg=Gray
	hi Cursor                            ctermfg=Black       ctermbg=Cyan
	hi LineNr       term=NONE cterm=NONE ctermfg=Red         ctermbg=Black
	" 
	"	end terminal window settings
" endif
" color_End
" 
"	}}}


""*.05*"""""""""Files_Backups_Undo""""""""""""""""""""
"	Files_Backups_Undo_I: 	 

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Files_Backups_Undo_C:	
"	{{{ 

" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile
" 
" }}}


""*.06*"""""""""VISUAL_MODE"""""""""""""""""""""""""""
"	Visual_Mode_I:
	 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Visual_Mode_C:	
"	{{{ 

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>
" 
"	}}}


""*.07*"""""""""MOVING_AROUND"""""""""""""""""""""""""
"	Moving_Around_I: 
"	{{{

"	Tabs_Windows_Marks_TODO_Buffers

"	TIP: f and t move you along the current line — better
"	than pressing Right lots if you can see where you want to be.

"	TIP: Learning a few (more) movement commands helps with editing,
"	since so many commands such as d, c, and v can be followed by 
"	any movement command. For example type df> to delete up to the
"	next right angle bracket, or ct" to change the text before 
"	the next quotes.

"	Capital F is similar to f but moves left instead of right. Guess 
"	what the left-moving variant of t is? See, once you know a few 
"	commands it becomes possible to infer others.

"	‘[ and ‘] move to either end of the chunk of text most recently 
"	modified (inserted, indented, whatever). ‘< moves to the start of 
"	the most recent selection; guess what moves to the end. These are 
"	useful for performing several operations on the same text.

"	[{ and friends is great if working in a language such as C or Perl 
"	with delimited blocks; it doesn’t just search for the preceding left 
"	brace, but for the one that starts the block you’re in — handy for 
"	discovering which function or if clause this is.

"   Folding :help foldlevelstart
"	Also  check out :help section and :help sections

"	Searching Using the "*" key while in normal mode searches for the word
"	under the cursor.


"	There are also marks
"	with an uppercase letter.  These are global, they can be used from any file.
"	For example suppose that we are editing the file "foo.txt".  Go to halfway the
"	file ("50%") and place the F mark there (F for foo): >

"	50%mF

"	Now edit the file "bar.txt" and place the B mark (B for bar) at its last line:

"	GmB

"	Now you can use the "'F" command to jump back to halfway foo.txt.  Or edit yet
"	another file, type "'B" and you are at the end of bar.txt again.

" 	The file marks are remembered until they are placed somewhere else.  Thus you
"	can place the mark, do hours of editing and still be able to jump back to that
"	mark.
"   	It's often useful to think of a simple connection between the mark letter
"	and where it is placed.  For example, use the H mark in a header file, M in
"	a Makefile and C in a C code file.

"	To see where a specific mark is, give an argument to the ":marks" command: >

"	:marks M

"	You can also give several arguments: >

"	:marks MCP

"	Don't forget that you can use CTRL-O and CTRL-I to jump to older and newer
"	positions without placing marks there.


"	To jump to the declaration of a global variable in a C program, 
"	position the cursor on the name of the variable and use the
"	gD command.
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Moving_Around_C:	
"	{{{ 

" type za to fold and unfold the below

" Vimscript file settings ---------------------- 
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" 


" Treat long lines as break lines (useful when moving around in them)
" map j gj
" map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
" map <C-j> <C-W>j
" map <C-k> <C-W>k
" map <C-h> <C-W>h
" map <C-l> <C-W>l

" Close the current buffer
" map <leader>bd :Bclose<cr>

" Close all the buffers
" map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%
" 
"	}}}


""*.08*"""""""""STATUS_LINE"""""""""""""""""""""""""""
"	Status_Line_I:

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Status_Line_C:	
"	{{{	
	
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" 
"	}}}


""*.09*"""""""""MAPPINGS""""""""""""""""""""""""""""""
"	Mappings_I:

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Mappings_C:		
"	{{{

"maps -> to .. just because it is easier for me
" :ab .. ->

"These let use define boxed comments with ease. By typing "#b" we type the top of a boxed comment. Typing "#e" types the bottom line. (We put the ^V^H^V^H in the file to backup over the comment leader.) 
" :ab #b /****************************************
" :ab #e ^V^H*****************************************/
" :ab #h /******************** Name **************************************<CR>removeLL<CR>Purpose:<CR>    Simple Description<CR>Parameters:<CR><TAB>Use I, O, IO, IOMOD and a simple description<CR>Notes:<CR><TAB>explain special cases, concerns, procedured, etc<CR><TAB><CR><TAB><CR>Return value:<CR><TAB>info on return values, pasby reference vaules<CR>Called From:<CR><Tab>provide function name and file name providing easy access to preceding code<CR>**************************************************************************/<CR><up>


"adds a save and close to <F9>
"	{{{
nnoremap <F9> :w<CR>:x<CR>
inoremap <F9> <ESC>:w<CR>:x<CR>
vnoremap <F9> <ESC>:w<CR>:x<CR>
"	}}}


"sets Alt +RightMouse:tagnext -> Enter
"the <C-o> returns to previsous mode
"	{{{	
nnoremap <C-LeftMouse> :tn<CR>
inoremap <C-LeftMouse> <C-o>:tn<CR>
vnoremap <C-LeftMouse> <C-o>:tn<CR>
"	}}}


"Sets Alt+LeftMouse to :prevtag ->Enter
"the <C-o> returns to previsous mode
"	{{{
nnoremap <C-RightMouse> :tp<CR>
inoremap <C-RightMouse> <C-o>:tp<CR>
vnoremap <C-RightMouse> <C-o>:tp<CR>
"	}}}


"save sequence of esc :w mapped to F5. This ensures: no accidental :w inserted
"into code and that save occurs
"	{{{
"nnoremap <F5>  :w<CR>
"inoremap <F5>  <C-o>:w<CR>
"vnoremap <F5>  <C-o>:w<CR>
"	}}}


"creates a paste/put option that esc back to command mode and inserts using p
"	{{{
nnoremap <A-p> ]p
inoremap <A-p> <C-o>]p
vnoremap <A-p> <C-o>]p
"	}}}


"creates undo for insert and visual mode.
"	{{{
nnoremap <A-u> u
inoremap <A-u> <C-o>u
vnoremap <A-u> <C-o>u
"	}}}


"maps find tag at cursor to F4 and return to last postition to F3 for all modes
"	{{{
nnoremap <F4> <C-o><C-]>
inoremap <F4> <C-o><C-]>
vnoremap <F4> <C-o><C-]>
noremap <F4> <C-o><C-]>
nnoremap <F3> <C-o><C-t>
inoremap <F3> <C-o><C-t>
vnoremap <F3> <C-o><C-t>
noremap <F3> <C-o><C-t>
"	}}}


"middle mouse now saves, created due to lab having crappy mice
"	{{{
nnoremap <MiddleMouse> :w<CR>
inoremap <MiddleMouse> <C-o>:w<CR>
cmap <MiddleMouse> :w<CR>
"	}}}


" Remap VIM 0 to first non-blank character
map 0 ^


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()	" {{{
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
" 
"	}}}
" }}}


""*.10*"""""""""VIMGREP_SEARCH""""""""""""""""""""""""
"	Vimgrep_Search_I: 
"	{{{
"	 

"	ctrl-n command, that will attempt to complete the word under the cursor

"	The "*" key will search for the word from the current cursor 
"	position to the end of the file. The "#" key will search for the 
"	word from the current cursor position to the top of the file.	


"	To search for partial matches, you can use the "g*" and "g#" key
"	sequence. 
"	}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Vimgrep_Search_C:	
"	{{{  

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
" 
"	}}}


""*.11*"""""""""SPELL_CHECK"""""""""""""""""""""""""""
"	Spell_Check_I:

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Spell_Check_C:	
"	{{{ 

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=
" 
"	}}}


""*.12*"""""""""MISC""""""""""""""""""""""""""""""""""
"	Misc_I:

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Misc_C:		
"	{{{ 

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
" 
"	}}}


""*.13*"""""""""HELPER_FUNCTIONS""""""""""""""""""""""
"	Helper_Functions_I:

""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Helper_Functions_C:	
"	{{{

function! CmdLine(str)	" {{{

	exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
	
endfunction		" }}}


function! VisualSelection(direction) range	"	{{{
"     
	let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
" 
endfunction		" }}}

" Returns true if paste mode is enabled		{{{
function! HasPaste()
	if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction		" }}}

" Don't close window, when deleting a buffer	{{{
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif
   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction		" }}}
"	}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""


" EOF
