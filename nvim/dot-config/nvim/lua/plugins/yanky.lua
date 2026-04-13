vim.pack.add({
	"https://github.com/gbprod/yanky.nvim",
})

-- Keymaps
-- stylua: ignore start
vim.keymap.set({ "n", "x" }, "<leader>y", function() load_yanky(); require("snacks").picker.yanky() end, { desc = "Yank History" })
vim.keymap.set({ "n", "x" }, "y", function() load_yanky(); return "<Plug>(YankyYank)" end, { expr = true })
vim.keymap.set({ "n", "x" }, "p", function() load_yanky(); return "<Plug>(YankyPutAfter)" end, { expr = true })
vim.keymap.set({ "n", "x" }, "P", function() load_yanky(); return "<Plug>(YankyPutBefore)" end, { expr = true })
vim.keymap.set("n", "<C-p>", function() load_yanky(); return "<Plug>(YankyCycleForward)" end, { expr = true })
vim.keymap.set("n", "<C-n>", function() load_yanky(); return "<Plug>(YankyCycleBackward)" end, { expr = true })
-- stylua: ignore end
