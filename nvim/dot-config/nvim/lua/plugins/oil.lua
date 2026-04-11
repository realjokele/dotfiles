vim.pack.add {
  { src = "https://github.com/stevearc/oil.nvim" }
}

require("oil").setup({
  float = {
				border = "rounded",
				padding = 5,
			},
})

vim.keymap.set("n", "<space>ö", require("oil").toggle_float, { desc = "Open oil" })
