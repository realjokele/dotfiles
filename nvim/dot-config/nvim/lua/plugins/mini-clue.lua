return {
	"nvim-mini/mini.clue",
	version = "*",
	config = function()
		local miniclue = require("mini.clue")
		miniclue.setup({
			window = {
				delay = 200,
				config = {
					width = 50,
				},
			},
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<leader>" },
				{ mode = "x", keys = "<leader>" },

				-- `[` and `]` keys
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				{ mode = "n", keys = "<Leader>b", desc = "+Buffer" },
				{ mode = "n", keys = "<Leader>f", desc = "+Picker" },
				{ mode = "n", keys = "<Leader>g", desc = "+Git" },
				{ mode = "x", keys = "<Leader>g", desc = "+Git" },
				{ mode = "n", keys = "<Leader>w", desc = "+Windows" },
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.square_brackets(),
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
		miniclue.ensure_all_triggers()
		return miniclue
	end,
}
