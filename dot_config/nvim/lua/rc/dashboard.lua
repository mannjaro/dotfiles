  -- local home = os.getenv('HOME')
  local db = require('dashboard')
  -- macos
  -- db.preview_command = 'cat | lolcat -F 0.3'
  -- linux
  -- db.preview_command = 'ueberzug'
  --
  db.custom_header = {

     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
     [[⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀]],
     [[⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀]],
     [[⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀]],
     [[⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀]],
     [[⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀]],
     [[⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀]],
     [[⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀]],
     [[⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀]],
     [[⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀]],
     [[⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀]],
     [[⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀]],
     [[⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀]],
     [[⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀]],
     [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
     }

  db.custom_header = {
[[                 .,-:;//;:=,            ]],
[[         . :H@@@MM@M#H/.,+%;,           ]],
[[      ,/X+ +M@@M@MM%=,-%HMMM@X/,        ]],
[[     -+@MM; $M@@MH+-,;XMMMM@MMMM@+-     ]],
[[    ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.   ]],
[[  ,%MM@@MH ,@%=            .---=-=:=,.  ]],
[[  -@#@@@MX .,              -%HX$$%%%+;  ]],
[[ =-./@M@M$                  .;@MMMM@MM: ]],
[[ X@/ -$MM/                    .+MM@@@M$ ]],
[[,@M@H: :@:                    . -X#@@@@-]],
[[,@@@MMX, .                    /H- ;@M@M=]],
[[.H@@@@M@+,                    %MM+..%#$.]],
[[ /MMMM@MMH/.                  XM@MH; -; ]],
[[  /%+%$XHH@$=              , .H@@@@MX,  ]],
[[   .=--------.           -%H.,@@@@@MX,  ]],
[[   .%MM@@@HHHXX$$$%+- .:$MMX -M@@MM%.   ]],
[[     =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=     ]],
[[       =%@M@M#@$-.=$@MM@@@M; %M%=       ]],
[[         ,:+$+-,/H#MMMMMMM@- -,         ]],
[[               =++%%%%+/:-.             ]],
  }

  -- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
  -- db.preview_file_height = 11
  -- db.preview_file_width = 70

  db.custom_center = {
      -- {icon = '  ',
      -- desc = 'Recently latest session                  ',
      -- shortcut = 'SPC s l',
      -- action ='SessionLoad'},
      -- {icon = '  ',
      -- desc = 'Recently opened files                   ',
      -- action =  'DashboardFindHistory',
      -- shortcut = 'SPC f h'},
      {icon = '  ',
      desc = 'Find  File                              ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f'},
      {icon = '  ',
      desc ='File Browser                            ',
      action =  'Telescope file_browser',
      shortcut = 'SPC f b'},
      {icon = '  ',
      desc = 'Find  word                              ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f g'},
    }
