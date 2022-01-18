setlocal makeprg=cargo

" from https://github.com/rust-lang/rust.vim/blob/4aa69b84c8a58fcec6b6dad6fe244b916b1cf830/syntax_checkers/rust/cargo.vim#L66
" Ignored patterns, and blank lines
let errorformat =
            \ '%-G,' .
            \ '%-Gerror: aborting %.%#,' .
            \ '%-Gerror: Could not compile %.%#,'

" Meaningful lines (errors, notes, warnings, contextual information)
let errorformat .=
            \ '%Eerror: %m,' .
            \ '%Eerror[E%n]: %m,' .
            \ '%Wwarning: %m,' .
            \ '%Inote: %m,' .
            \ '%C %#--> %f:%l:%c'

function! CargoRunWithArgs(mode_string)
    if a:mode_string == "term"
        call nvim_feedkeys(':T cargo run ', 't', v:true)
    elseif a:mode_string == "echo"
        call nvim_feedkeys(':make run ', 't', v:true)
    else
        return
    endif
endfunction

function! MakeCheck()
    :make check
    :cw
endfunction

function! MakeClean()
    :make clean
    :cw
endfunction

function! MakeBuild()
    :make build
    :cw
endfunction

function! MakeRun()
    :make run
    :copen
endfunction

function! MakeFmt()
    :make fmt
    :cw
endfunction

function! MakeUpdate()
    :make update
    :cw
endfunction

function! MakeTest()
    :make test
    :copen
endfunction

lua << EOF
require("which-key").register({
    r = {
        name = "+run",
        c = {"<cmd>call MakeCheck()<cr>", "cargo check"},
        C = {"<cmd>call MakeClean()<cr>", "cargo clean"},
        b = {"<cmd>call MakeBuild()<cr>", "cargo build"},
        p = {"<cmd>call MakeRun()<cr>", "cargo run"},
        f = {"<cmd>call MakeFmt()<cr>", "cargo fmt"},
        u = {"<cmd>call MakeUpdate()<cr>", "cargo update"},
        t = {"<cmd>call MakeTest()<cr>", "cargo test"},
        P = {"<cmd>call CargoRunWithArgs('echo')<cr>", "cargo run (with args)"},
    },
    t = {
        name = "+run in terminal",
        c = {"<cmd>T cargo check<cr>", "cargo check"},
        C = {"<cmd>T cargo clean<cr>", "cargo clean"},
        b = {"<cmd>T cargo build<cr>", "cargo build"},
        p = {"<cmd>T cargo run<cr>", "cargo run"},
        P = {"<cmd>call CargoRunWithArgs('term')<cr>", "cargo run (with args)"},
        f = {"<cmd>T cargo fmt<cr>", "cargo fmt"},
        u = {"<cmd>T cargo update<cr>", "cargo update"},
        t = {"<cmd>T cargo test<cr>", "cargo test"},
    },
})
EOF

