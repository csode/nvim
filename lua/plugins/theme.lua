return {
    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                transparent = true, -- Enables transparency
            })

            -- Ensure Neovim background is fully transparent
            vim.cmd([[
                colorscheme vague
                highlight Normal guibg=NONE ctermbg=NONE
                highlight NonText guibg=NONE ctermbg=NONE
                highlight NormalNC guibg=NONE ctermbg=NONE
                highlight LineNr guibg=NONE ctermbg=NONE
                highlight CursorLineNr guibg=NONE ctermbg=NONE
                highlight CursorLine guibg=NONE ctermbg=NONE
            ]])
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
            })
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                transparent_background = true,
            })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                transparent = true,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        keys = {
            { "<leader>tr", function() _G.random_theme() end, desc = "Random theme" },
        },
        config = function()
            -- Function to apply consistent transparency settings
            local function apply_transparency()
                vim.cmd([[
                    highlight Normal guibg=NONE ctermbg=NONE
                    highlight NonText guibg=NONE ctermbg=NONE
                    highlight NormalNC guibg=NONE ctermbg=NONE
                    highlight LineNr guibg=NONE ctermbg=NONE
                    highlight CursorLineNr guibg=NONE ctermbg=NONE
                    highlight CursorLine guibg=NONE ctermbg=NONE
                ]])
            end

            _G.themes = {
                ["tokyonight"] = function()
                    vim.cmd([[colorscheme tokyonight]])
                    apply_transparency()
                end,
                ["gruvbox"] = function()
                    vim.cmd([[colorscheme gruvbox]])
                    apply_transparency()
                end,
                ["catppuccin"] = function()
                    vim.cmd([[colorscheme catppuccin]])
                    apply_transparency()
                end,
                ["rose-pine"] = function()
                    vim.cmd([[colorscheme rose-pine]])
                    apply_transparency()
                end,
                ["vague"] = function()
                    vim.cmd([[colorscheme vague]])
                    apply_transparency()
                end,
            }

            _G.random_theme = function()
                local theme_names = {}
                for name, _ in pairs(_G.themes) do
                    table.insert(theme_names, name)
                end
                local random_index = math.random(#theme_names)
                local selected_theme = theme_names[random_index]
                _G.themes[selected_theme]()
                vim.notify("Theme set to: " .. selected_theme)
            end

            require("tokyonight").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            apply_transparency()
        end,
    },
}

