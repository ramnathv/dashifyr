handleBarsOutput <- function(outputId, templateId) {
  # assets = list(jshead = c('handlebars.min.js', 'shinyHandlebars.js'))
  # assets$jshead = paste0('widgets/handlebars/', assets$jshead)
  div(id = outputId, class = "handlebars_output", `data-tid` = templateId, 
    style='height:100px;'
  )
}

handleBarsTemplate <- function(inputId, html){
  tags$script(id = inputId, type = 'text/x-handlebars-template', HTML(html))
}