#!/usr/bin/env perl
#詳しい設定については http://www.ctan.org/pkg/latexmk/ 参照.
$latex              = 'platex -shell-escape -halt-on-error';
$latex_silent       = 'platex -shell-escape -halt-on-error -interaction=batchmode';
#$bibtex             = 'pbibtex';
$dvipdf             = 'dvipdfmx %O -o %D %S';
$dvips              = 'pdvips %O -o %D %S';
$dvips_landscape    = 'pdvips -tlandscape %O -o %D %S';
#$makeindex          = 'mendex %O -o %D %S';
#$pdf_mode           = 0;
$pdf_mode           = 2; # generates pdf via ps2pdf
#$pdf_mode           = 3; # generates pdf via dvipdfmx
#$pdf_update_method  = 3;
#$pdf_update_command = 'acroread %S';
$postscript_mode    = 1;
$view               = 'ps';# view with gv
