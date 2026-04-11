vim.pack.add({
	"https://github.com/nvim-mini/mini.starter",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.icons",
})

-- Start screen
require("mini.starter").setup({
	footer = "",
})

-- Autopairs
require("mini.pairs").setup()

-- Icon provider, replace nvim_web_devicons
require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()
