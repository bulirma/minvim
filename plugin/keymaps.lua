local map = function (modes, lhs, rhs, opts)
    if opts == nil then
        opts = {}
    end
    opts = vim.tbl_extend('force', { silent = true }, opts)
    vim.keymap.set(modes, lhs, rhs, opts)
end

map({ 'n', 'v' }, '<space>', '<nop>')

map('t', '<esc><esc>', '<c-\\><c-n>')

map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

map('n', '<leader>h', ':bprevious<cr>')
map('n', '<leader>l', ':bnext<cr>')
map('n', '<leader>q', ':bdelete<cr>')
map('n', '<leader>n', ':enew<cr>')
map('n', '<leader>d', vim.diagnostic.open_float)
map('n', '<c-h>', '<c-w>h')
map('n', '<c-j>', '<c-w>j')
map('n', '<c-k>', '<c-w>k')
map('n', '<c-l>', '<c-w>l')

map({ 'n', 'v' }, '<leader>y', '"+y')
map('n', '<leader>p', '"+p')
map('n', '<leader>P', '"+P')

map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', 'J', ":m '>+1<cr>gv=gv")
map('v', 'K', ":m '<-2<cr>gv=gv")
