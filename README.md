## Dashifyr

A dashboarding framework based on Shiny. 

Note. Highly Experimental!

### Installation

Dashifyr requires the latest development versions of `httpuv`, `shiny` and `shinyGridster`. You can install these dependencies along with `dashifyr` using the following lines

```coffee
install.packages("httpuv", 
  repos=c(RStudio="http://rstudio.org/_packages", CRAN="http://cran.rstudio.com/"))
require(devtools)
install_github('shiny', 'rstudio')
install_github('shinyGridster', 'wch')
install_github('dashifyr', 'ramnathv')
```

Note that you can also install `httpuv` from source, by following these instructions on the [github repo](https://github.com/rstudio/httpuv)

### Demo

Dashifyr comes with a demo app, which can be run using the following commands.

```coffee
require(dashifyr)
demoapp = system.file('demo', package = 'dashifyr')
shiny::runApp(demoapp)
```

![screenshot](inst/demo/demo.png)