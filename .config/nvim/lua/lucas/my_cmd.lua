
1. capture selection -> var start_sel, end_sel # vim.fn.getpos("'<"), vim.fn.getpos("'>") 
2. create a scratch buffer  # nvim_create_buf, buf_open_scratch
3. let write text # vim.api.nvim_buf_set_lines() 
4. delete text in between start_sel and end_sel #    vim.api.nvim_buf_set_lines() 
5. paste text from scratch buffer to start_sel # vim.api.nvim_buf_set_lines() 
6. close scratch buffer


