return {
	{
		"tjdevries/present.nvim",
		ft = "markdown",
		config = function()
			local present = require("present")

			-- Run a code block by writing its body to a temp file and piping it
			-- through an interpreter. Used for the "Embedding Ruby in Zig" deck so
			-- pressing `X` shells out to `zig build run-*`.
			local function make_shell_executor(interp)
				return function(block)
					local tmp = vim.fn.tempname()
					local f = assert(io.open(tmp, "w"))
					f:write(block.body)
					f:close()
					local out = vim.fn.systemlist({ interp, tmp })
					if vim.v.shell_error ~= 0 then
						table.insert(out, 1, ("[exit %d]"):format(vim.v.shell_error))
					end
					return out
				end
			end

			present.setup({
				-- pass syntax explicitly: present.nvim's setup drops the
				-- defaults when given partial opts, and start_presentation
				-- then indexes options.syntax.
				syntax = {
					comment = "%%",
					stop = "<!%-%-%s*stop%s*%-%->",
				},
				executors = {
					bash = make_shell_executor("bash"),
					sh = make_shell_executor("bash"),
					ruby = make_shell_executor("ruby"),
				},
			})

			vim.api.nvim_create_user_command("Present", function()
				require("present").start_presentation({ bufnr = 0 })
			end, { desc = "Start present.nvim for the current buffer" })
		end,
	},
}
