" ### Install plugins ###
lua << EOF
require("packer").startup(function()
    use "wbthomason/packer.nvim"
end)
EOF
