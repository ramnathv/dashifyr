justgageOutput <- function(outputId, width, height) {
  tags$div(
    id = outputId, 
    class = "justgage_output", 
    style = sprintf("width:%dpx; height:%dpx", width, height)
  )
}

renderGage <- function(expr, env = parent.frame(), quoted = FALSE){
  func <- shiny::exprToFunction(expr, env, quoted)
  function(){
    data <- func()
    defaults <- list(min = 0, max = 100, title = 'JustGage')
    modifyList(defaults, data)
  }
}