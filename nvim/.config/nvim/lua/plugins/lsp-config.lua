return {
  { "williamboman/mason.nvim", config = true },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = { ensure_installed = { "lua_ls", "ts_ls", "html", "cssls" } },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Lua
      vim.lsp.config.lua_ls = {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      }
      vim.lsp.enable("lua_ls")

      -- TypeScript / JavaScript
      vim.lsp.config.ts_ls = { capabilities = capabilities }
      vim.lsp.enable("ts_ls")

      -- HTML
      vim.lsp.config.html = { capabilities = capabilities }
      vim.lsp.enable("html")

      -- CSS
      vim.lsp.config.cssls = { capabilities = capabilities }
      vim.lsp.enable("cssls")

      -- Tailwind CSS
      vim.lsp.config.tailwindcss = { capabilities = capabilities }
      vim.lsp.enable("tailwindcss")

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local function bufmap(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
          end

          bufmap("n", "K", vim.lsp.buf.hover, "LSP hover")
          bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
          bufmap("n", "gr", vim.lsp.buf.references, "List references")
          bufmap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
          bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        end,
      })
    end,
  },
}
