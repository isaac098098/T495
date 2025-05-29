-- using c-t to open terminal in the current directory
-- using c-i to open terminal in the home directory

-- catppuccin-mocha

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

-- get nvim-tree width

function get_nvim_tree_width()
    -- Get all the windows in the current tab
    local windows = vim.api.nvim_tabpage_list_wins(0)

    for _, win in ipairs(windows) do
        local buf = vim.api.nvim_win_get_buf(win)
        local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
        if ft == 'NvimTree' then
            return vim.api.nvim_win_get_width(win)
        end
    end

    return -1 -- Return 1 if nvim-tree is not open
end

-- open terminal in current directory

function cwd_term()
    local dir = vim.fn.expand('%:p:h')
    local terminal = require('toggleterm.terminal').Terminal:new({
        cmd = 'bash',
        dir = dir,
        direction = 'float',
        start_in_insert = true,
        float_opts = {
            border = 'rounded',
            width = vim.o.columns - get_nvim_tree_width() - 3,
            height = 10,
            col = vim.o.columns - get_nvim_tree_width(),
            row = vim.o.lines - 10,
        },
    }):toggle()
end

vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>lua cwd_term()<CR>', { noremap = true, silent = true })

require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    direction = 'float',
    open_mapping = '<C-y>', -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    hide_numbers = true, -- hide the number column in toggleterm buffers
    on_open = function(term)
        vim.api.nvim_set_hl(0, 'MsgArea', { fg = colors.base })
        vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colors.base })
    end,
    on_close = function(term)
        vim.api.nvim_set_hl(0, 'MsgArea', { fg = colors.text })
        vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colors.lavender })
    end,
    autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
    shading_factor = '-10',
    shading_ratio = '0',
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        Normal = {
            guibg = colors.crust,
            guifg = colors.text,
        },
        NormalFloat = {
            guibg = colors.crust,
            guifg = colors.text,
        },
        FloatBorder = {
            guibg = colors.crust,
            guifg = colors.crust,
        },
    },
    start_in_insert = true,
    insert_mappings = false,
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    clear_env = false, -- use only environmental variables from `env`, passed to jobstart()
    -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    float_opts = {
        border = 'rounded',
        width = vim.o.columns - get_nvim_tree_width() - 3,
        height = 10,
        col = vim.o.columns - get_nvim_tree_width(),
        row = vim.o.lines - 10,
    },
}
