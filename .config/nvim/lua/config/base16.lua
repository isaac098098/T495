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
