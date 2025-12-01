return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    require("dap-go").setup()

    -- Python (unchanged)
    dap.adapters.python = {
      type = "executable",
      command = "python3",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        justMyCode = false,
        stopOnEntry = true,
        pythonPath = function()
          local venv = os.getenv("VIRTUAL_ENV")
          return venv and (venv .. "/bin/python") or "python3"
        end,
      },
    }

    -- Unity / C# – fully universal
    local home = vim.fn.expand("~")
    dap.adapters.coreclr = {
      type = "executable",
      command = home .. "/tools/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Attach to Unity Mono Player (any build)",
        request = "launch",
        program = function()
          return vim.fn.input("Path to Assembly-CSharp.dll → ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = function()
          local path = dap.configurations.cs[1].program()
          return vim.fn.fnamemodify(path, ":p:h:h") -- jumps to the build root folder
        end,
        stopOnEntry = true,
      },
    }

    -- Keymaps
    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Start/Continue debugging" })
    vim.keymap.set("n", "<Leader>dq", dap.terminate, { desc = "Terminate" })
    vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<Leader>dr", dap.run_last, { desc = "Run last" })
  end,
}
