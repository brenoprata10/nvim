return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
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
		}
	}
}
