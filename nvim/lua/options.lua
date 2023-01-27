-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Columns
vim.opt.colorcolumn = "81"
vim.opt.wrap = false

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.expandtab = true

-- Disable Modelines
vim.opt.modelines = 0
vim.opt.modeline = false

-- Disable hidden
vim.opt.hidden = false

-- Disable mouse
vim.opt.mouse = ""

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Sign column
vim.opt.signcolumn = "number"

-- Search
vim.opt.incsearch = true

-- Block cursor
vim.opt.guicursor = ""

-- Misc
vim.opt.termguicolors = true

-- Folding
function _G.my_fold_text()
    local a = vim.fn.getline(vim.v.foldstart)
    local b = vim.fn.getline(vim.v.foldend):gsub("%s+", "")
    return a .. " ... " .. b
end

vim.opt.foldenable = false
vim.opt.foldmethod = "syntax"
vim.opt.foldlevelstart = 99
vim.opt.foldtext = "v:lua.my_fold_text()"
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
vim.opt.fillchars = "fold: " 
