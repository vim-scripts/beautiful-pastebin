"
"File: bin.vim
"Author: Aman Agarwal <neshuagarwal1909@gmail.com>
"License: MIT
"Version: 1.0
"Usage:
"	:PasteBin
"
"Dependencies: Beautifulsoup
"
" Usage:
" Just put bin.vim and beautiful.py in your ~/.vim/plugin
" You have to set your pastebin emailid/language
"   :let g:pastebin_emailid="username@domain.com"
"   :let g:pastebin_language="language"
" 
"
"   And if you want to keep your language and email setting forever, 
"   Simply put them in your ~/.vimrc
"
" type:
"   :PasteBin   		    To get code to your vim editor
"   :PasteBinUpload          	    To Upload the text from vim editor to pastebin
"

fun! <SID>pasteCodeFromPasteBin()
    	let g:binLink = input("Enter valid pastebin link : ")
	let g:data=system('python ~/.vim/plugin/beautiful.py '.g:binLink)
    	set paste
	exec "normal O".g:data
	startinsert
endfun

fun! <SID>pasteCodeToPasteBin()
	 let g:filename=bufname("%")
    	 let g:saveFile = input("Do you want to save the file(y/n)")
	 if g:saveFile == "y"
		 :w
	 endif
	 if !exists("g:pastebin_emailid")
		let g:pastebin_emailid=""
	 endif
	 
	 if !exists("g:pastebin_language")
		let g:pastebin_language=""
	 endif

	 let g:name = input("Enter name : ")
	 let g:data=system('cat '.bufname("%").'| perl -p -e ''s/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg''')
	 let g:query='paste_private=0&paste_code='.g:data.'&paste_name='.g:name.'&paste_email='.g:pastebin_emailid.'&paste_format='.g:pastebin_language
	 let g:out=system('curl -d -s"'.g:query.'" http://pastebin.com/api_public.php ')
	 echo g:out
 endfun

command! -nargs=0 PasteBin :call <SID>pasteCodeFromPasteBin()
command! -nargs=0 PasteBinUpload :call <SID>pasteCodeToPasteBin()
