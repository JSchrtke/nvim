setlocal shiftwidth=2 tabstop=2 expandtab
setlocal textwidth=90 formatoptions-=t
setlocal commentstring=//\ %s
set colorcolumn=90

function! OpenDelphiProjectInIde()
    call nvim_feedkeys(join([':T start ', fnamemodify(getcwd(), ':t'), "andtests.groupproj"], ''), 't', v:true)
    let enter = nvim_replace_termcodes("<CR>", v:true, v:false, v:true)
    call nvim_feedkeys(enter, 'n', v:true)
endfunction
lua << EOF
require("which-key").register({
    ["<leader>oi"] = {"<cmd>call OpenDelphiProjectInIde()<cr>", "open in rad studio"},
    ["<leader>rp"] = {"<cmd>Topen|T .\\build_and_run.bat<cr>", "project"},
    ["<leader>rt"] = {"<cmd>Topen|T .\\build_and_run_tests.bat<cr>", "tests"},
    ["<leader>rf"] = {"<cmd>call FormatDelphi()<cr>", "formatter"},
})
EOF

if exists('*FormatDelphi')
    finish
endif
function! FormatDelphi()
    let l:current_file = expand('%:p')
    execute 'write '.current_file
    silent execute '!Formatter -config .\\formatter.config "'.current_file.'"'
    silent execute '!fix_delphi_format.exe "'.current_file'"'
    execute 'edit '.current_file
endfunction
