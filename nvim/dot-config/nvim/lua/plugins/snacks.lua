return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
  -- stylua: ignore start
	keys = {
		{ "<leader>,", false },
		{ "<leader><space>", function() require("snacks").picker.buffers() end, desc = "Buffers", },
    -- system
		{ "<leader>n", function() require("snacks").notifier.show_history() end, desc = "Notifier History", },
		{ "<leader>,", function() require("snacks").picker.buffers() end, desc = "Buffers", },
		{ "<leader>h", function() require("snacks").picker.help() end, desc = "Help", },
		{ "<leader>e", function() require("snacks").explorer() end, desc = "File Explorer", },
		{ "<leader>/", function() require("snacks").picker.grep() end, desc = "Grep", },
		-- find
		{ "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers", },
		{ "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File", },
		{ "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files", },
		{ "<leader>fg", function() require("snacks").picker.git_files() end, desc = "Find Git Files", },
		{ "<leader>fp", function() require("snacks").picker.projects() end, desc = "Projects", },
		{ "<leader>fr", function() require("snacks").picker.recent() end, desc = "Recent", },
		-- git
		{ "<leader>gb", function() require("snacks").picker.git_branches() end, desc = "Git Branches", },
		{ "<leader>gl", function() require("snacks").picker.git_log() end, desc = "Git Log", },
		{ "<leader>gL", function() require("snacks").picker.git_log_line() end, desc = "Git Log Line", },
		{ "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status", },
		{ "<leader>gS", function() require("snacks").picker.git_stash() end, desc = "Git Stash", },
		{ "<leader>gd", function() require("snacks").picker.git_diff() end, desc = "Git Diff (Hunks)", },
		{ "<leader>gf", function() require("snacks").picker.git_log_file() end, desc = "Git Log File", },
		-- LSP
		{ "gd", function() require("snacks").picker.lsp_definitions() end, desc = "Goto Definition", },
		{ "gD", function() require("snacks").picker.lsp_declarations() end, desc = "Goto Declaration", },
		{ "grr", function() require("snacks").picker.lsp_references() end, nowait = true, desc = "References", },
		{ "gI", function() require("snacks").picker.lsp_implementations() end, desc = "Goto Implementation", },
		{ "gy", function() require("snacks").picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition", },
		{ "gai", function() require("snacks").picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming", },
		{ "gao", function() require("snacks").picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing", },
		{ "<leader>ss", function() require("snacks").picker.lsp_symbols() end, desc = "LSP Symbols", },
		{ "<leader>sS", function() require("snacks").picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { '<leader>s"', function() require("snacks").picker.registers() end, desc = "Registers" },
    { '<leader>s/', function() require("snacks").picker.search_history() end, desc = "Search History" },
    { "<leader>sa", function() require("snacks").picker.autocmds() end, desc = "Autocmds" },
    { "<leader>sb", function() require("snacks").picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sc", function() require("snacks").picker.command_history() end, desc = "Command History" },
    { "<leader>sC", function() require("snacks").picker.commands() end, desc = "Commands" },
    { "<leader>sd", function() require("snacks").picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sD", function() require("snacks").picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>sH", function() require("snacks").picker.highlights() end, desc = "Highlights" },
    { "<leader>si", function() require("snacks").picker.icons() end, desc = "Emojis" },
    { "<leader>sj", function() require("snacks").picker.jumps() end, desc = "Jumps" },
    { "<leader>sk", function() require("snacks").picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sl", function() require("snacks").picker.loclist() end, desc = "Location List" },
    { "<leader>sm", function() require("snacks").picker.marks() end, desc = "Marks" },
    { "<leader>sM", function() require("snacks").picker.man() end, desc = "Man Pages" },
    { "<leader>sp", function() require("snacks").picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>sq", function() require("snacks").picker.qflist() end, desc = "Quickfix List" },
    { "<leader>sR", function() require("snacks").picker.resume() end, desc = "Resume" },
    { "<leader>su", function() require("snacks").picker.undo() end, desc = "Undo History" },
    { "<leader>uC", function() require("snacks").picker.colorschemes() end, desc = "Colorschemes" },
	},
	-- stylua: ignore end
	config = function()
		local Snacks = require("snacks")

		Snacks.setup({
			bigfile = { enabled = false },
			dashboard = { enabled = false },
			explorer = { enabled = false },
			indent = { enabled = false },
			input = { enabled = false },
			notifier = { enabled = true },
			quickfile = { enabled = false },
			scope = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = false },
			picker = {
				enabled = true,
				sources = {
					explorer = {
						layout = {
							layout = {
								position = "right",
							},
						},
					},
				},
				win = {
					input = {
						keys = {
							-- Open in vertical split
							["<a-v>"] = { "edit_vsplit", mode = { "i", "n" } },
							-- Open in horizontal split
							["<a-h>"] = { "edit_split", mode = { "i", "n" } },
						},
					},
				},
			},
		})
	end,
}
