local M = {}

local state_path = require("configs.ghostty_sync").state_path
local handle = nil
local debounce = vim.uv.new_timer()

local function current_theme()
  return require("nvconfig").base46.theme
end

local function apply_theme(name)
  -- Update chadrc in memory
  require("nvconfig").base46.theme = name

  -- Rewrite chadrc.lua on disk so it persists
  local chadrc_path = vim.fn.stdpath("config") .. "/lua/chadrc.lua"
  local f = io.open(chadrc_path, "r")
  if f then
    local content = f:read("*a")
    f:close()
    if content:match('theme%s*=%s*"[^"]+"') then
      local updated = content:gsub('theme%s*=%s*"[^"]+"', 'theme = "' .. name .. '"')
      local wf = io.open(chadrc_path, "w")
      if wf then
        wf:write(updated)
        wf:close()
      end
    end
  end

  -- Invalidate cached modules so base46 picks up the new theme
  for key, _ in pairs(package.loaded) do
    if key:match("^base46") or key == "chadrc" or key == "nvconfig" then
      package.loaded[key] = nil
    end
  end

  -- Regenerate highlight cache and reload
  require("base46").load_all_highlights()
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")
end

function M.start()
  -- Seed the state file on first startup if it doesn't exist
  local f = io.open(state_path, "r")
  if not f then
    local sf = io.open(state_path, "w")
    if sf then
      sf:write(current_theme())
      sf:close()
    end
  else
    f:close()
  end

  handle = vim.uv.new_fs_event()
  if not handle then
    return
  end

  handle:start(state_path, {}, function(err)
    if err then
      return
    end
    debounce:stop()
    debounce:start(100, 0, vim.schedule_wrap(function()
      local sf = io.open(state_path, "r")
      if not sf then
        return
      end
      local new_theme = sf:read("*a"):gsub("%s+", "")
      sf:close()

      if new_theme ~= "" and new_theme ~= current_theme() then
        apply_theme(new_theme)
      end
    end))
  end)
end

function M.stop()
  if handle then
    handle:stop()
    handle:close()
    handle = nil
  end
end

return M
