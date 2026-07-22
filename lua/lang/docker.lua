vim.lsp.config["dockerls"] = {}
vim.lsp.enable("dockerls")

vim.lsp.config["docker_compose_language_service"] = {}
vim.lsp.enable("docker_compose_language_service")

vim.filetype.add({
  pattern = {
    ["compose%.ya?ml"] = "yaml.docker-compose",
    ["docker%-compose%.ya?ml"] = "yaml.docker-compose",
    ["docker%-compose%.override%.ya?ml"] = "yaml.docker-compose",
  },
})
