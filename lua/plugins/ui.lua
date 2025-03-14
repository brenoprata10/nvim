return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true,
			animate = {
				enabled = vim.fn.has("nvim-0.10") == 1,
				style = "out",
				easing = "linear",
				duration = {
					step = 20, -- ms per step
					total = 100, -- maximum duration
				},
			} },
			input = { enabled = true },
			picker = {
				enabled = true,
				win = {
					input = {
						keys = {
							["<Esc>"] = { "close", mode = { "n", "i" } },
						}
					},
				},
				sources = {
					explorer = {
						win = {
							list = {
								keys = {
									["<c-t>"] = "tab",
								},
							},
						},
					},
				}
			},
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			-- File Explorer
			{ "<C-n>", "<cmd>lua Snacks.explorer()<cr>", desc = "Open File Navigation" },

			-- Search
			{ "<C-r>", "<cmd>lua Snacks.picker.files()<cr>", desc = "File Search" },
			{ "<C-h>", "<cmd>lua Snacks.picker.recent()<cr>", desc = "Show History" },
			{ "gl", "<cmd>lua Snacks.picker.grep()<cr>", desc = "Find by Text" },

			-- LSP Search
			{ "gr", "<cmd>lua Snacks.picker.lsp_references()<cr>", nowait = true, desc = "References" },
			{ "gy","<cmd>lua Snacks.picker.lsp_type_definitions()<cr>", desc = "Goto T[y]pe Definition" },

			-- Undo Tree
			{ "<C-u>", "<cmd>lua Snacks.picker.undo()<cr>", desc = "Open undo tree" },

			-- Diagnostics
			{ "tt","<cmd>lua Snacks.picker.diagnostics()<cr>", desc = "Diagnostics" },

			-- Note taking
			{ "<leader>n", "<cmd>lua Snacks.scratch()<cr>", desc = "Toggle Scratch Buffer" },
			{ "<leader>N", "<cmd>lua Snacks.scratch.select()<cr>", desc = "Select Scratch Buffer" },
		},
	}
}
