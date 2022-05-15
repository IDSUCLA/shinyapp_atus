colors_albert<- c("231,56,71", "240,250,239", "168,218,219", "69,123,157", "29,53,87")
colors_albert<- sapply(strsplit(colors_albert, ","), function(x) rgb(x[1], x[2], x[3], maxColorValue = 255))

palette_albert<- c(`red` = colors_albert[1],
                   `white` = colors_albert[2],
                   `light_blue` = colors_albert[3],
                   `blue` = colors_albert[4],
                   `dark_blue` = colors_albert[5])

albert_cols<- function(...){
  cols<- c(...)
  if(is.null(cols))
    return(palette_albert)
  palette_albert[cols]
}

albert_palettes<- list(
  `main` = albert_cols("blue", "red", "white"),
  `cool` = albert_cols( "red","blue"),
  `hot` = albert_cols("red", "white")
) 
albert_pal<- function(palette = "main", reverse = FALSE, ...){
  pal<- albert_palettes[[palette]]
  if(reverse){
    pal<- rev(pal)
  }
  colorRampPalette(pal,...)
}

scale_color_albert<- function(palette = "main", discrete = TRUE, reverse = FALSE, ...){
  pal<- albert_pal(palette = palette, reverse = reverse)
  if(discrete){
    discrete_scale("colour", paste0("albert_", palette), palette = pal,...)
  }else{
    scale_color_gradientn(colours = pal(256), ...)
  }
}
scale_fill_albert <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- albert_pal(palette = palette, reverse = reverse)
  if (discrete) {
    discrete_scale("fill", paste0("albert_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

rm(colors_albert, palette_albert, albert_cols)