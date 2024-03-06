local lsp = require "lspconfig"

lsp.tailwindcss.setup({
    settings = {
	    tailwindCSS = {
		    experimental = {
			    classRegex = {
                    "tailwind\\('([^)]*)\\')", "'([^']*)'"
		    	    },
		    },
	    },
    },
})
