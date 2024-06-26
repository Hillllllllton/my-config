local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = { "lua", "vim", "json", "javascript", "python", "html", "terraform" },
	sync_install = false,
	ignore_install = { "c" }, --list of language which want to ignore_install

	auto_install = false, --recommended false

	highlight = {
		enable = true,
		disable = { "" },
	},

	autopair = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python", "css" },
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})
require("nvim-treesitter.configs").setup({})
