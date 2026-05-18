## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## functions to work with images from the UWCS camera 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







## function: draw extraction box and pixel axes ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
draw_extraction_box <- function(
    img,
    x,
    y,
    width,
    height = width,
    box_col = "red",
    box_lwd = 4,
    draw_axes = TRUE,
    axis_col = "white",
    axis_cex = 0.55,
    axis_lwd = 1,
    axis_tick_by = 50,
    axis_offset_cm = 1,
    axis_dpi = 96
) {
  
  ## image info
  info <- magick::image_info(img)
  img_width  <- info$width[1]
  img_height <- info$height[1]
  
  ## checks
  if (x < 0 || y < 0) {
    stop("x and y must be >= 0.")
  }
  
  if (width <= 0 || height <= 0) {
    stop("width and height must be > 0.")
  }
  
  if ((x + width) > img_width || (y + height) > img_height) {
    stop(
      "Crop region extends beyond the image boundary.\n",
      "Image size: ", img_width, " x ", img_height, "\n",
      "Requested crop: x = ", x, ", y = ", y,
      ", width = ", width, ", height = ", height
    )
  }
  
  ## crop coordinates use upper-left origin:
  ## x = pixels from left
  ## y = pixels from top
  ##
  ## base R plotting uses lower-left origin, so convert y coordinates
  xleft   <- x
  xright  <- x + width
  ybottom <- img_height - (y + height)
  ytop    <- img_height - y
  
  ## approximate centimeter offset in pixels
  ## 1 inch = 2.54 cm
  ## axis_dpi = assumed pixels per inch
  axis_offset_px <- round((axis_offset_cm / 2.54) * axis_dpi)
  
  ## avoid tiny offsets
  axis_offset_px <- max(axis_offset_px, 20)
  
  ## make transparent overlay
  overlay <- magick::image_graph(
    width = img_width,
    height = img_height,
    bg = "transparent"
  )
  
  par(mar = c(0, 0, 0, 0), xaxs = "i", yaxs = "i")
  
  plot.new()
  
  plot.window(
    xlim = c(0, img_width),
    ylim = c(0, img_height),
    xaxs = "i",
    yaxs = "i"
  )
  
  ## draw red extraction box
  rect(
    xleft = xleft,
    ybottom = ybottom,
    xright = xright,
    ytop = ytop,
    border = box_col,
    lwd = box_lwd,
    col = NA
  )
  
  ## optionally draw pixel-coordinate axes
  if (draw_axes) {
    
    ## x-axis: offset above bottom of image
    segments(
      x0 = 0,
      y0 = axis_offset_px,
      x1 = img_width,
      y1 = axis_offset_px,
      col = axis_col,
      lwd = axis_lwd
    )
    
    ## y-axis: offset right of left image edge
    segments(
      x0 = axis_offset_px,
      y0 = 0,
      x1 = axis_offset_px,
      y1 = img_height,
      col = axis_col,
      lwd = axis_lwd
    )
    
    ## x-axis ticks and labels
    ## labels represent image x-coordinate in pixels
    x_ticks <- seq(0, img_width, by = axis_tick_by)
    
    for (xt in x_ticks) {
      
      segments(
        x0 = xt,
        y0 = axis_offset_px - 7,
        x1 = xt,
        y1 = axis_offset_px + 7,
        col = axis_col,
        lwd = axis_lwd
      )
      
      ## prevent labels at the extreme edges from being clipped
      label_x <- min(max(xt, 18), img_width - 18)
      
      text(
        x = label_x,
        y = axis_offset_px - 14,
        labels = xt,
        col = axis_col,
        cex = axis_cex,
        adj = c(0.5, 1)
      )
    }
    
    ## y-axis ticks and labels
    ## IMPORTANT:
    ## labels use image-coordinate convention:
    ## y = 0 at top, increasing downward
    y_ticks <- seq(0, img_height, by = axis_tick_by)
    
    for (yt in y_ticks) {
      
      ## convert image y-coordinate to plotting y-coordinate
      y_plot <- img_height - yt
      
      segments(
        x0 = axis_offset_px - 7,
        y0 = y_plot,
        x1 = axis_offset_px + 7,
        y1 = y_plot,
        col = axis_col,
        lwd = axis_lwd
      )
      
      ## prevent labels at extreme top/bottom from being clipped
      label_y <- min(max(y_plot, 14), img_height - 14)
      
      text(
        x = axis_offset_px + 12,
        y = label_y,
        labels = yt,
        col = axis_col,
        cex = axis_cex,
        adj = c(0, 0.5)
      )
    }
    
    ## axis titles
    text(
      x = img_width - 8,
      y = axis_offset_px + 16,
      labels = "x (px)",
      col = axis_col,
      cex = axis_cex,
      adj = c(1, 0)
    )
    
    text(
      x = axis_offset_px + 12,
      y = img_height - 8,
      labels = "y (px)",
      col = axis_col,
      cex = axis_cex,
      adj = c(0, 1)
    )
  }
  
  dev.off()
  
  ## overlay annotations onto original image
  img_annotated <- magick::image_composite(img, overlay)
  
  return(img_annotated)
}


