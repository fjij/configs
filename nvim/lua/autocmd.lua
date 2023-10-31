local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opt = vim.opt

-- Show command line when recording macros
autocmd({ "RecordingEnter" }, {
  callback = function()
    opt.cmdheight = 1
  end,
})

autocmd({ "RecordingLeave" }, {
  callback = function()
    opt.cmdheight = 0
  end,
})

-- Set indent size by FileType
local function use_spaces(n)
  return function()
    opt.tabstop = n
    opt.softtabstop = n
    opt.shiftwidth = n
  end
end

local function use_tabs(n)
  return function()
    opt.autoindent = true
    opt.expandtab = false
    opt.tabstop = n
    opt.shiftwidth = n
  end
end

augroup("spacing", {})

autocmd("FileType", {
  group = "spacing",
  pattern = { "python", "c", "cpp", "rust", "sql", "solidity", "fish", "bash" },
  callback = use_spaces(4),
})

autocmd("FileType", {
  group = "spacing",
  pattern = { "javascript", "typescript", "markdown", "lua", "json", "yaml" },
  callback = use_spaces(2),
})

autocmd("FileType", {
  group = "spacing",
  pattern = { "go", "make" },
  callback = use_tabs(4),
})
