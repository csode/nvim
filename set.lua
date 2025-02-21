-- List of available colorschemes
local themes = {
    "vague",
    "gruvbox",
    "catppuccin",
    "rose-pine",
    "tokyonight",
}

-- Function to switch to a random theme
local function switch_random_theme()
    local random_theme = themes[math.random(#themes)]
    vim.cmd.colorscheme(random_theme)
    vim.notify("Switched to " .. random_theme)
end

-- Set default colorscheme
vim.cmd.colorscheme("catppuccin")

-- Keybind to switch themes randomly (using <leader>rt for "random theme")
vim.keymap.set("n", "<leader>rt", switch_random_theme, { desc = "Switch to random theme" }) 