-- relative line numbers in Normal mode
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.opt.relativenumber = false
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufEnter" }, {
	callback = function()
		vim.opt.relativenumber = true
	end,
})

-- autoformat
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		vim.lsp.buf.format({
			formatting_options = {
				tabSize = 4,
				trimTrailingWhitespace = true,
				insertFinalNewline = true,
			},
		})
	end,
})

-- start nvim-tree on open
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("nvim-tree").open()
	end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
