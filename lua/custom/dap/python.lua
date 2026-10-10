local dap = require('dap')

local python = vim.fn.exepath('python')
local debugpy_mason_dir = vim.fn.stdpath('data') .. '/mason/packages/debugpy'
local debugpy_python = debugpy_mason_dir .. '/venv/bin/python'

dap.adapters.debugpy = {
    type = 'executable',
    command = debugpy_python,
    args = { '-m', 'debugpy.adapter' },
    options = { source_filetype = 'python' }
}

dap.configurations.python = {
    {
        name = 'launch debugpy',
        type = 'debugpy',
        request = 'launch',
        program = '${file}',
        console = 'integratedTerminal',
        pythonPath = function () return python end
    }
}
