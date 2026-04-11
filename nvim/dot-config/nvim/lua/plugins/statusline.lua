vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.statusline" },
})

-- Statusline
require("mini.statusline").setup({
	content = {
		active = function()
			local statusline = require("mini.statusline")
			local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
			local lsp = statusline.section_lsp({ trunc_width = 75 })
			local git = statusline.section_git({ trunc_width = 75 })
			local diff = statusline.section_diff({ trunc_width = 75 })
			local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
			local filename = statusline.section_filename({ trunc_width = 140 })
			local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
			local location = "%l:%c | %p%%"

			-- Return the combined string using MiniStatusline.combine_groups
			return statusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },

				"%<", -- Mark for truncating
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { location } },
			})
		end,
	},
})
