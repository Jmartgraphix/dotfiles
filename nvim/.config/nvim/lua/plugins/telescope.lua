return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })

      -- Custom Telescope keymaps (work around terminal intercepting C-v, C-s, and C-z)
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              -- Open in vertical split (alternative to C-v which terminals intercept)
              ["<C-x>"] = require("telescope.actions").select_vertical,
              -- Open in horizontal split (alternative to C-s/C-z which terminals intercept)
              ["<C-o>"] = require("telescope.actions").select_horizontal,
              -- Open in new tab (C-t works, but keeping it explicit)
              ["<C-t>"] = require("telescope.actions").select_tab,
            },
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
