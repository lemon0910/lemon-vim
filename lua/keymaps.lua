-- HotKey Settings  自定义快捷键设置

vim.g.mapleader = ','
vim.g.maplocalleader = ' '

-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = {
  noremap = true,
  silent = true
}

function CloseOtherBuf()
    local current_buf_num = vim.fn.bufnr("%")
    local last_num = vim.fn.bufnr("$")
    for  i = 1, last_num do
        if 1 == vim.fn.buflisted(i) and i ~= current_buf_num
        then
            vim.cmd("bdelete " .. i)
        end
    end
end

-- Keep search pattern at the center of the screen.
map("n", "n", "nzz", opt)
map("n", "N", "Nzz", opt)
map("n", "*", "*zz", opt)
map("n", "#", "#zz", opt)
map("n", "g*", "g*zz", opt)

map("n", "j", "gj", opt)
map("n", "k", "gk", opt)
map("v", "j", "gj", opt)
map("v", "k", "gk", opt)

-- ctags相关设置
-- map("n", "gd", ":execute 'tjump ' . expand('<cword>') <CR>", opt)
-- map("n", "gb", "<C-O>", opt)

-- Move to the start of line
map("n", "H", "^", opt)
-- Move to the end of line
map("n", "L", "$", opt)

-- 退出相关
map("n", "<leader>q", ":q<CR>", opt)
map("n", "<leader>ww", ":w<CR>", opt)

-- normal模式下切换到确切的buffer
map("n", "<leader>bd", ":bd<CR>", opt)
map("n", "<leader>ba", ":%bd<CR>", opt)
map("n", "<leader>bo", ":lua CloseOtherBuf()<CR>", opt)

-- <Leader>b[1-9] move to buffer [1-9]
for i = 1, 9 do
    map("n", "<leader>" .. i, ":b" .. i .. "<CR>", opt)
end

map("n", "<Tab>", ":bn<CR>", opt)
map("n", "<S-Tab>", ":bp<CR>", opt)

-- 去掉搜索高亮
map("n", "<leader>sc", ":nohls<CR>", opt)

map("n", ";", ":", opt)