## main function: extract chunks and save reference image 
extract_image_chunks <- function(
    image_folder,
    x,
    y,
    width,
    height = width,
    output_folder_name = "extractions",
    extraction_set_name = NULL,
    output_suffix = "extraction",
    reference_suffix = "reference_box",
    reference_image_index = 1,
    reference_image_ext = "png",
    image_extensions = c("jpg", "jpeg", "png", "tif", "tiff"),
    overwrite = TRUE,
    save_reference_image = TRUE,
    box_col = "red",
    box_lwd = 4,
    draw_axes = TRUE,
    axis_col = "white",
    axis_cex = 0.55,
    axis_lwd = 1,
    axis_tick_by = 50,
    axis_offset_cm = 1,
    axis_dpi = 96
) {
  
  ## check input folder
  if (!dir.exists(image_folder)) {
    stop("The image folder does not exist: ", image_folder)
  }
  
  ## create parent extraction folder inside image folder
  extraction_parent_folder <- file.path(image_folder, output_folder_name)
  
  if (!dir.exists(extraction_parent_folder)) {
    dir.create(extraction_parent_folder, recursive = TRUE)
  }
  
  ## create named subfolder inside extraction folder, if requested
  if (!is.null(extraction_set_name)) {
    
    if (!is.character(extraction_set_name) || length(extraction_set_name) != 1) {
      stop("extraction_set_name must be NULL or a single character string.")
    }
    
    if (extraction_set_name == "") {
      stop("extraction_set_name cannot be an empty string.")
    }
    
    output_folder <- file.path(extraction_parent_folder, extraction_set_name)
    
  } else {
    
    output_folder <- extraction_parent_folder
  }
  
  ## create final output folder
  if (!dir.exists(output_folder)) {
    dir.create(output_folder, recursive = TRUE)
  }
  
  ## find image files
  image_pattern <- paste0("\\.(", paste(image_extensions, collapse = "|"), ")$")
  
  image_files <- list.files(
    path = image_folder,
    pattern = image_pattern,
    full.names = TRUE,
    ignore.case = TRUE
  )
  
  ## stop if no images are found
  if (length(image_files) == 0) {
    stop("No image files found in: ", image_folder)
  }
  
  ## check reference image index
  if (reference_image_index < 1 || reference_image_index > length(image_files)) {
    stop(
      "reference_image_index is outside the range of available images.\n",
      "Number of images found: ", length(image_files), "\n",
      "Requested reference_image_index: ", reference_image_index
    )
  }
  
  ## define crop geometry for magick
  ## format: width x height + x + y
  crop_geometry <- paste0(width, "x", height, "+", x, "+", y)
  
  ## crop all images
  output_files <- purrr::map_chr(image_files, function(img_path) {
    
    ## read image
    img <- magick::image_read(img_path)
    
    ## image dimensions
    info <- magick::image_info(img)
    img_width  <- info$width[1]
    img_height <- info$height[1]
    
    ## ensure crop fits this image
    if ((x + width) > img_width || (y + height) > img_height) {
      stop(
        "Crop region extends beyond image boundary for file: ", basename(img_path), "\n",
        "Image size: ", img_width, " x ", img_height, "\n",
        "Requested crop: x = ", x, ", y = ", y,
        ", width = ", width, ", height = ", height
      )
    }
    
    ## crop image
    img_crop <- magick::image_crop(
      image = img,
      geometry = crop_geometry
    )
    
    ## output filename
    img_info <- tools::file_path_sans_ext(basename(img_path))
    img_ext  <- tools::file_ext(img_path)
    
    output_path <- file.path(
      output_folder,
      paste0(img_info, "_", output_suffix, ".", img_ext)
    )
    
    ## avoid accidental overwrite
    if (file.exists(output_path) && !overwrite) {
      stop("Output file already exists and overwrite = FALSE: ", output_path)
    }
    
    ## write cropped image
    magick::image_write(
      image = img_crop,
      path = output_path
    )
    
    return(output_path)
  })
  
  ## optionally save one reference image with the extraction box and axes
  reference_output_path <- NA_character_
  
  if (save_reference_image) {
    
    ref_path <- image_files[reference_image_index]
    ref_img  <- magick::image_read(ref_path)
    
    ref_img_annotated <- draw_extraction_box(
      img = ref_img,
      x = x,
      y = y,
      width = width,
      height = height,
      box_col = box_col,
      box_lwd = box_lwd,
      draw_axes = draw_axes,
      axis_col = axis_col,
      axis_cex = axis_cex,
      axis_lwd = axis_lwd,
      axis_tick_by = axis_tick_by,
      axis_offset_cm = axis_offset_cm,
      axis_dpi = axis_dpi
    )
    
    ref_name <- tools::file_path_sans_ext(basename(ref_path))
    
    reference_output_path <- file.path(
      output_folder,
      paste0(ref_name, "_", reference_suffix, ".", reference_image_ext)
    )
    
    if (file.exists(reference_output_path) && !overwrite) {
      stop("Reference image already exists and overwrite = FALSE: ", reference_output_path)
    }
    
    magick::image_write(
      image = ref_img_annotated,
      path = reference_output_path
    )
  }
  
  ## return useful summary
  return(list(
    summary = tibble::tibble(
      input_file = image_files,
      output_file = output_files,
      x = x,
      y = y,
      width = width,
      height = height
    ),
    reference_image = reference_output_path,
    extraction_parent_folder = extraction_parent_folder,
    output_folder = output_folder
  ))
}

