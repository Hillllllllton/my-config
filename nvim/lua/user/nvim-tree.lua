local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end


nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  disable_netrw = true,
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    git_ignored = false,
    dotfiles = false,
    custom = {},
    exclude = {},
      },
}

require"nvim-web-devicons".setup {
  color_icons = true;
  default = true;
  strict = true;
}
require'nvim-web-devicons'.get_icons()
