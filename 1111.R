library(echarts4r) 
library(magrittr)
library(webshot2)

library(htmlwidgets)

CA_gauge <- e_charts() %>% 
  e_gauge(4.1, 
          "INCIDENCE", 
          min=0, 
          max=20,
          axisLine = list(
            linestyle = list(
              color=list(
                c(1.5/20, "green"),
                c(3/20, "yellow"),
                c(1, "red")
              )
            ))) %>% 
  e_title("CA")

htmlwidgets::saveWidget(widget = CA_gauge, file = "~/ca_gauge.html")

# I had to set this for webshot2 to work on Ubuntu 20.04 LTS
# Sys.setenv(CHROMOTE_CHROME = '/snap/bin/chromium')
#  use 'Sys.which("chromium")' to get your path.

webshot('ca_gauge.html', file = 'ca_gauge.png')