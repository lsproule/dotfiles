vim.cmd [[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]]
vim.cmd [[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]]
vim.cmd [[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]]
vim.cmd [[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]]
vim.cmd [[let g:terraform_fmt_on_save=1]]
vim.cmd [[let g:terraform_align=1]]
vim.keymap.set("n", "<leader>ti", ":!terraform init<CR>")
vim.keymap.set("n", "<leader>tp", ":!terraform plan<CR>")
vim.keymap.set("n", "<leader>taa", ":!terraform apply -auto-approve<CR>")
require("lucas.masonlsp")
require("lucas.norg")


