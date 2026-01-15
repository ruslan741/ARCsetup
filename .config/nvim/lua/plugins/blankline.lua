return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup({
			indent = { char = "│" },
			whitespace = { highlight = "Whitespace", remove_blankline_trail = false },
		})
	end,
}
