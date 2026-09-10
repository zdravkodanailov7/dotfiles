local M = {}
local timer
local pending = false
local stopped = false

local function apply(result)
  -- macOS removes AppleInterfaceStyle in light mode (defaults exits with 1).
  if result.code ~= 0 and result.code ~= 1 then
    return
  end
  local background = result.code == 0 and vim.trim(result.stdout) == "Dark" and "dark" or "light"
  if vim.o.background ~= background then
    vim.o.background = background
  end
end

function M.refresh()
  if pending or stopped then
    return
  end
  pending = true
  vim.system({ "/usr/bin/defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true, timeout = 1000 }, function(result)
    vim.schedule(function()
      pending = false
      if not stopped then
        apply(result)
      end
    end)
  end)
end

function M.setup()
  if vim.fn.has("macunix") == 0 then
    return
  end
  if timer then
    timer:stop()
    timer:close()
    timer = nil
  end
  stopped = false
  -- Set the initial background before loading TokyoNight to avoid a dark flash.
  apply(vim.system({ "/usr/bin/defaults", "read", "-g", "AppleInterfaceStyle" }, { text = true, timeout = 1000 }):wait())

  local group = vim.api.nvim_create_augroup("MacOSAppearance", { clear = true })
  vim.api.nvim_create_autocmd("FocusGained", { group = group, callback = M.refresh })
  -- Read macOS directly: this also works through older tmux versions that do
  -- not forward terminal appearance notifications. No extra plugin is needed.
  if #vim.api.nvim_list_uis() > 0 then
    timer = vim.uv.new_timer()
    timer:start(2000, 2000, vim.schedule_wrap(M.refresh))
  end
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = group,
    callback = function()
      stopped = true
      if timer then
        timer:stop()
        timer:close()
        timer = nil
      end
    end,
  })
end

return M
