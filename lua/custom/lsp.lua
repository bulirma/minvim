local map = vim.keymap.set

local servers = {
    lua_ls = {
        settings = {
            Lua = {
                telemetry = { enable = false }
            }
        }
    }
}

local sign_type = vim.diagnostic.severity

local diagnostic_settings = {
    signs = {
        text = {
            [sign_type.ERROR] = '',
            [sign_type.WARN] = '',
            [sign_type.HINT] = '',
            [sign_type.INFO] = ''
        }
    }
}

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function (event)
        map('n', 'K', vim.lsp.buf.hover, { buffer = event.buf })
        map('n', '<c-k>', vim.lsp.buf.signature_help, { buffer = event.buf })

        local fzf = require('fzf-lua')
        if fzf ~= nil then
            map('n', '<leader>sr', fzf.lsp_references, { buffer = event.buf })
            map('n', '<leader>si', fzf.lsp_implementations, { buffer = event.buf })
            map('n', '<leader>sd', fzf.lsp_definitions, { buffer = event.buf })
            map('n', '<leader>sl', fzf.lsp_declarations, { buffer = event.buf })
        end
    end
})

vim.diagnostic.config(diagnostic_settings)

local capabilities = require('blink.cmp').get_lsp_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
})

for name, settings in pairs(servers) do
    local default = vim.lsp.config[name]

    if default then
        local merged = vim.tbl_deep_extend('force', {}, default, {
            capabilities = vim.tbl_deep_extend('force', {}, capabilities, settings.capabilities or {})
        })
        merged = vim.tbl_deep_extend('force', merged, settings)
        vim.lsp.config(name, merged)
    else
        vim.notify('No default config found for ' .. name .. ' in nvim-lspconfig', vim.log.levels.WARN)
    end

    vim.lsp.enable(name)
end

vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    once = true,
    callback = function()
        local mason_registry = require('mason-registry')
        if not mason_registry.is_installed('tree-sitter-cli') then
            vim.defer_fn(function()
                mason_registry.refresh()
                mason_registry.get_package('tree-sitter-cli'):install()
            end, 100)
        end
    end,
})
