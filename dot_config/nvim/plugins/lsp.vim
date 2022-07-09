Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

lua <<EOF
require("nvim-lsp-installer").setup {}
EOF
