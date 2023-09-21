local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local opt = vim.opt

-- Show command line when recording macros
autocmd({"RecordingEnter"}, {
  callback = function()
    opt.cmdheight = 1
  end
})

autocmd({"RecordingLeave"}, {
  callback = function()
    opt.cmdheight = 0
  end
})


-- Set indent size by FileType
local function set_indent_size(n)
  return function()
    opt.tabstop = n
    opt.softtabstop = n
    opt.shiftwidth = n
  end
end

augroup('indent_size', {})

autocmd('FileType', {
  group = 'indent_size',
  pattern = {'python', 'c', 'cpp', 'rust'},
  callback = set_indent_size(4),
})

autocmd('FileType', {
  group = 'indent_size',
  pattern = {'javascript', 'typescript', 'markdown', 'lua', 'json'},
  callback = set_indent_size(2),
})
