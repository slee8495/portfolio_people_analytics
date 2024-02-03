library(shiny)
library(shinythemes)
library(shinyWidgets)
library(DT)
library(rmarkdown)
library(shinyjs)

ui <- fluidPage(
  
  id = "main_nav",
  title = (""),
  tabPanel("",
           fluidPage(
             pickerInput("chapter", "",
                         choices = c("Note", 
                                     "People Analytics, Sample")),
             uiOutput("chapter"))),
  
  
tags$style(HTML("
    #logo {
      position: fixed;
      right: 20px;
      bottom: 20px;  # Add some space at the bottom
    }
  ")),

  tags$img(id="logo", src="logo.png", height=100, width=500),
  
  tags$div(style = "height: 20px;") 
  
)

##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################
##########################################################################################################################################



server <- function(input, output, session) {
  active_tab <- reactiveVal("chapter")
  
  
  ################################## Chapter 1: Descision Analysis ###########################################
  
  
  output$chapter <- renderUI({
    req(input$chapter) 
    
    file_name <- switch(input$chapter,
                        "People Analytics, Sample" = "logit_ventura.html",
                        "Note" = "page1.html")
    
    if (!is.null(file_name)) {
      tags$iframe(src = file_name, style = "width:100%; height:800px;")
    }
  })
  
  observeEvent(input$main_nav, {
    active_tab(input$main_nav)
  })
  
  
  #########################################################################################################################################################
  
  
}

shinyApp(ui = ui, server = server)


