require(shiny)
require(rCharts)
require(googleVis)
shinyServer(function(input, output, session){
  output$test = reactive({
    invalidateLater(1000, session)
    selected = mtcars[sample(NROW(mtcars), 1),]
    selected$carname = rownames(selected)
    as.list(selected)
  })
  
  output$knob = reactive({
    invalidateLater(1000, session)
    val = sample(100, 1)
    fgColor = ifelse(val > 50, 'red', 'lightgreen')
    list(val = val, config = list(fgColor = fgColor, angleArc = 250, angleOffset = -125
    ))
  })
  
  output$mychart = renderChart({
    invalidateLater(1000, session)
    dat = mtcars[sample(NROW(mtcars), 20),]
    r1 <- rPlot(mpg ~ wt, data = dat, type = 'point')
    r1$set(dom = 'mychart', width = 500, height = 250)
    return(r1)
  })
  
  output$twitter = reactive({
    invalidateLater(10000, session)
    keyword = sample(c('rstats', 'slidify', 'rcharts'), 1)
    require(httr)
    tweets = GET(
      url = 'http://search.twitter.com/search.json',
      query = list(q = keyword, rpp = 5, callback = '?')
    )
    content(tweets)$results[[1]]
  })
  
  output$pieChart = renderGvis({
    gvisPieChart(CityPopularity, options = list(width = 250, height = 300))
  })
})