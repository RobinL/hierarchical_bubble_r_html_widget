library(shiny)
library(hierarchicalbubble)


shiny::shinyApp(
  ui = shiny::fluidPage(
    
    # Application title
    shiny::titlePanel("Hierarchical bubble chart demo"),
    
    # Sidebar with a slider input for number of bins
    shiny::verticalLayout(
    
      # Show a plot of the generated distribution
      shiny::mainPanel(
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