## EXAMPLE USAGE 
#new_extraction <- extract_image_chunks(
#  image_folder = medium_tilt,
#  extraction_set_name = "cinder_block",
#  x = 900,
#  y = 350,
#  width = 300,
#  box_col = "red",
#  box_lwd = 4,
#  draw_axes = TRUE,
#  axis_col = "white",
#  axis_cex = 3,
#  axis_lwd = 1.5,
#  axis_tick_by = 100,
#  axis_offset_cm = 2
#)

#new_extraction$summary
#new_extraction$reference_image
## END extraction function ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




## function: stitch extraction patches into one horizontal image ~~~~~~~~~~~~~~~
stitch_extraction_patches <- function(
    image_folder,
    extraction_set_name,
    extraction_parent_folder_name = "extractions",
    output_filename = NULL,
    output_ext = "png",
    image_extensions = c("jpg", "jpeg", "png", "tif", "tiff"),
    patch_suffix = "extraction",
    reference_suffix = "reference_box",
    background_col = "white",
    spacing_px = 0,
    overwrite = TRUE
) {
  
  ## check image folder
  if (!dir.exists(image_folder)) {
    stop("The image folder does not exist: ", image_folder)
  }
  
  ## define extraction-set folder
  extraction_folder <- file.path(
    image_folder,
    extraction_parent_folder_name,
    extraction_set_name
  )
  
  if (!dir.exists(extraction_folder)) {
    stop("The extraction set folder does not exist: ", extraction_folder)
  }
  
  ## find image files in extraction-set folder
  image_pattern <- paste0("\\.(", paste(image_extensions, collapse = "|"), ")$")
  
  image_files <- list.files(
    path = extraction_folder,
    pattern = image_pattern,
    full.names = TRUE,
    ignore.case = TRUE
  )
  
  if (length(image_files) == 0) {
    stop("No image files found in: ", extraction_folder)
  }
  
  ## remove full-size reference image
  image_files <- image_files[
    !stringr::str_detect(
      basename(image_files),
      fixed(reference_suffix)
    )
  ]
  
  ## retain only extraction patches
  image_files <- image_files[
    stringr::str_detect(
      basename(image_files),
      fixed(patch_suffix)
    )
  ]
  
  if (length(image_files) == 0) {
    stop(
      "No extraction patches found after excluding reference images.\n",
      "Check patch_suffix and reference_suffix."
    )
  }
  
  ## extract timestamp from filename
  ## expected pattern: YYYYMMDD_HHMMSS
  timestamps <- stringr::str_extract(
    basename(image_files),
    "\\d{8}_\\d{6}"
  )
  
  if (any(is.na(timestamps))) {
    warning(
      "Some files do not contain a YYYYMMDD_HHMMSS timestamp. ",
      "Those files will be sorted after timestamped files by filename."
    )
  }
  
  ## sort by timestamp, then filename
  sort_tbl <- tibble::tibble(
    image_file = image_files,
    file_name = basename(image_files),
    timestamp = timestamps
  ) |>
    dplyr::arrange(
      is.na(timestamp),
      timestamp,
      file_name
    )
  
  image_files_sorted <- sort_tbl$image_file
  
  ## read patches
  patches <- purrr::map(
    image_files_sorted,
    magick::image_read
  )
  
  ## optional spacing between patches
  if (spacing_px > 0) {
    
    patch_info <- magick::image_info(patches[[1]])
    patch_height <- patch_info$height[1]
    
    spacer <- magick::image_blank(
      width = spacing_px,
      height = patch_height,
      color = background_col
    )
    
    patches_with_spacing <- list()
    
    for (i in seq_along(patches)) {
      patches_with_spacing <- append(patches_with_spacing, list(patches[[i]]))
      
      if (i < length(patches)) {
        patches_with_spacing <- append(patches_with_spacing, list(spacer))
      }
    }
    
    patches <- patches_with_spacing
  }
  
  ## join patches horizontally
  stitched_img <- magick::image_append(
    image = do.call(c, patches),
    stack = FALSE
  )
  
  ## default output filename
  if (is.null(output_filename)) {
    output_filename <- paste0(extraction_set_name, "_stitched.", output_ext)
  }
  
  ## ensure output filename has extension
  if (tools::file_ext(output_filename) == "") {
    output_filename <- paste0(output_filename, ".", output_ext)
  }
  
  output_path <- file.path(extraction_folder, output_filename)
  
  if (file.exists(output_path) && !overwrite) {
    stop("Output file already exists and overwrite = FALSE: ", output_path)
  }
  
  ## write stitched image
  magick::image_write(
    image = stitched_img,
    path = output_path
  )
  
  ## return useful summary
  return(list(
    stitched_image = output_path,
    extraction_folder = extraction_folder,
    n_patches = length(image_files_sorted),
    patch_order = sort_tbl
  ))
}


## EXAMPLE USAGE
#new_fig <- stitch_extraction_patches(
#  image_folder = high_tilt,
#  extraction_set_name = "distant_anemones",
#  spacing_px = 10,
#  background_col = "black"
#)
## END function invocation ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~





## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## END of script 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
