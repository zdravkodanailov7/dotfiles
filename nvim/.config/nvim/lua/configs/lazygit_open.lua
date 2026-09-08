local M = {}

local state_path = vim.fn.stdpath "cache" .. "/lazygit-open-file"

local function is_lazygit_buffer(buf)
  return vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].filetype == "lazygit"
end

local function find_target_window()
  local current = vim.api.nvim_get_current_win()

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if win ~= current and vim.api.nvim_win_is_valid(win) then
      local buf = vim.api.nvim_win_get_buf(win)
      local config = vim.api.nvim_win_get_config(win)

      if config.relative == "" and not is_lazygit_buffer(buf) then
        return win
      end
    end
  end
end

function M.open_from_state()
  local lines = vim.fn.readfile(state_path)
  local selected = lines[1]

  if not selected or selected == "" then
    return false
  end

  local root = lines[2]
  local path = selected

  if root and root ~= "" and not path:match "^/" then
    path = root .. "/" .. path
  end

  local target = find_target_window()
  local lazygit_buffers = {}

  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)

    if is_lazygit_buffer(buf) then
      table.insert(lazygit_buffers, buf)
      pcall(vim.api.nvim_win_close, win, true)
    end
  end

  for _, buf in ipairs(lazygit_buffers) do
    if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
      pcall(vim.api.nvim_buf_delete, buf, { force = true })
    end
  end

  if target and vim.api.nvim_win_is_valid(target) then
    vim.api.nvim_set_current_win(target)
  end

  vim.cmd.edit(vim.fn.fnameescape(vim.fn.fnamemodify(path, ":p")))
  return true
end

return M
