knobOutput <- function(outputId, value){
  div(class = 'wrapper',
    h1('Synergy'),
    tags$input(id = outputId, class = "knob_output")
  )
}