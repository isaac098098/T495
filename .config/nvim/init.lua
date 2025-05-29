-- Vim

-- Filetypes
vim.cmd('filetype plugin on')
-- vim.cmd('filetype indent on')

-- Tabs andd indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Line numbering
vim.opt.number = false
vim.opt.numberwidth = 1

-- Highlighting
vim.cmd('let loaded_matchparen=1')
-- vim.api.nvim_create_autocmd('Filetype', {
--     pattern = '*',
--     callback = function()
--         vim.treesitter.stop()
--     end
-- })
-- vim.cmd('syntax off')

-- Keybindings

vim.g.mapleader = ' '
vim.g.localleader = '\\'

-- Normal mode
vim.keymap.set('n','j','gj')
vim.keymap.set('n','k','gk')
vim.keymap.set('n','rt','gt')
vim.keymap.set('n','T','gT')
vim.cmd('nnoremap <CR> :write<CR>')

-- Visual mode
vim.keymap.set('v','<C-j>','<Esc>')

-- Select mode
vim.keymap.set('s','<C-j>','<Esc>')

-- Insert mode
vim.keymap.set('i','<C-j>','<Esc>')
vim.keymap.set('i','<C-e>','<C-o>$')

--Plugins

require("config.lazy")

-- vimtex

vim.cmd('highlight VimTeXInfo guifg=#81A1C1')

local function synctex()
    local cwd = vim.fn.expand('%:p:h')
    local filename = vim.fn.expand('%:t:r')
    local pdf_path = cwd .. "/" .. filename .. ".pdf"

    if vim.fn.filereadable(pdf_path) == 0 then
        pdf_path = cwd .. "/main.pdf"
        if vim.fn.filereadable(pdf_path) == 0 then
            pdf_path = vim.fn.expand('%:p:h:h') .. "/main.pdf"
        end
    end

    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local texfile = vim.fn.expand('%:p')

    local param = string.format("--synctex-forward %d:%d:%s %s", line, col, texfile, pdf_path)

    -- vim.notify("line: " .. line .. ", col: " .. col)

    vim.fn.jobstart("zathura -x 'nvr --remote +%{line} %{input}' " .. param)
    vim.cmd('redraw!')
end

vim.keymap.set('n', '<C-CR>', synctex, { noremap = true, silent = true })

-- theme colors
-- load at the end

-- catppuccin palette

local colors = {
    crust       = '#11111B',
    mantle      = '#181825',
    base        = '#1E1E2E',
    surface0    = '#313244',
    surface1    = '#45475A',
    surface2    = '#585B70',
    overlay0    = '#6C7086',
    overlay1    = '#7F849C',
    overlay2    = '#9399B2',
    subtext0    = '#A6ADC8',
    subtext1    = '#BAC2DE',
    text        = '#CDD6F4',
    lavender    = '#B4BEFE',
    blue        = '#89B4FA',
    sapphire    = '#74C7EC',
    sky         = '#89DCEB',
    teal        = '#94E2D5',
    green       = '#A6E3A1',
    yellow      = '#F9E2AF',
    peach       = '#FAB387',
    maroon      = '#EBA0AC',
    red         = '#F38BA8',
    mauve       = '#CBA6F7',
    pink        = '#F5C2E7',
    flamingo    = '#F2CDCD',
    rosewater   = '#F5E0DC'
}

-- bufferline

vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = colors.crust })
vim.api.nvim_set_hl(0, 'BufferLineBackground', { bg = colors.crust })
vim.api.nvim_set_hl(0, 'BufferLineSeparator', { bg = colors.mantle, fg = colors.mantle })
vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', { bg = colors.crust, fg = colors.crust })

-- hide end of buffer chars

vim.opt.fillchars:append('eob: ')
