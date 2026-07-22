vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
})

local opts = {
  move = {
    enable = true,
    set_jumps = true,
    keys = {
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]a"] = "@parameter.inner",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]C"] = "@class.outer",
        ["]A"] = "@parameter.inner",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[a"] = "@parameter.inner",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[C"] = "@class.outer",
        ["[A"] = "@parameter.inner",
      },
    },
  },
}

local TS = require("nvim-treesitter-textobjects")
TS.setup(opts)

local function attach(buf)
  if not opts.move.enable then
    return
  end

  local ok = pcall(vim.treesitter.query.get, vim.bo[buf].filetype, "textobjects")
  if not ok then
    return
  end

  for method, keymaps in pairs(opts.move.keys) do
    for key, query in pairs(keymaps) do
      local queries = type(query) == "table" and query or { query }
      local parts = {}

      for _, q in ipairs(queries) do
        local part = q:gsub("@", ""):gsub("%..*", "")
        part = part:sub(1, 1):upper() .. part:sub(2)
        table.insert(parts, part)
      end

      local desc = table.concat(parts, " or ")
      desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc .. (key:sub(2, 2):match("%u") and " End" or " Start")

      map({ "n", "x", "o" }, key, function()
        if vim.wo.diff and key:find("[cC]") then
          return vim.cmd.normal({ key, bang = true })
        end

        require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
      end, {
        buffer = buf,
        silent = true,
        desc = desc,
      })
    end
  end
end

local group = vim.api.nvim_create_augroup("treesitter_textobjects", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  callback = function(ev)
    attach(ev.buf)
  end,
})

for _, buf in ipairs(vim.api.nvim_list_bufs()) do
  attach(buf)
end
