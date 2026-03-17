vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_options = "--fork --synctex-forward @line:@col:@pdf @tex"
vim.g.vimtex_motion_matchparen = false
vim.g.vimtex_matchparen_enabled = false
vim.g.vimtex_compiler_silent = false
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_forward_search_on_start = false
vim.g.vimtex_quickfix_mode = false
vim.g.vimtex_view_automatic = false
vim.g.vimtex_toc_mode = 1
vim.g.vimtex_toc_config = {
    split_pos   = 'tab'
}
vim.g.vimtex_complete_bib = {
    info_fmt    = ''
}
vim.g.vimtex_compiler_latexmk_engines = {
    ['_']       = '-pdf',
    pdfdvi      = '-pdfdvi',
    pdfps       = '-pdfps',
    pdflatex    = '-pdf',
    lualatex    = '-lualatex',
    xelatex     = '-xelatex',
    pdftex      = '-pdf -pdflatex=texexec',
    luatex      = '-pdf -pdflatex=context',
    xetex       = '-pdf -pdflatex=\'texexec --xtx\''
}
vim.g.vimtex_compiler_latexmk = {
    build_dir   = '',
    callback    = 1,
    continuous  = 0,
    executable  = 'latexmk',
    hooks       = {},
    options     = {
        '-pdf',
        -- '-xelatex',
        -- '-shell-escape',
        --use shell-escape for standalone document
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode'
    }
}

-- vim.cmd('highlight VimTeXInfo guifg=#81A1C1')

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'tex',
    callback = function()
        vim.api.nvim_set_keymap('n', '<Leader>tt', ':VimtexTocToggle<CR>', { noremap = true, silent = true })
    end
})

-- forward search for wayland

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
