return {
	{ 
		"nvim-tree/nvim-tree.lua",
		lazy = true,
		keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Open File Navigation" }
		},
		config = function() 
			require("nvim-tree").setup()
		end
	}
}
