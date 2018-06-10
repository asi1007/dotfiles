#!/usr/bin/env perl
$latex            = 'uplatex -synctex=1 -halt-on-error -u';
$latex_silent     = 'uplatex -synctex=1 -halt-on-error -u -interaction=batchmode';
$bibtex           = 'pbibtex';
$dvipdf           = 'dvipdfmx -f ptex-hiragino.map %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
$max_repeat       = 5;
$pdf_mode	  = 3; # generates pdf via dvipdfmx

# Prevent latexmk from removing PDF after typeset.
# This enables Skim to chase the update in PDF automatically.
$pvc_view_file_via_temporary = 0;

# Use Skim as a previewer
$pdf_previewer    = "open -ga /Applications/Preview.app";
# $pdf_previewer    = "open -ga /Applications/Skim.app";
# $pdf_update_method = 4;
