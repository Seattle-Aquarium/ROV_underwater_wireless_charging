## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## grab snippets of UWCS camera captures; formulate into figures 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





## start up ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## clear working history
rm(list=ls())


## add libraries
library(tidyverse)
library(magick)


## set working directory one level up and verify 
setwd("../")
getwd()


## relative file paths
medium_tilt <- "imagery/medium_tilt"
high_tilt <- "imagery/high_tilt"
code <- "code"
figs <- "figs"


## invoke source functions from other script 
source(file.path(code, "functions.R"))
## END start up ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





## extract image chunks and formulate into figure ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## medium tilt - cinder block 
cinder_block <- extract_image_chunks(
  image_folder = medium_tilt,
  extraction_set_name = "cinder_block",
  x = 900,
  y = 350,
  width = 300,
  box_col = "red",
  box_lwd = 4,
  draw_axes = TRUE,
  axis_col = "white",
  axis_cex = 3,
  axis_lwd = 1.5,
  axis_tick_by = 100,
  axis_offset_cm = 2
)


## high tilt - anemones 
distant_anemones <- extract_image_chunks(
  image_folder = high_tilt,
  extraction_set_name = "distant_anemones",
  x = 1100,
  y = 450,
  width = 350,
  box_col = "red",
  box_lwd = 4,
  draw_axes = TRUE,
  axis_col = "white",
  axis_cex = 3,
  axis_lwd = 1.5,
  axis_tick_by = 100,
  axis_offset_cm = 2
)


## create cinder block figure  
cinder_block_fig <- stitch_extraction_patches(
  image_folder = medium_tilt,
  extraction_set_name = "cinder_block",
  spacing_px = 10,
  background_col = "black"
)


## create distant anemone fig
cinder_block_fig <- stitch_extraction_patches(
  image_folder = high_tilt,
  extraction_set_name = "distant_anemones",
  spacing_px = 10,
  background_col = "black"
)
## END function invocation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## END of script 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
