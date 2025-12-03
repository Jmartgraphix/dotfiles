return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
    }
    
    -- Try to add eslint_d from none-ls-extras if available
    local ok, none_ls_extras = pcall(require, "none-ls-extras")
    if ok and none_ls_extras and none_ls_extras.diagnostics then
      table.insert(sources, none_ls_extras.diagnostics.eslint_d)
    end
    
    null_ls.setup({
      sources = sources,
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format" })
  end,
}
