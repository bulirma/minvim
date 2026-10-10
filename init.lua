vim.g.use_ai_plugins = vim.g.use_ai_plugins or false

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(
    { import = 'custom/plugins'},
    {
        git = {
            -- some time to build avante.nvim
            timeout = 900
        }
    }
)
