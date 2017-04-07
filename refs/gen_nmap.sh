#!/bin/bash

touch q_nmap.vim
echo "\" stupid nmap ！ 因为使用变量 nmap <leader>i :b i<cr>  中的i无法解析为变量" >> q_nmap.vim
echo "nmap <leader>,, :b 1<cr>" >> q_nmap.vim
echo "nmap <leader>,2 :b 2<cr>" >> q_nmap.vim
echo "nmap <leader>,3 :b 3<cr>" >> q_nmap.vim
echo "nmap <leader>,4 :b 4<cr>" >> q_nmap.vim

for (( i=3; i<50; i++)); do
	echo "nmap <leader>$i :b $i<cr>" >> q_nmap.vim
done;
