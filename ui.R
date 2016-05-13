library(shiny)
library(ggmap)
library(leaflet)
library(dplyr)
shinyUI(pageWithSidebar(headerPanel=h1("Course Project"),
     
 sidebarPanel(
               
              sliderInput("mag", "Magnitude",value = c(0,1000), min = 0, max = 1000, step = 0.001,ticks=FALSE),
              sliderInput("depth", "Depth",value = c(0,1000), min = 0, max = 1000, step = 0.001,ticks=FALSE),
              img(src="http://ecx.images-amazon.com/images/I/410R748CW2L.jpg", align ="right",size="small")
              
              ),
              mainPanel(
              h4("The Latest Earthquakes Worldwide(data is obtained on 11.05.2016 and it is showing earthquakes that happened during last 30 days)"),
             leafletOutput("map"),
              h5("This is a small application as a final project for 'Development of Data Products' course"),
             a("Link to information regarding used Dataset", href="http://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php"),
            p("In my application I mapped earthquakes that happened during last 30 days. We can filter them with two sliderInputs by magnitude and depth") 
             )
))
