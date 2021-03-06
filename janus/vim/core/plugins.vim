" Variables
let s:no_python_support = "Vim is compiled without python support"
let s:no_ruby_support = "Vim is compiled without ruby support"

" Plugins that requires python support
if has("python3")
  let g:gundo_prefer_python3 = 1
elseif !has("python")
  call janus#disable_plugin("gundo", s:no_python_support)
endif

" Plugins that requires ruby support
if !has("ruby")
  call janus#disable_plugin("ruby", s:no_ruby_support)
endif

" Ack requires ack command
if executable("ack")
  " use default config
elseif executable("ack-grep")
  let g:ackprg="ack-grep -H --nocolor --nogroup --column"
elseif executable("ag")
  let g:ackprg="ag --nocolor --nogroup --column"
else
  call janus#disable_plugin("ack", "The ack program is not installed")
endif

" Gist-vim requires curl
if !executable("curl")
  call janus#disable_plugin("gist", "The curl program is not installed")
endif

" Tagbar requires ctags
if !executable("ctags")
  call janus#disable_plugin("tagbar", "The ctags program is not installed")
endif

" nodejs does not protect itself
" See #336
if exists("*DetectNode")
  call janus#disable_plugin("nodejs", "Nodejs already exists on your system.")
endif
