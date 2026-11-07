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

-- The lightweight package skips language-specific and tree-sitter/LSP config.
local light_skip = {
  ["plugins.lazydev"] = true,
  ["plugins.treesitter"] = true,
  ["plugins.treesitter-textobjects"] = true,
  ["plugins.ts-autotag"] = true,
}

for _, file in ipairs(files) do
  local module = file:gsub(prefix, ""):gsub("%.lua$", ""):gsub("/", ".")

  local skip = vim.env.NVIM_LIGHT == "1" and (module:match("^lang%.") or light_skip[module])

  if not skip then
    require(module)
  end
end
