library(shinythemes)

ui <- fluidPage(theme = shinytheme("sandstone"),
  
  # Application title
  titlePanel("My liquor webpage"),
  
  sidebarPanel("Have fun exploring your favourite drinks!",
               img(src = "liquor.png", width = "100%"),
               br(),br(),              
              
               sliderInput("priceIn","Prize of booze",
                           min=0, max=300, value=c(10,20), pre="CAD"),  # value is default
              
              radioButtons("typeIn", "what kind of booze?",
                            choices = c("BEER", "SPIRITS", "WINE"),
                            selected = "SPIRITS"),
              textInput("Country", label="Select by Country", value=""),
              checkboxInput("check", "sort by price", FALSE),
              span("Data source:", 
                   tags$a("OpenDataBC",
                          href = "https://www.opendatabc.ca/dataset/bc-liquor-store-product-price-list-current-prices")),
              br(),
                span("Created by Xinzhe Dong"),
                HTML("&bull;"),
                span("Code", a(href = "https://github.com/hannahdxz/STAT545-hw-Dong-Xinzhe/tree/master/hw%2008", "on GitHub"))
              ),
  
  mainPanel(
            h3(textOutput("summaryText")),
            downloadButton("download", "Download results"),
            br(),br(),
            shinyjs::colourInput("color", "What color would you like the plot to be?", value='#A4A4A4'),
            plotOutput("Hist_AlcCont"),
            br(),br(),
            DT::dataTableOutput("table_head")
            )
)