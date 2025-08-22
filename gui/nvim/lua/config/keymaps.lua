-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VSCode style debugging keymaps
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "Continue debugging" })

vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "Step over" })

vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "Step into" })

vim.keymap.set("n", "<S-F11>", function()
  require("dap").step_out()
end, { desc = "Step out" })

vim.keymap.set("n", "<F9>", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
