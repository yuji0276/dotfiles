return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "mini-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {},
  ---@diagnostic enable: missing-fields
  keys ={
    {"<leader>f",function () require("fzf-lua").files() end,},
  },
}
