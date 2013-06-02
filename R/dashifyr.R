#' Read configuration for a list of widgets
read_config_ <- function(widgets){
  # config = file.path('www', 'widgets', widgets, 'config.yml')
  config = system.file('widgets', widgets, 'config.yml', package = 'dashifyr')
  names(config) = widgets
  lapply(config, function(x) {
    c_ = yaml.load_file(x)[[1]]
  })
}

#' Read contents of a text file into a character string
#' 
#' @param path path to the text file to be read.
read_file_ <- function(path){
  paste(readLines(path, warn = F), collapse = '\n')
}


addWidgets = function(widgets){
  addResourcePath('widgets', system.file('widgets', package = 'dashifyr'))
  cfg = read_config_(widgets)
  jshead = unlist(lapply(names(cfg), function(w){
    if (is.null(cfg[[w]]$jshead)){ return(NULL) }
    paste('widgets', w, cfg[[w]]$jshead, sep = '/')
  }))
  scripts <- lapply(jshead, function(script) {
    singleton(tags$head(tags$script(src = script, type = "text/javascript")))
  })
  
  css = unlist(lapply(names(cfg), function(w){
    if (is.null(cfg[[w]]$css)){ return(NULL) }
    paste('widgets', w, cfg[[w]]$css, sep = '/')
  }))
  styles <- lapply(css, function(style) {
    singleton(tags$head(tags$link(href = style, rel = "stylesheet"))) 
  })
  c(styles, scripts)
}