#File: beautiful.py
#Author : Aman Agarwal <neshuagarwal1909@gmail.com>
#License : MIT
#version 1.0
#Dependencies :  BeautifulSoup <http://www.crummy.com/software/BeautifulSoup/>
#
import urllib2
from BeautifulSoup import BeautifulSoup
import sys
data=urllib2.urlopen(sys.argv[1]).read();
soup = BeautifulSoup(''.join(data))
code=soup('div', {'id' : 'code_frame'})
soup = BeautifulSoup(''.join(str(code[0]).strip()))
code_text = soup.div.div

text=''.join(BeautifulSoup(str(code_text).strip()).findAll(text=True))
code_for_vim =  BeautifulSoup(str(text).strip(), convertEntities=BeautifulSoup.HTML_ENTITIES)
print code_for_vim
#print sys.argv[1]
