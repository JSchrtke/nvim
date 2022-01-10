function! CargoRunWithArgs(mode_string)
    if a:mode_string == "term"
        call nvim_feedkeys(':T cargo run ', 't', v:true)
    elseif a:mode_string == "echo"
        call nvim_feedkeys(':!cargo run ', 't', v:true)
    else
        return
    endif
endfunction

lua << EOF
require("which-key").register({
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
    r = {
        name = "+run",
        c = {"<cmd>!cargo check<cr>", "cargo check"},
        C = {"<cmd>!cargo clean<cr>", "cargo clean"},
        b = {"<cmd>!cargo build<cr>", "cargo build"},
        p = {"<cmd>!cargo run<cr>", "cargo run"},
        f = {"<cmd>!cargo fmt<cr>", "cargo fmt"},
        u = {"<cmd>!cargo update<cr>", "cargo update"},
        P = {"<cmd>call CargoRunWithArgs('echo')<cr>", "cargo run (with args)"},
        t = {"<cmd>!cargo test<cr>", "cargo test"},
    }
})
EOF

