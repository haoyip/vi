-- Find the project root directory name (e.g., "neovim" from "/path/to/neovim")
local function GetProjectName()
  local markers = { ".git", "flake.nix" }
  local dir = vim.fn.expand("%:p:h") -- Current file's directory

  -- Search upwards for a project marker
  for _, marker in ipairs(markers) do
    local found = vim.fn.findfile(marker, dir .. ";")
    if found ~= "" then
      -- Extract the parent directory name (project root folder name)
      local project_root = vim.fn.fnamemodify(found, ":p:h")
      return vim.fn.fnamemodify(project_root, ":t") -- :t = tail (last component)
    end
  end

  return nil -- No project root found
end

-- Format the title as "filename [project]"
function FormatTitle()
  local filename = vim.fn.expand("%:t") -- Current filename
  local project = GetProjectName()

  if project then
    return string.format("%s [%s]", filename, project)
  else
    return filename -- Fallback: just the filename
  end
end

-- Dynamic Title
vim.opt.title = true
vim.opt.titlestring = "%{%v:lua.FormatTitle()%}"
