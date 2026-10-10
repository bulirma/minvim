local M = {}

M.keymaps = {
    preset = 'default',
    ['<c-k>'] = { 'select_prev', 'fallback' },
    ['<c-j>'] = { 'select_next', 'fallback' },
    ['<cr>'] =  { 'accept', 'fallback' }
}

M.completion = {
    documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
    }
}

M.sources = {
    default = { 'avante', 'lsp', 'path', 'buffer', 'cmdline', 'supermaven' },
    providers = {
        avante = {
            name = 'Avante',
            module = 'blink-cmp-avante',
            opts = {}
        },
        supermaven = {
            name = 'supermaven',
            module = 'blink.compat.source',
            opts = {},
            score_offset = 100
        }
    }
}

return M
