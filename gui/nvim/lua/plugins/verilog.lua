return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "verilog",
        -- "systemverilog",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        verible = {
          cmd = {
            "verible-verilog-ls",
            "--rules_config_search",
            -- 禁用模块参数实例化检查和其他规则
            "--rules=-explicit-parameter-storage-type,-always-comb,-unpacked-dimensions-range-ordering,-generate-label,-module-parameter",
          },
          filetypes = { "verilog", "systemverilog" },
          root_dir = function(fname)
            local git_root = vim.fs.dirname(vim.fs.find(".git", {
              path = fname,
              upward = true,
            })[1])
            return git_root or vim.fn.getcwd()
          end,
          settings = {},
          -- 添加错误处理
          on_attach = function(client, bufnr)
            -- 禁用一些可能导致问题的功能
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        },
        -- 禁用 jdtls 如果不需要 Java 支持
        jdtls = false,
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "verible",
        -- 移除 jdtls 如果不需要
        -- "jdtls",
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.verilog = { "verible-verilog-format" }
      opts.formatters_by_ft.systemverilog = { "verible-verilog-format" }

      opts.formatters = opts.formatters or {}
      opts.formatters["verible-verilog-format"] = {
        command = "verible-verilog-format",
        args = { "--stdin_name", "$FILENAME", "-" },
        stdin = true,
      }
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.verilog = { "verilator" }
      opts.linters_by_ft.systemverilog = { "verilator" }

      opts.linters = opts.linters or {}
      opts.linters.verilator = {
        cmd = "verilator",
        stdin = false,
        args = {
          "--lint-only",
          "-Wall",
          -- 禁用文件名与模块名不匹配的警告
          "-Wno-DECLFILENAME",
          -- 禁用未使用模块的警告（当模块在其他文件中被调用时）
          "-Wno-UNUSED",
          -- 禁用顶层模块相关警告
          "-Wno-PINMISSING",
          "-Wno-PINCONNECTEMPTY",
          -- 禁用时钟域相关的一些警告（如果需要的话）
          "-Wno-SYNCASYNCNET",
          -- 不指定顶层模块，让 Verilator 自动处理多模块文件
          function()
            return vim.api.nvim_buf_get_name(0)
          end,
        },
        stream = "stderr",
        ignore_exitcode = true,
        parser = require("lint.parser").from_errorformat("%f:%l:%c: %t%*[^:]: %m", {
          source = "verilator",
        }),
      }
    end,
  },
}
