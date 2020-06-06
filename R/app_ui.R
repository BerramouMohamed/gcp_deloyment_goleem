#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    navbarPage("", id = "nav", theme = shinythemes::shinytheme("spacelab"),
               
               # tabPanel("Données", icon = icon("database")),
               
               tabPanel("Profiling", icon = icon("users"), 
                        fluidRow(
                          uiOutput('selector'),
                          textOutput('text')
                        )
               ),
               
               tabPanel("Résultats", icon = icon("chart-bar")),
               
               navbarMenu("Plus", icon = icon("plus"))
    )
    
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
 
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'DashboardGolem'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

