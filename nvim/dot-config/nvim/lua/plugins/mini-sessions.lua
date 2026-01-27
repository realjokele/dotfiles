return {
	"nvim-mini/mini.sessions",
	version = "*",
	config = function()
		require("mini.sessions").setup({
			file = "session.vim",
		})
	end,
}
