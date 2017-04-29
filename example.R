library(shiny)
library(hierarchicalbubble)


shinyApp(
  ui = fluidPage(
    
    # Application title
    titlePanel("hierarchicalbubble"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        hierarchicalbubble::HBOutput("hb")
      )
    ))
    , 
  server = function(input, output) {
    
    df <- generate_test_data()
    df_l <- wide_to_long_hierarchy(df,colnames(df)[1:4] ,"val")
    df_l 
    output$hb <- renderHB({
      hierarchicalbubble::hierarchical_bubble(df_l)
    })
    
  }
)

