if exists('b:did_sh_ftplugin')
  finish
endif
let b:did_sh_ftplugin = 1

autocmd BufNewFile *.sh exec ":call AutoSetFileHead()"
