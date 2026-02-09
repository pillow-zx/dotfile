-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.ai_cmp = true

vim.opt.clipboard = "unnamedplus" -- Use system clipboard
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.softtabstop = 4 -- Number of spaces a <Tab> counts for while performing editing operations
vim.opt.expandtab = true -- Use spaces instead of tabs

vim.opt.swapfile = false

if vim.g.neovide then
    vim.g.neovide_scale_factor = 0.85
    vim.g.neovide_ligatures = true
    vim.g.neovide_refresh_rate = 144
end
