local dap = require('dap')
local dapui = require('dapui')
require('custom.dap.python')

local map = vim.keymap.set

dapui.setup()

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.fn.sign_define(
    'DapBreakpoint',
    { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }
)
vim.fn.sign_define(
    'DapBreakpointCondition',
    { text = '', texthl = '', linehl = '', numhl = '' }
)
vim.fn.sign_define(
    'DapLogPoint',
    { text = '', texthl = '', linehl = '', numhl = '' }
)
vim.fn.sign_define(
    'DapStopped',
    {
        text = '',
        texthl = 'DiagnosticSignWarn',
        linehl = 'Visual',
        numhl = 'DiagnosticSignWarn'
    }
)
vim.fn.sign_define(
    'DapBreakpointRejected',
    { text = '', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }
)

map('n', '<leader>b', dap.toggle_breakpoint)
map('n', '<F1>', dap.continue)
map('n', '<F2>', dap.step_into)
map('n', '<F3>', dap.step_over)
map('n', '<F4>', dap.step_out)
map('n', '<F5>', dap.step_back)
map('n', '<F6>', dap.terminate)
