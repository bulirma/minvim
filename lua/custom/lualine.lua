local M = {}

local function filesubdir()
    local cwd = vim.fn.getcwd()
    if cwd == nil then
        return ''
    end

    local fd = vim.fn.expand('%:p:h')
    if fd == nil then
        return ''
    end

    local rd = vim.fs.relpath(cwd, fd)
    if rd == '.' then
        return ''
    end

    return rd
end

local function fmtmode(mode, _)
    if mode == 'NORMAL' then
        return 'N'
    end
    if mode == 'COMMAND' then
        return 'C'
    end
    if mode == 'INSERT' then
        return 'I'
    end
    if mode == 'VISUAL' then
        return 'V'
    end
    if mode == 'V-LINE' then
        return 'VL'
    end
    if mode == 'V-BLOCK' then
        return 'VB'
    end
    if mode == 'TERMINAL' then
        return 'T'
    end
    return mode
end

M.options = {
    theme = 'auto',
    icons_enabled = true,
    globalstatus = true,
    component_separators = {
        left = '',
        right = ''
    },
    section_separators = {
        left = '',
        right = ''
    }
}

M.sections = {
    lualine_a = { { 'mode', fmt = fmtmode } },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
        { 'location', separator = '󰉸' },
        'progress'
    },
    lualine_x = { 'filetype' },
    lualine_y = { 'fileformat', 'encoding' },
    lualine_z = {
        { filesubdir, separator = '' },
        'filename'
    }
}

return M
