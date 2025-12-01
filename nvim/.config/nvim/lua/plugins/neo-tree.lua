
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        position = "left",
        width = 30,
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
        },
      },
    })

    -- Toggle Neo-tree
    vim.keymap.set("n", "<C-n>", "<Cmd>Neotree toggle<CR>", { desc = "Toggle file explorer" })

    -- Quick navigation: switch between Neo-tree and main buffer
    vim.keymap.set("n", "<leader>e", "<Cmd>Neotree focus<CR>", { desc = "Focus file explorer" })
  end
}  
