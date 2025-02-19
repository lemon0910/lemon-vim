-- basic
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- utf8
vim.g.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'

-- 文件修改之后自动载入
vim.o.autoread = true

vim.o.suffixes = '.bak,~,.o,.lo,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class'

vim.o.wildignore = '*.o,*.lo,*.obj,*~,*.exe,*.a,*.pdb,*.lib,*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex,*.svn,*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz,*DS_Store*,*.ipch,*.gem,*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**,*/.nx/**,*.app,*.git,.git,*.wav,*.mp3,*.ogg,*.pcm,*.mht,*.suo,*.sdf,*.jnlp,*.chm,*.epub,*.pdf,*.mobi,*.ttf*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc,*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps,*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu,*.gba,*.sfc,*.078,*.nds,*.smd,*.smc,*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android'

-- 突出显示当前行
vim.o.cursorline = true

-- For regular expressions turn magic on
vim.o.magic = true

-- Configure backspace so it acts as it should act
vim.o.backspace = 'eol,start,indent'
vim.o.whichwrap= 'b,s,<,>,[,]'

vim.o.tags= './tags;,tags'

-- 增强模式中的命令行自动完成操作
vim.o.wildmenu = true

-- 延迟绘制（提升性能）
-- vim.o.lazyredraw = true

-- Puts new vsplit windows to the right of the current
vim.o.splitright = true
-- Puts new split windows to the bottom of the current
vim.o.splitbelow = true
--Avoid the pop up menu occupying the whole scree
vim.o.pumheight = 20

-- 显示当前的行号列号
vim.o.ruler = true
-- 在状态栏显示正在输入的命令
vim.o.showcmd = true

-- 在上下移动光标时，光标的上方或下方至少会保留显示的行数
vim.o.scrolloff = 7

-- 括号配对情况, 跳转并高亮一下匹配的括号
vim.o.showmatch = true
-- How many tenths of a second to blink when matching brackets
vim.o.matchtime = 2

-- 设置文内智能搜索提示
-- 高亮search命中的文本
vim.o.hlsearch = true
-- 打开增量搜索模式,随着键入即时搜索
vim.o.incsearch = true
-- 搜索时忽略大小写
vim.o.ignorecase = true
-- 有一个或以上大写字母时仍大小写敏感
vim.o.smartcase = true

-- Smart indent
vim.o.smartindent = true
-- 打开自动缩进
-- never add copyindent, case error   " copy the previous indentation on autoindenting
vim.o.autoindent = true
vim.o.number = true

-- tab相关变更
-- 设置Tab键的宽度        [等同的空格个数]
-- vim.o.tabstop = 2
-- 每一次缩进对应的空格数
-- vim.o.shiftwidth = 2
-- 按退格键时可以一次删掉 2 个空格
-- vim.o.softtabstop = 2
-- insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 2 个空格
vim.o.smarttab = true
-- 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
vim.o.expandtab = true
-- 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
vim.o.shiftround = true

-- A buffer becomes hidden when it is abandoned
vim.o.wildmode = 'list:longest'
vim.o.ttyfast = true
vim.o.mouse = ''

vim.o.termguicolors = true
vim.o.background = 'dark'

function my_paste(reg)
    return function(lines)

        --[ 返回 “” 寄存器的内容，用来作为 p 操作符的粘贴物 ]
        local content = vim.fn.getreg('"')
        return vim.split(content, '\n')

    end
end

if (os.getenv('SSH_TTY') == nil)
then
    --[ 当前环境为本地环境，也包括 wsl ]
    vim.opt.clipboard:append("unnamedplus")
else
    vim.opt.clipboard:append("unnamedplus")
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        --[ 小括号里面的内容可能是毫无意义的，但是保持原样可能看起来更好一点 ]
        ["+"] = my_paste("+"),
        ["*"] = my_paste("*"),
    },
}
end

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "checkhealth",
    "dbout",
    "gitsigns-blame",
    "grug-far",
    "help",
    "lspinfo",
    "neotest-output",
    "neotest-output-panel",
    "neotest-summary",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "git",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set("n", "q", function()
        vim.cmd("close")
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = "Quit buffer",
      })
    end)
  end,
})

-- set indent to 2 for lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lua",
    "c",
    "cpp"
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "go"
  },
  callback = function()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp", "vim", "lua", "go", "python", "vimdoc", "query", "markdown", "markdown_inline"},
  callback = function()
    vim.cmd("TSEnable highlight")
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
