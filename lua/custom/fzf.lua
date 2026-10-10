local map = vim.keymap.set
local fzf = require('fzf-lua')

map('n', '<leader>ff', fzf.files)
map('n', '<leader>fg', fzf.live_grep)
map('n', '<leader>ft', fzf.filetypes)
map('n', '<leader>fb', fzf.buffers)
map('n', '<leader>fd', fzf.diagnostics_document)
map('n', '<leader>fD', fzf.diagnostics_workspace)
