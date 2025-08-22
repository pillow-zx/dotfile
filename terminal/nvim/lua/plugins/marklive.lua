return {
  "yelog/marklive.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  lazy = true,
  ft = { "markdown" },
  opts = {
    -- default options
    live = true, -- enable live preview
    open_cmd = "tabedit", -- command to open the preview window
    width = 80, -- width of the preview window
    height = 20, -- height of the preview window
    position = "right", -- position of the preview window
    border = "rounded", -- border style of the preview window
  },
}
