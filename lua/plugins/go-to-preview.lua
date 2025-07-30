return {
	{
		"rmagatti/goto-preview",
		opts = {},
		keys = {
			{ "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", nowait = true, desc = "Go to Preview" },
			{ "gpi","<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", desc = "Goto Preview Definition" },
			{ "gpc","<cmd>lua require('goto-preview').close_all_win()<cr>", desc = "Close Goto Preview" },
		}
	}
}
