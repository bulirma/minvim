return {
    'rebelot/kanagawa.nvim',
    {
        lazy = false,
        'sainnhe/gruvbox-material',
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme('gruvbox-material')
        end
    }
}
