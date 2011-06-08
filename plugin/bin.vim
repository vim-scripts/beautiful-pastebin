"
"File: bin.vim
"Author: Aman Agarwal <neshuagarwal1909@gmail.com>
"License: MIT
"Version: 1.0
"Usage:
"	:PasteBin
"
"Dependencies: python
"

fun! <SID>pasteCodeToPasteBin()
    	let g:binLink = input("Enter valid pastebin link : ")
	let g:data=system('python ~/.vim/plugin/beautiful.py '.g:binLink)
    	set paste
	exec "normal O".g:data
	startinsert
endfun

command! -nargs=0 PasteBin :call <SID>pasteCodeToPasteBin()
