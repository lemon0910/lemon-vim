if exists('b:did_go_ftplugin')
  finish
endif
let b:did_go_ftplugin = 1

nmap <buffer> gd :GoDef<CR>
nmap <buffer> gb :GoBuild<CR>
nmap <buffer> gr :GoRun<CR>
