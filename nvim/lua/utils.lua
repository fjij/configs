local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.set(name, value)
  vim.api.nvim_set_option_value(name, value, {})
end

function M.set_local(name, value)
  vim.api.nvim_set_option_value(name, value, { scope = 'local' })
end

function M.set_var(name, value)
  vim.api.nvim_set_var(name, value)
end

return M
