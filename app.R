# Taken from waiter package README
# https://github.com/JohnCoene/waiter
library(shiny)
library(waiter)

ui <- fluidPage(
  useWaiter(), # include dependencies
  actionButton("show", "Show loading for 5 seconds")
)

server <- function(input, output, session){
  
  observeEvent(input$show, {
    
    waiter_show( # show the waiter
      html = spin_fading_circles() # use a spinner
    )
    
    Sys.sleep(5) # do something that takes time
    
    waiter_hide() # hide the waiter
  })
  
}

shinyApp(ui, server)