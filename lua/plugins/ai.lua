return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			-- add any opts here
			-- for example
			provider = "ollama",
			mappings = {
				ask = "<leader>m", -- ask
				edit = "<leader>n", -- edit
			},
			ollama = {
				model = "qwen2.5-coder:3b",
				--model = "stable-code:3b",
				--model = "codellama:7b",
				endpoint = "http://localhost:11434"
			},
			behaviour = {
				enable_cursor_planning_mode = true,
				enable_token_counting = false
			},
			hints = { enabled = false }
		},
		keys = {
			{"<leader>o", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante"}
		},
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"echasnovski/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		},
	},
	{
		"github/copilot.vim",
		event = "VeryLazy",
		config = function()
			vim.g.copilot_no_tab_map = true -- Disable default Tab mapping
			vim.g.copilot_assume_mapped = true -- Assume mappings are handled
			vim.api.nvim_set_keymap("i", "<C-\\>", 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
			vim.api.nvim_set_keymap("i", "<C-]>", "<Plug>(copilot-next)", { silent = true })
			vim.api.nvim_set_keymap("i", "<C-[>", "<Plug>(copilot-previous)", { silent = true })
			--vim.api.nvim_set_keymap("i", "<C-\\>", "<Plug>(copilot-dismiss)", { silent = true })
			-- Restore <Esc> explicitly
			vim.api.nvim_set_keymap("i", "<Esc>", "<Esc>", { noremap = true, silent = true })
		end,
	}
}
