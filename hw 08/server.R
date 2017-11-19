library(tidyverse)
library(DT)
library(stringr)

server <- function(input, output) {
  bcl_data <- read_csv("Data/bcl-data.csv")
  
    Filtered_bcl <- reactive({
      bcl_data<-bcl_data %>%
        filter(Price >= input$priceIn[1],
               Price <= input$priceIn[2],
               Type == input$typeIn,
               if(input$Country != ""){
                 Country == toupper(input$Country)
                     }
               else{Country == Country}
        )

      if(input$check){
          arrange(bcl_data,Price)
          } else{bcl_data
      }
      if(nrow(bcl_data) == 0) {
        return(NULL)
      } else{bcl_data
      }
    
      
    })
    
    output$Hist_AlcCont <- renderPlot({
      if (is.null(Filtered_bcl())) {
        return(NULL)
      } else{
       Filtered_bcl() %>% 
       ggplot() +
      aes(x = Alcohol_Content) +
      geom_histogram(fill=input$color, color="darkred")
      }
  })
    
    output$summaryText <- renderText({
      numOptions <- nrow(Filtered_bcl())
      if (is.null(numOptions)) {
        numOptions <- 0
      }
      paste0("We found ", numOptions, " options for you")
    })
      
   output$table_head <- DT::renderDataTable({
     if (is.null(Filtered_bcl())) {
       return(NULL)
     } else{
     Filtered_bcl()
     }
   })
     
     output$download <- downloadHandler(
       filename = function() {
         "bcl-results.csv"
       },
       content = function(con) {
         write.csv(Filtered_bcl(), con)
       }
     )
   
}