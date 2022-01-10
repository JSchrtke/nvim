autocmd BufWritePost * silent execute '!groff -e -ms -Tpdf '.expand('%:p').' > '.expand('%:r').'.pdf'
