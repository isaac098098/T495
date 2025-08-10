-- Vim

-- Filetypes

vim.cmd('filetype plugin on')

-- Tabs andd indentation

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true
vim.opt.linebreak = true

-- Line numbering

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1

-- Syntax highlighting

vim.cmd('let loaded_matchparen=1')

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

-- Plugins

require("config.lazy")

-- hide end of buffer chars

vim.opt.fillchars:append('eob: ')

-- deprecated

-- forward search wayland

-- local function synctex()
    -- local cwd = vim.fn.expand('%:p:h')
    -- local filename = vim.fn.expand('%:t:r')
    -- local pdf_path = cwd .. "/" .. filename .. ".pdf"
 
    -- if vim.fn.filereadable(pdf_path) == 0 then
        -- pdf_path = cwd .. "/main.pdf"
        -- if vim.fn.filereadable(pdf_path) == 0 then
            -- pdf_path = vim.fn.expand('%:p:h:h') .. "/main.pdf"
        -- end
    -- end
 
    -- local line = vim.fn.line('.')
    -- local col = vim.fn.col('.')
    -- local texfile = vim.fn.expand('%:p')
 
    -- local param = string.format("--synctex-forward %d:%d:%s %s", line, col, texfile, pdf_path)
 
    -- -- vim.notify("line: " .. line .. ", col: " .. col)
 
    -- vim.fn.jobstart("zathura -x 'nvr --remote +%{line} %{input}' " .. param)
    -- vim.cmd('redraw!')
-- end
 
-- vim.keymap.set('n', '<C-CR>', synctex, { noremap = true, silent = true })

-- vimtex

-- vim.cmd('highlight VimTeXInfo guifg=#81A1C1')
