local opt = vim.opt

-- Line Numbers
opt.number = true
opt.relativenumber = true

-- Columns
opt.colorcolumn = "81"
opt.wrap = false

-- Tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.expandtab = true

-- Disable Modelines
opt.modelines = 0
opt.modeline = false

-- Disable hidden
opt.hidden = false

-- Disable mouse
opt.mouse = ""

-- Backups
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Sign column
opt.signcolumn = "number"

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Block cursor
opt.guicursor = ""

-- Misc
opt.termguicolors = true

-- Folding
function _G.my_fold_text()
    local a = vim.fn.getline(vim.v.foldstart)
    local b = vim.fn.getline(vim.v.foldend):gsub("^%s*(.-)%s*$", "%1")
    return a .. " ... " .. b
end

opt.foldenable = false
opt.foldmethod = "syntax"
opt.foldlevelstart = 99
opt.foldtext = "v:lua.my_fold_text()"
opt.foldnestmax = 3
opt.foldminlines = 1
opt.fillchars = "fold: "
