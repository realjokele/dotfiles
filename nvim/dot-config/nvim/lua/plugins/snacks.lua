vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
	explorer = { enabled = true, replace_netrw = true },
})
