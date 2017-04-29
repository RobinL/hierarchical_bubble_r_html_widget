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
    
    df <- hierarchicalbubble::generate_test_data()
    df_l <- hierarchicalbubble::wide_to_long_hierarchy(df,colnames(df)[1:4] ,"val")
    df_l 
    output$hb <- hierarchicalbubble::renderHB({
      hierarchicalbubble::hierarchical_bubble(df_l,width= 100, height = 100)
    })
    
  }
)

