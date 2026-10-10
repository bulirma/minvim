return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    config = function ()
        require('nvim-treesitter.config').setup({
            indent = { enable = true },
            ensure_installed = {
                'lua'
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        })
    end,
    build = ':TSUpdate'
}
