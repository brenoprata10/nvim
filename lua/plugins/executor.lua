return {
	{
		"google/executor.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			use_split = false,
			notifications = {
				task_started = true,
				task_completed = true,
				border = {
					padding = {
						top = 0,
						bottom = 1,
						left = 1,
						right = 1,
					},
					style = "rounded",
				},
			},
			preset_commands = {
				-- Use ExecutorShowPresets to show presets per directory
				["faceit-new-frontend"] = {
					"",
				},
			}
		},
		keys = {
			{"mt", "<cmd>ExecutorToggleDetail<cr>"},
			{"mr", "<cmd>ExecutorRun<cr>"},
			{"ms", "<cmd>ExecutorSetCommand<cr>"},
		},
		config = function()
			require('executor').statusline()
		end
	}
}
