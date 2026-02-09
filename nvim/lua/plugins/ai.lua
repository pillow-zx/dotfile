return {
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        build = "make",
        opts = {
            provider = "copilot",
            auto_suggestions_provider = "copilot",
            providers = {
                copilot = {
                    endpoint = "https://api.githubcopilot.com",
                    model = "gpt-4o-2024-05-13",
                    timeout = 30000,
                    temperature = 0,
                    extra_request_body = {
                        max_tokens = 4096,
                    },
                },
            },
        },
        config = function(_, opts)
            require("avante").setup(opts)

            local utils = require("avante.utils")
            local config = require("avante.config")
            local old_icon = utils.icon

            utils.icon = function(string_with_icon, utf8_fallback)
                -- 检查是否是侧边栏标题所使用的那个图标
                if string_with_icon == "󱜸 " then
                    -- 动态获取当前 provider 的模型名称
                    -- 使用 config.provider 确保切换了 provider，显示也能对应上
                    local current_provider = config.provider
                    local model = config.get_provider_config(current_provider).model
                    return string.format("󱜸 [%s] ", model)
                else
                    return old_icon(string_with_icon, utf8_fallback)
                end
            end
        end,
    },
}
