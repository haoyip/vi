map = function(mode, key, binding, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, key, binding, options)
end

local lua_path = os.getenv("CONFIG_ROOT") .. "/lua"
local prefix = vim.pesc(lua_path .. "/")

local files = vim.fn.glob(lua_path .. "/**/*.lua", false, true)

for _, file in ipairs(files) do
  local module = file:gsub(prefix, ""):gsub("%.lua$", ""):gsub("/", ".")

  require(module)
end
