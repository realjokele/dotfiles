vim.pack.add({
	"https://github.com/folke/snacks.nvim",
})

local Snacks = require("snacks")

Snacks.setup({
	animate = { enabled = true },
	bigfile = { enabled = true },
	dashboard = { enabled = false },
	dim = { enabled = true },
	explorer = { enabled = true, replace_netrw = true },
	image = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	layout = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scratch = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	terminal = { enabled = true },
	toggle = { enabled = true },
	words = { enabled = false },
	zen = { enabled = true },
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
	},
})

-- stylua: ignore start
local keymaps = {
  { lhs = "<leader>e", rhs = function() Snacks.explorer() end, desc = "File Explorer" },
  -- find
  { lhs = "<leader>fb", rhs = function() Snacks.picker.buffers() end, desc = "Buffers" },
  { lhs = "<leader>fc", rhs = function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
  { lhs = "<leader>ff", rhs = function() Snacks.picker.files() end, desc = "Find Files" },
  { lhs = "<leader>fg", rhs = function() Snacks.picker.git_files() end, desc = "Find Git Files" },
  { lhs = "<leader>fp", rhs = function() Snacks.picker.projects() end, desc = "Projects" },
  { lhs = "<leader>fr", rhs = function() Snacks.picker.recent() end, desc = "Recent" },
-- git
  { lhs = "<leader>gb", rhs = function() Snacks.picker.git_branches() end, desc = "Git Branches" },
  { lhs = "<leader>gl", rhs = function() Snacks.picker.git_log() end, desc = "Git Log" },
  { lhs = "<leader>gL", rhs = function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
  { lhs = "<leader>gs", rhs = function() Snacks.picker.git_status() end, desc = "Git Status" },
  { lhs = "<leader>gS", rhs = function() Snacks.picker.git_stash() end, desc = "Git Stash" },
  { lhs = "<leader>gp", rhs = function() Snacks.picker.git_diff() end, desc = "Git Diff Picker (Hunks)" },
  { lhs = "<leader>gP", rhs = function() Snacks.picker.git_diff({ base = "origin" }) end, desc = "Git Diff Picker(origin)" },
  { lhs = "<leader>gf", rhs = function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
  { lhs = "<leader>sb", rhs = function() Snacks.picker.lines() end, desc = "Buffer Lines" },
  { lhs = "<leader>sB", rhs = function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
  { lhs = "<leader>sg", rhs = function() Snacks.picker.grep() end, desc = "Grep" },
  { lhs = "<leader>sw", rhs = function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
   -- search
  { lhs = '<leader>s"', rhs = function() Snacks.picker.registers() end, desc = "Registers" },
  { lhs = '<leader>s/', rhs = function() Snacks.picker.search_history() end, desc = "Search History" },
  { lhs = "<leader>sa", rhs = function() Snacks.picker.autocmds() end, desc = "Autocmds" },
  { lhs = "<leader>sb", rhs = function() Snacks.picker.lines() end, desc = "Buffer Lines" },
  { lhs = "<leader>sc", rhs = function() Snacks.picker.command_history() end, desc = "Command History" },
  { lhs = "<leader>sC", rhs = function() Snacks.picker.commands() end, desc = "Commands" },
  { lhs = "<leader>sd", rhs = function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
  { lhs = "<leader>sD", rhs = function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
  { lhs = "<leader>sH", rhs = function() Snacks.picker.highlights() end, desc = "Highlights" },
  { lhs = "<leader>si", rhs = function() Snacks.picker.icons() end, desc = "Icons" },
  { lhs = "<leader>sj", rhs = function() Snacks.picker.jumps() end, desc = "Jumps" },
  { lhs = "<leader>sk", rhs = function() Snacks.picker.keymaps() end, desc = "Keymaps" },
  { lhs = "<leader>sl", rhs = function() Snacks.picker.loclist() end, desc = "Location List" },
  { lhs = "<leader>sm", rhs = function() Snacks.picker.marks() end, desc = "Marks" },
  { lhs = "<leader>sM", rhs = function() Snacks.picker.man() end, desc = "Man Pages" },
  { lhs = "<leader>sp", rhs = function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
  { lhs = "<leader>sq", rhs = function() Snacks.picker.qflist() end, desc = "Quickfix List" },
  { lhs = "<leader>sR", rhs = function() Snacks.picker.resume() end, desc = "Resume" },
  { lhs = "<leader>su", rhs = function() Snacks.picker.undo() end, desc = "Undo History" },
  -- LSP
  { lhs = "gd", rhs = function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
  { lhs = "gD", rhs = function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
  { lhs = "gr", rhs = function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
  { lhs = "gI", rhs = function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
  { lhs = "gy", rhs = function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
  { lhs = "<leader>ss", rhs = function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
  { lhs = "<leader>sS", rhs = function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  { lhs = "gai", rhs = function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming", has = "callHierarchy/incomingCalls" },
  { lhs = "gao", rhs = function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing", has = "callHierarchy/outgoingCalls" },
  -- buffers
  { lhs = "<leader>bd", rhs = function() Snacks.bufdelete() end, desc = "Delete buffer", mode = { "n" }, },
  { lhs = "<leader>bo", rhs = function() Snacks.bufdelete.other() end, desc = "Delete other buffers", mode = { "n" }, },
}
-- stylua: ignore end

for _, map in ipairs(keymaps) do
	local opts = { desc = map.desc }

	if map.silent ~= nil then
		opts.silent = map.silent
	end

	opts.noremap = map.noremap ~= nil and map.noremap or true

	if map.expr ~= nil then
		opts.expr = map.expr
	end

	local mode = map.mode or "n"

	vim.keymap.set(mode, map.lhs, map.rhs, opts)
end
