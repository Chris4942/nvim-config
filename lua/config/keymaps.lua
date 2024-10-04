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

vim.keymap.set("n", "<leader>n", "<cmd>set nu<cr>", { desc = "set numbers on" })
vim.keymap.set("n", "<leader>r", "<cmd>set rnu<cr>", { desc = "set relative numbers on" })
vim.keymap.set("n", "<leader>R", "<cmd>set nornu<cr>", { desc = "set relative numbers off" })

vim.keymap.set("n", "<leader>fy", "<cmd>let @+ = expand('%:.')<cr>", { desc = "copy relative filepath to clipboard" })
vim.keymap.set("n", "<leader>fY", "<cmd>let @+ = expand('%:p')<cr>", { desc = "copy absolute filepath to clipboard" })
vim.keymap.set("n", "<leader>fj", "<cmd>let @+ = expand('%:t')<cr>", { desc = "copy filename to clipboard" })
vim.keymap.set(
  "n",
  "<leader>fu",
  "<cmd>let @+ = expand('%:.') . ':' . line('.')<cr>",
  { desc = "copy file path with line number" }
)
vim.keymap.set("n", "<leader>fl", "<cmd>let @+ = line('.')<cr>", { desc = "copy line number" })

TERMINAL_BUFFER = nil
local switch_to_terminal = function()
  if TERMINAL_BUFFER == nil then
    vim.cmd(":terminal")
    TERMINAL_BUFFER = vim.fn.expand("%")
  else
    xpcall(function()
      vim.cmd("b " .. TERMINAL_BUFFER)
    end, function(err)
      print("error when opening old terminal buffer. Creating new buffer")
      vim.cmd(":terminal")
      TERMINAL_BUFFER = vim.fn.expand("%")
    end)
  end
end

vim.keymap.set("n", "<leader>t", function()
  switch_to_terminal()
  vim.api.nvim_command("startinsert")
end, { desc = "open terminal (insert mode)" })
vim.keymap.set("n", "<leader>T", function()
  switch_to_terminal()
end, { desc = "open terminal (normal mode)" })
