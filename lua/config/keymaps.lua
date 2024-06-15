-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set(
  "n",
  "<leader>ch",
  "<cmd>lua vim.lsp.buf.hover()<cr>",
  { desc = "Hover (or enter hover if already hovering)" }
)

vim.keymap.set("n", "<leader>fy", "<cmd>let @+ = expand('%:p')<cr>", { desc = "copy filepath to clipboard" })

vim.keymap.set("n", "<leader>n", "<cmd>set nu<cr>", { desc = "set numbers on" })
