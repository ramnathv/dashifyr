require(shiny)
require(rCharts)
require(googleVis)
shinyServer(function(input, output, session){
  DELAY = 1000
  output$test = reactive({
    invalidateLater(DELAY, session)
    selected = mtcars[sample(NROW(mtcars), 1),]
    selected$carname = rownames(selected)
    as.list(selected)
  })
  
  output$knob = reactive({
    invalidateLater(DELAY, session)
    val = sample(100, 1)
    fgColor = ifelse(val > 50, 'red', 'lightgreen')
    list(val = val, config = list(fgColor = fgColor, angleArc = 250, angleOffset = -125
    ))
  })
  
  output$mychart = renderChart({
    invalidateLater(DELAY, session)
    dat = mtcars[sample(NROW(mtcars), 20),]
    r1 <- rPlot(mpg ~ wt, data = dat, type = 'point')
    r1$set(dom = 'mychart', width = 250, height = 275)
    return(r1)
  })
  
  output$mychart3 = renderChart({
    invalidateLater(DELAY, session)
    dat = mtcars[sample(NROW(mtcars), 20),]
    p1 <- Rickshaw$new()
    p1$layer(~ cyl, group = 'am', data = dat, type = 'bar')
    p1$set(dom = 'mychart3', width = 250, height = 250)
    return(p1)
  })
  
#   output$myChart2 = renderChart({
#     L1 <- Leaflet$new()
#     L1$tileLayer(provider = 'Stamen.TonerLite')
#     L1$setView(c(40.73, -73.90), 13)
#     L1
#   })
  
  output$myChart4 = renderChart({
    invalidateLater(DELAY, session)
    data(economics, package = 'ggplot2')
    dat = transform(economics, date = as.character(date))
    dat = dat[sample(NROW(dat), 400),]
    p3 <- mPlot(x = "date", y = list("psavert", "uempmed"), data = dat, type = 'Line',
      pointSize = 0, lineWidth = 1)
    p3$set(xLabelFormat = "#! function (x) { 
     return x.toString(); } 
    !#")
    p3$set(dom = 'myChart4', width = 250, height = 250)
    return(p3)
  })
  
#   output$myChart5 = renderChart({
#     invalidateLater(10000, session)
#     uspexp = reshape2::melt(USPersonalExpenditure)
#     names(uspexp)[1:2] = c('Category', 'Year')
#     p3 <- xCharts$new()
#     p3$layer(value ~ Year, group = 'Category', data = uspexp)
#     p3$set(xScale = 'linear', yScale = 'linear', type = 'line-dotted', xMin = 1935)
#     p3$set(dom = 'myChart5', width = 275, height = 250)
#     return(p3)
#   })
  
#   output$twitter = reactive({
#     invalidateLater(10000, session)
#     keyword = sample(c('rstats', 'slidify', 'rcharts'), 1)
#     require(httr)
#     tweets = GET(
#       url = 'http://search.twitter.com/search.json',
#       query = list(q = keyword, rpp = 5, callback = '?')
#     )
#     content(tweets)$results[[1]]
#   })
#   
#   output$pieChart = renderGvis({
#     gvisPieChart(CityPopularity, options = list(width = 250, height = 300))
#   })
  
  output$live_gauge <- renderGage({
    invalidateLater(DELAY, session)
    running_mean <- mean(sample(200, 20))
    list(
      value = round(running_mean, 1), 
      max = 200,
      titleFontColor = 'darkmagenta'
    )
  })
})