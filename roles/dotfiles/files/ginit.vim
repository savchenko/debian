if has('nvim')
  GuiFont! Consolas:h11
  GuiPopupmenu 0
  GuiLinespace 0.5
endif

if has("gui_running")
  set guioptions -=m
  set guioptions -=T
endif
