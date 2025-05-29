-- catppuccin

vim.cmd('colorscheme catppuccin-mocha')

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

local TelescopeColor = {
    TelescopeMatching       = { fg = colors.mauve },
    TelescopeSelection      = { fg = colors.subtext0, bg = colors.mantle, bold = true },
    TelescopePromptPrefix   = { bg = colors.crust, fg = colors.crust },
    TelescopePromptBorder   = { bg = colors.crust, fg = colors.crust },
    TelescopePromptTitle    = { bg = colors.mauve, fg = colors.crust },
    TelescopePromptNormal   = { bg = colors.crust },
    TelescopeResultsNormal  = { bg = colors.base },
    TelescopeResultsBorder  = { bg = colors.base, fg = colors.base },
    TelescopeResultsTitle   = { fg = colors.base },
    TelescopePreviewNormal  = { bg = colors.mantle },
    TelescopePreviewBorder  = { bg = colors.mantle, fg = colors.mantle },
    TelescopePreviewTitle   = { bg = colors.green , fg = colors.crust },
    }

for hl, col in pairs(TelescopeColor) do
    vim.api.nvim_set_hl(0, hl, col)
end

-- nvim-tree

-- vim.cmd('highlight NvimTreeNormal guibg=#3B4252')
-- vim.cmd('highlight NvimTreeNormalFloat guibg=#3B4252')
-- vim.cmd('highlight NvimTreeCursorLine guibg=#4C566A')
vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { fg = colors.mantle })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { bg = colors.mantle, fg = colors.mantle })
vim.api.nvim_set_hl(0, 'NvimTreeStatusLine', { bg = colors.mantle, fg = colors.mantle })
vim.api.nvim_set_hl(0, 'NvimTreeStatusLineNC', { bg = colors.mantle, fg = colors.mantle })
-- Other

-- Transparent background

vim.cmd('hi Normal ctermbg=none guibg=none')
vim.cmd('hi NormalNC ctermbg=none guibg=none')
vim.cmd('hi NonText ctermbg=none guibg=none')
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colors.lavender })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = colors.base })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.crust, fg = colors.text })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = colors.crust, fg = colors.text })
-- vim.cmd('highlight StatusLine guifg=#eceff4')

-- bufferline

-- vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = colors.crust })
-- vim.api.nvim_set_hl(0, 'BufferLineSeparator', { bg = colors.mantle, fg = colors.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineOffsetSeparator', { bg = colors.mantle, fg = colors.mantle })

