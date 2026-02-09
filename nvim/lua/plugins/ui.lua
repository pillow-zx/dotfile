return {
    {
        "snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    header = [[
 ██╗   ██╗██╗███╗   ███╗
 ██║   ██║██║████╗ ████║
 ██║   ██║██║██╔████╔██║
 ╚██╗ ██╔╝██║██║╚██╔╝██║
  ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═══╝  ╚═╝╚═╝     ╚═╝
                    ]],
                },
            },
        },
    },

    {
        "olimorris/onedarkpro.nvim",
        opts = {
            heighlights = {
                Comment = { italic = true },
                Directory = { bold = true },
                ErrorMsg = { italic = true, bold = true },
            },
            styles = {
                types = "NONE",
                methods = "NONE",
                numbers = "NONE",
                strings = "NONE",
                comments = "italic",
                keywords = "bold,italic",
                constants = "NONE",
                functions = "italic",
                operators = "NONE",
                variables = "NONE",
                parameters = "NONE",
                conditionals = "italic",
                virtual_text = "NONE",
            },
            cursorline = true
        },
        config = function(_, opts)
            require("onedarkpro").setup(opts)
            vim.cmd("colorscheme onedark")
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    }
}
