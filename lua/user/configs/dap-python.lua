require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
local dap = require("dap")
-- dap.adapters.python = {
-- 	type = "executable",
-- 	command = "~/.virtualenvs/debugpy/bin/python",
-- 	args = { "-m", "debugpy.adapter" },
-- }
--
table.insert(dap.configurations.python, {
	type = "python",
	request = "launch",
	name = "Django",
	program = vim.fn.getcwd() .. "/manage.py", -- NOTE: Adapt path to manage.py as needed
	args = { "runserver", "--noreload" },
})
