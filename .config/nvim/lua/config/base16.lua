-- tomorrow-night

vim.cmd('colorscheme base16-tomorrow-night')

-- NvimTree

vim.cmd('highlight NvimTreeEndOfBuffer guifg=#1A1B1D guibg=#1A1B1D')
vim.cmd('highlight NvimTreeWinSeparator guifg=#1A1B1D guibg=#1A1B1D')
vim.cmd('highlight NvimTreeNormal guibg=#1A1B1D')
vim.cmd('highlight NvimTreeStatusLine guifg=#1A1B1D guibg=#1A1B1D')
vim.cmd('highlight NvimTreeStatusLineNC guifg=#1A1B1D guibg=#1A1B1D')
vim.cmd('highligh LineNr guifg=#373B41')

-- TabLine

vim.cmd('highligh TabLineSel guifg=#1D1F21 guibg=#81A2B3')
vim.cmd('highligh TabLine guifg=#C5C8C6 guibg=#1D1F21')
vim.cmd('highligh TabLineFill guibg=#1D1F21')

-- StatusLine

vim.cmd('highligh StatusLine guibg=#1D1F21')
vim.opt.laststatus = 0

-- Nvim

-- Relative line numbers
-- vim.cmd('highlight LineNr guifg=#C5C8C6')
-- vim.cmd('highlight LineNrAbove guifg=#373B41')
-- vim.cmd('highlight LineNrBelow guifg=#373B41')

-- Normal line numbers
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.cmd('highlight LineNr guifg=#373B41')
vim.api.nvim_set_hl(0, "CursorLineNr", { underline = false, fg = "#C5C8C6" })

vim.cmd('highlight ModeMsg guifg=#C5C8C6')
