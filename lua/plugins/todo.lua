local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local todo = require("todo-comments")

todo.setup({
	keywords = {
		fix = {
			icon = "🔥",
			color = "error",
			alt = { "FIX", "FIXME", "fixme", "BUG", "bug", "FIXIT", "fixit", "ISSUE", "issue" },
		},
		todo = { icon = "🐶", color = "info", alt = {"TODO"} },
		hack = { icon = "💩", color = "warning", alt = {"HACK"} },
		warn = { icon = "☠️", color = "warning", alt = { "WARN", "WARNING", "XXX" } },
		perf = { icon = "👍", alt = { "PERF", "OPTIM", "optim", "PERFORMANCE", "performance", "OPTIMIZE", "optimize" } },
		note = { icon = "👀", color = "hint", alt = { "INFO", "info" } },
		test = { icon = "🤓", color = "test", alt = { "TESTING", "testing", "PASSED", "passed", "FAILED", "failed" } },
	},
	gui_style = {
    fg = "NONE", -- The gui style to use for the fg highlight group.
    bg = "BOLD", -- The gui style to use for the bg highlight group.
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true, -- enable multine todo comments
    multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
    warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
    info = { "DiagnosticInfo", "#2563EB" },
    hint = { "DiagnosticHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
    test = { "Identifier", "#FF00FF" }
  },
	search = {
		command = "rg",
		args = {
			"--no-heading",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--trim",
			"--glob=!vendor",
			"--glob=!.git",
			"--glob=!node_modules",
		},
	},
})

keymap("n", "<leader>td", "<cmd>TodoTelescope<CR>", opts)
