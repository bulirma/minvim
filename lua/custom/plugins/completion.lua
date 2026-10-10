local custom = require('custom.completion')

return {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
        'saghen/blink.compat',
        'Kaiser-Yang/blink-cmp-avante'
    },
    opts = {
        keymap = custom.keymaps,
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = custom.completion,
        sources = custom.sources,
        signature = { enabled = true }
    }
}
