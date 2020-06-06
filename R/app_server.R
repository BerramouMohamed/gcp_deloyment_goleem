#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # List the first level callModules here
  output$selector <- renderUI({
    
    selectizeInput('selector', "help me guess what you're feeling Idiot!", 
                   choices = c("Frustrated", "Angry", "Happy"))
  })
  
  output$text <- renderText(
    paste0('Why are you so ', input$selector, '!!')
  )
}
