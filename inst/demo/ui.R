require(shiny)
require(rCharts)
require(googleVis)
require(shinyGridster)
require(dashifyr)


# source('www/widgets/handlebars/handlebars.R', local = TRUE)
# source('www/widgets/knob/knob.R', local = TRUE)

shinyUI(bootstrapPage(
  tags$head(
      tags$link(href = "app.css", rel="stylesheet"),
      tagList(addWidgets(c('knob', 'handlebars', 'justgage')))
  ),
  div(class = 'container',
    gridster(width = 300, height = 325,
      gridsterItem(col = 1, row = 1, sizex = 1, sizey = 1, class='widget widget-text',
        # showOutput('mychart', 'polycharts')
        justgageOutput('live_gauge', width = 250, height = 200)
      ),
      gridsterItem(col = 1, row = 1, sizex = 1, sizey = 1, class='widget widget-meter',
          knobOutput('knob')
      ),
      gridsterItem(col = 1, row = 1, sizex = 1, sizey = 1, class='widget widget-list',
       handleBarsOutput('test', 'tmpl'),
       handleBarsTemplate('tmpl', '<h2>{{ carname }}</h2>
         <ol style="list-style-type: none;text-align:left;">
           <li>Mileage: {{mpg}}</li>
           <li>Horsepower: {{hp}}</li>
         </ol>'
        )
      ),
      gridsterItem(row = 2, col = 1, sizex = 2, sizey = 1, class = 'widget widget-twitter',
        h1('rCharts'),
        showOutput('mychart', 'polycharts')
      ),
#       gridsterItem(row = 2, col = 1, sizex = 2, sizey = 1, class = 'widget widget-twitter',
#         h1('Twitter Feed'),
#         # textOutput('twitter'),
#         handleBarsOutput('twitter', 'twitter-templ'),
#         handleBarsTemplate('twitter-templ', "
#          <ul>
#              <li>
#                <img src={{profile_image_url}} />
#                <h3>{{from_user}}</h3>
#                <p>{{text}}<span>, {{created_at}}</span></p>
#              </li>
#          </ul>"
#         )
#       ),
      gridsterItem(row = 2, col = 1, sizex = 1, sizey = 1, class = 'widget',
        htmlOutput('pieChart')
      )
   )
  )
))