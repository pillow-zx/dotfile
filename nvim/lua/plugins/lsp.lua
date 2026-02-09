return {
    -- add pyright to lspconfig
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            servers = {
                -- pyright will be automatically installed with mason and loaded with lspconfig
                pyright = {},
                svlangserver = {},
                clangd = {},
            },
        },
    },

    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "vim",
                "yaml",
                "verilog",
            },
            hightlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        },
    },

    -- add any tools you want to have installed below
    {
        "mason-org/mason.nvim",
        opts = {
            ensure_installed = {
                "stylua",
                "shellcheck",
                "shfmt",
                "flake8",
            },
        },
    },

    -- change trouble config
    {
        "folke/trouble.nvim",
        opts = {
            use_diagnostic_signs = true,
        },
        enabled = true,
    },
}
