-- Random theme switcher
vim.keymap.set("n", "<leader>tr", function()
    _G.random_theme()
end, { desc = "Random theme" }) 