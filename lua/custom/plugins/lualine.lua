local custom = require('custom.lualine')

return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    opts = {
        options = custom.options,
        sections = custom.sections
    }
}
