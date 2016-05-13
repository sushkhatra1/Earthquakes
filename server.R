library(shiny)
library(ggmap)
library(leaflet)
library(dplyr)

QuakeData<-read.table("earthquakes.csv",sep=",",header=TRUE)

shinyServer(

  function(input, output,session) {
  	
  	
  	
  	 updateSliderInput(session, 'mag', min = min(QuakeData$mag), max = max(QuakeData$mag))
  	 updateSliderInput(session, 'depth', min = min(QuakeData$depth), max = max(QuakeData$depth))
  	 
  	 Quake <- reactive({

    

    Quake <- QuakeData %>%

      filter(between(mag, input$mag[1], input$mag[2])) %>%
      filter(between(depth, input$depth[1], input$depth[2])) 



    

    Quake

    

  })
      output$map <- renderLeaflet({




    Quake <- Quake()

    

    m <- Quake %>% leaflet() %>% addTiles()

      




    

    if (nrow(Quake) > 0) { m <- m %>%

       addCircles(lng=~longitude, lat = ~latitude,fillOpacity = 0.9, opacity = 0.35, weight = 0.04)

              

    

    

    }


    m

    

  })




  }
)