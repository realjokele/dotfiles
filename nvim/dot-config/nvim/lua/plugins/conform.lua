vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- You can customize some of the format options for the filetype (:help conform.format)
		rust = { "rustfmt", lsp_format = "fallback" },
		-- Conform will run the first available formatter
		javascript = { "biome", "prettier", stop_after_first = true },
		typescript = { "biome", "prettier", stop_after_first = true },
		javascriptreact = { "biome", "prettier", stop_after_first = true },
		typescriptreact = { "biome", "prettier", stop_after_first = true },
		json = { "biome", "prettier", stop_after_first = true },
		css = { "prettier" },
		html = { "prettier" },
	},
	formatters = {
		-- require_cwd = true - Only run this formatter if it's configured in the project root.
		-- For biome: only run if biome.json or biome.jsonc exists in project.
		-- This prevents formatting with the wrong tool. If your project doesn't use biome, it won't run. Only prettier will run.
		biome = { require_cwd = true },
	},
	default_format_opts = {
		-- lsp_format = "fallback" - Try external formatters first. If none available, use LSP formatting.
		-- This gives you the best of both worlds. External formatters are usually better. But LSP formatting works as backup.
		lsp_format = "fallback",
	},
	format_on_save = function(bufnr)
		local ignore_filetypes = { "sql", "yaml", "yml" }
		if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
			return
		end

		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end

		local bufname = vim.api.nvim_buf_get_name(bufnr)
		if bufname:match("/node_modules/") then
			return
		end

		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
})
