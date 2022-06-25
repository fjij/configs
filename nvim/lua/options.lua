local utils = require("utils")

-- Line Numbers
utils.set("number", true)
utils.set("relativenumber", true)

-- Columns
utils.set("textwidth", 80)
utils.set("wrap", 0)

-- Tabs
utils.set("tabstop", 2)
utils.set("softtabstop", 2)
utils.set("shiftwidth", 2)
utils.set("autoindent", true)
utils.set("expandtab", true)

-- Disable Modelines
utils.set("modelines", 0)
utils.set("modeline", false)

-- Disable hiden
utils.set("hidden", false)

-- Backups
utils.set("swapfile", false)
utils.set("backup", false)
-- utils.set("undodir", "~/.vim/undodir")
utils.set("undofile", true)

-- Sign column
utils.set("signcolumn", "number")

-- Search
utils.set("incsearch", true)

-- Block cursor
utils.set("guicursor", "")

-- Starting in replace mode fix
utils.set("t_u7", "")
