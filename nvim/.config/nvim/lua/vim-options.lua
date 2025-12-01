
-- Core editing options
local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Leaders (set before mappings are defined)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard: use system clipboard by default (yank/delete go to clipboard)
opt.clipboard = "unnamedplus"

-- Paste mode toggle (useful when pasting from terminal)
vim.keymap.set("n", "<leader>p", function()
  opt.paste = not opt.paste
  vim.notify("Paste mode: " .. (opt.paste and "ON" or "OFF"))
end, { desc = "Toggle paste mode" })

-- Window navigation (easier than C-w)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Tab navigation
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab", silent = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs", silent = true })
