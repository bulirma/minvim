return {
    enabled = vim.g.use_ai_plugins,
    'yetone/avante.nvim',
    build = 'make',
    event = 'VeryLazy',
    version = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'MunifTanjim/nui.nvim',
        {
            'ColinKennedy/mega.cmdparse',
            dependencies = { 'ColinKennedy/mega.logging' }
        },
        'ibhagwan/fzf-lua',
        'Kaiser-Yang/blink-cmp-avante',
        'nvim-tree/nvim-web-devicons'
    },
    opts = {
        providers = {}
    }
}
