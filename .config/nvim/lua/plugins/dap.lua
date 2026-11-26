return {
  {
    "mfussenegger/nvim-dap",
    dependencies = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.adapters.gdb = { type = "executable", command = "gdb", args = { "-i", "dap" } }

      dap.configurations.c = {
        {
          name = "Launch C program (GDB)",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Executable path: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = true,
          args = {},
        },
      }

      dap.listeners.after.eventinitialized["dapuiconfig"] = function()
        dapui.open()
      end

      dap.listeners.before.eventterminated["dapuiconfig"] = function()
        dapui.close()
      end

      dap.listeners.before.eventexited["dapuiconfig"] = function()
        dapui.close()
      end
    end,
  },
}
