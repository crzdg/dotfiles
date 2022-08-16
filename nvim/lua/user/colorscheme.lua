vim.cmd [[
try
  let g:gruvbox_baby_background_color = "dark"
  let g:gruvbox_baby_transparent_mode = 1
  let g:gruvbox_baby_telescope_theme = 1
  let g:gruvbox_baby_function_style = "bold"
  let g:gruvbox_baby_keyword_style = "NONE"
  let g:gruvbox_baby_highlights = {"Search" :{ "bg" :"#DEDEDE", "fg" :"#242424" }}
  colo gruvbox-baby
catch /^vim\%((\a\+)\)\=:e185/
  colorscheme default
  set background=dark
endtry
]]
