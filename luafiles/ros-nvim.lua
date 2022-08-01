require 'ros-nvim'.setup {
  -- path to your catkin workspace
  catkin_ws_path = '~/catkin_ws',
  -- terminal height for build / test
  terminal_height = 8
}

local ros_ft = vim.api.nvim_create_augroup("launch_ros", {clear = true})
vim.api.nvim_create_autocmd("BufEnter", {pattern = "*.launch", command = "set ft=xml", group = ros_ft })
vim.api.nvim_create_autocmd("BufEnter", {pattern = "*.rosinstall", command = "set ft=yaml", group = ros_ft })

