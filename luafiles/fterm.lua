local fterm = require("FTerm")

fterm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Example keybindings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

local lazygit = fterm:new({
    ft = 'fterm_gitui',
    cmd = "lazygit"
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set('n', '<A-g>', function()
    lazygit:toggle()
end)

local gotop = fterm:new({
    ft = 'fterm_gitui',
    cmd = "gotop"
})

-- Use this to toggle gotop in a floating terminal
vim.keymap.set('n', '<A-t>', function()
    gotop:toggle()
end)
