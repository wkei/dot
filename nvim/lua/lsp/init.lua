local nvim_lsp = require('nvim_lsp')

nvim_lsp.tsserver.setup{}

nvim_lsp.pyls.setup{on_attach=require'completion'.on_attach}
