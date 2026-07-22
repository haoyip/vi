local function get_vue_plugin_path()
  local handle = io.popen("dirname $(dirname $(readlink -f $(which vue-language-server)))")
  if handle then
    local result = handle:read("*a"):gsub("%s+", "") -- remove newlines
    handle:close()
    return result .. "/lib/language-tools/packages/language-server"
  end
  return nil
end

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = get_vue_plugin_path(),
  languages = { "vue" },
  configNamespace = "typescript",
}

vim.lsp.config["vtsls"] = {
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },

  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
    },
  },
}

vim.lsp.enable("vtsls")
vim.lsp.enable("vue_ls")

vim.lsp.enable("oxlint")
