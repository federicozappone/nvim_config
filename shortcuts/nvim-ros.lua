
-- integrazione con ROS 
-- Search files in current package
vim.api.nvim_set_keymap("n", "<leader>rfp", "<cmd>lua require('ros-nvim.telescope.package').search_package()<cr>", {noremap = true})

-- Live grep in current package
vim.api.nvim_set_keymap("n", "<leader>rgp", "<cmd>lua require('ros-nvim.telescope.package').grep_package()<cr>", {noremap = true})

-- #### ROS Introspection ####
-- Topics list & info
vim.api.nvim_set_keymap("n", "<leader>rtl", "<cmd>lua require('ros-nvim.telescope.pickers').topic_picker()<cr>", {noremap = true})
-- Nodes list & info
vim.api.nvim_set_keymap("n", "<leader>rnl", "<cmd>lua require('ros-nvim.telescope.pickers').node_picker()<cr>", {noremap = true})

-- Services list & info
vim.api.nvim_set_keymap("n","<leader>rsl", "<cmd>lua require('ros-nvim.telescope.pickers').service_picker()<cr>", {noremap = true})

-- Service definitions list "& info
vim.api.nvim_set_keymap("n", "<leader>rds", "<cmd>lua require('ros-nvim.telescope.pickers').srv_picker()<cr>", {noremap = true})
-- Message definitions list "& info
vim.api.nvim_set_keymap("n", "<leader>rml", "<cmd>lua require('ros-nvim.telescope.pickers').msg_picker()<cr>", {noremap = true})
-- Params list & values
vim.api.nvim_set_keymap("n", "<leader>rpl", "<cmd>lua require('ros-nvim.telescope.pickers').param_picker()<cr>", {noremap = true})
-- Build entire workspace
vim.api.nvim_set_keymap("n", "<leader>rcm", "<cmd>lua require('ros-nvim.build').catkin_make()<cr)>", {noremap = true})
-- Build current package
vim.api.nvim_set_keymap("n", "<leader>rmp", "<cmd>lua require('ros-nvim.build').catkin_make_pkg()<cr>", {noremap = true})

