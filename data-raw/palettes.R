# Source of truth for all palettes in this package.
#
# Add a new palette by adding a new named element below -- palettes can
# have any number of colors, and don't need to match each other in length.
# After editing this file, rebuild the package data by running:
#
#   source("data-raw/palettes.R")

palettes <- list(
  sunset  = c("#F4A261", "#E76F51", "#2A9D8F", "#264653"),
  
  ocean   = c("#003049", "#548C92", "#B4D7D8", "#E0D7CF",
              "#AB9072", "#D62828", "#F77F00", "#FCBF49"),
  
  ocean2 = c("#FFBA08", "#A8C6D8", "#DC83A8", "#73BC93", "#505157"),
  
  forest  = c("#1B4332", "#2D6A4F", "#40916C", "#95D5B2", "#B7E4C7"),
  
  autumnForest = c("#EB781B", "#CC5221", "#71250E", "#6F6534", "#365365","#1B4332"),
  
  mono    = c("#03071E", "#6A040F", "#D00000", "#FFBA08"),
  
  umapColors = c("#A9C3BB","#DF9795","#EFD8A8","#FCBF30","#F4A261", "#E76F51",
                 "#D63F48","#5C0017","#2A9D8F","#95D5B2","#40916C", "#264653",
                 "#1B4332","#664040","#5C5468","#03074E"),
  
  umapColors2 = c("#4A5568", "#D9B8B0", "#C7C2D4", "#E8DCC8","#E27862", "#F0B08C",
                 "#A8C0A0", "#C7D4DC","#8FB8B0", "#A8C4CC", "#B8C8D4","#E8C860",
                 "#D98A82", "#E8A078", "#E8A8B0", "#B08CA0","#D98A8C", "#E8967C",
                 "#E8A0A8", "#9098C8","#38445C", "#C0B0D8","#4A6048","#2C3824",
                 "#7CC8A8", "#7C90E0", "#B090E0", "#F0A8C0","#283860","#3C9088"),
  
  salt_box_romance = c("#6D6875","#B5838D","#E5989B","#FFB4A2","#FFCDB2"),
  
  
  sandPastel = c("#5B5D76", "#879599", "#C197A1", "#DBCDB7"),
  
  mudColors = c("#E37C78", "#FFD4D1", "#FAEFED", "#82BAC4", "#006078"),
  
  springFloral = c("#65004e", "#aa217d", "#d487b5", "#e6cab5", "#ffd4dd",
                   "#F2F7F6", "#F2E7E6", "#F388A2", "#7F805C", "#F2DDB3")
  )

usethis::use_data(palettes, internal = TRUE, overwrite = TRUE)
