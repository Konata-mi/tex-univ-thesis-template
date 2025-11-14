#!/usr/bin/env perl

# xelatexを使う設定
$pdf_mode = 5;
$xelatex = 'xelatex -shell-escape -synctex=1 -interaction=nonstopmode %S';

# 参考文献(pbibtex)の設定
$bibtex = 'pbibtex -kanji=utf8 %B';
$max_repeat = 5;