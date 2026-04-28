vim.pack.add({
	"https://github.com/nvim-mini/mini.starter",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini-git",
	"https://github.com/nvim-mini/mini.diff",
	"https://github.com/nvim-mini/mini.comment",
})

-- Start screen
require("mini.starter").setup({
	footer = "",
})

require("mini.comment").setup()

-- Icon provider, replace nvim_web_devicons
require("mini.icons").setup()

require("mini.git").setup()

require("mini.diff").setup({
	view = {
		style = "sign",
		signs = {
			add = "+",
			change = "|",
			delete = "-",
		},
	},
})

vim.api.nvim_set_hl(0, "MiniDiffSignAdd", { fg = "#A6E22E", bold = true }) -- Lime Green
vim.api.nvim_set_hl(0, "MiniDiffSignChange", { fg = "#66D9EF", bold = true }) -- Sky Blue
vim.api.nvim_set_hl(0, "MiniDiffSignDelete", { fg = "#F92672", bold = true }) -- Electric Pink/Red
