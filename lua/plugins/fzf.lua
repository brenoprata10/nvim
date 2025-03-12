return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		opts = {
			previewers = {
				builtin = {
					extensions = {
						["png"] = { "viu", "-b" },
						["jpg"] = { "viu", "-b" },
						["gif"] = { "viu", "-b" },
						["jpeg"] = { "viu", "-b" },
						["svg"] = { "viu", "-b" },
					}      
				}
			},
			grep = {
				cmd = "rg --vimgrep -g '!{.git,node_modules,package-lock.json}'",
			}
		},
		keys = {
			{ "<C-h>", "<cmd>FzfLua oldfiles path_shorten=10<cr>", desc = "Show History" },
			{ "<C-r>", "<cmd>FzfLua files path_shorten=16<cr>", desc = "File Search" },
			{ "gc", "<cmd>FzfLua git_commits<cr>", desc = "Git Commits" },
			{ "gr", "<cmd>FzfLua lsp_references<cr>", desc = "LSP References" },
			{ "gy", "<cmd>FzfLua lsp_definitions<cr>", desc = "LSP Definitions" },
			{ "gl", "<cmd>FzfLua live_grep<cr>", desc = "Find by Text" },
			--{ "gr", {"<cmd>FzfLua grep_visual<cr>", mode = "x"}, desc = "Grep Visual" },
		},
	}
}
