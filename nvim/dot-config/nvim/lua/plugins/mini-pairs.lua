vim.pack.add({ "https://github.com/nvim-mini/mini.pairs" })

-- Define the pairs you want
local my_pairs = {
	["("] = "()",
	["["] = "[]",
	["{"] = "{}",
	['"'] = '""',
	["'"] = "''",
	["`"] = "``",
}

local mappings = {}

for key, pair in pairs(my_pairs) do
	-- Use 'closeopen' for quotes/backticks, 'open' for brackets
	local action = (key == pair:sub(1, 1)) and "open" or "closeopen"
	-- Note: Symmetrical pairs like " use 'closeopen'
	if key == '"' or key == "'" or key == "`" then
		action = "closeopen"
	else
		action = "open"
	end

	mappings[key] = {
		action = action,
		pair = pair,
		neigh_pattern = ".[%s%)]",
	}
end

require("mini.pairs").setup({
	mappings = mappings,
})
