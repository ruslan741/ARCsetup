vim.opt.termguicolors = true
return {
	"akinsho/bufferline.nvim",
	requires = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup{
			options = {
				themable = true,
			},
		}
	end,
}
