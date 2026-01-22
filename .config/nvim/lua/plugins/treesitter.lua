return {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    main = "nvim-treesitter.config", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
        ensure_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"query",
			"vim",
			"vimdoc",
			"rust",
			'regex',
			"php",
			"blade",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"jsx",
        },
        auto_install = true,
        highlight = {
            enable = true,
			additional_vim_regex_highlighting = false,
        },
        indent = { enable = true, disable = { "ruby" } },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<M-space>", -- set to `false` to disable one of the mappings
                node_incremental = "<M-space>",
                scope_incremental = false,
                node_decremental = "<Backspace>",
            },
        },
    },
}
