-- Show command line when recording macros
vim.api.nvim_create_autocmd({"RecordingEnter"}, {
    callback = function()
        vim.opt.cmdheight = 1
    end
})

vim.api.nvim_create_autocmd({"RecordingLeave"}, {
    callback = function()
        vim.opt.cmdheight = 0
    end
})
