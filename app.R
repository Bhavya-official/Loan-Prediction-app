#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

# Loading package
library(shiny)
library(shinythemes)
#library(caTools)
library(tidyr)
library(randomForest)


train_data = read.csv("./dataset/train_u6lujuX_CVtuZ9i.csv")
names(train_data)
train_data = train_data %>% drop_na()
set.seed(120)  # Setting seed
classifier_RF = randomForest(x = train_data[c(-1, -13)],
                             y = as.factor(train_data$Loan_Status),
                             ntree = 500)
data.frame("hello", "World", column.names=c("h", "HB"))
summary(train_data)
# Define UI for application
ui <- fluidPage(
  includeCSS("www/styles.css"),
  
  theme = shinytheme("slate"),
  h1("Loan Approval Predictor", align="center"),
  
  fluidRow(column(4,
                  selectInput("gender", "Select Gender",
                              choices = list("Male"=3, "Female"=2)
                  ),
                  
                  selectInput("married", "Married Status",
                              choices = list("Yes"=2, "No"=3)
                  ),
                  
                  selectInput("depends", "Dependents",
                              choices = list("0" = 2, "1"=3, "2"=4, "3+"=5), selected = NULL
                  ),
                  
                  selectInput("education", "Education",
                              choices = list("Graduate"=1, "Not Graduate"=2)
                  ),
                  
                  selectInput("employed", "Self Employed",
                              choices = list("Yes"=3, "No"=2)
                  ),
                  
                  numericInput("income", "Applicant Income (In $)",
                               min=0, step=10, value=0),
  ),
  column(4,
         
         numericInput("coincome", "CoApplicant Income (In $)",
                      min=0, step=10, value=0),
         
         numericInput("amount", "Loan Amount (In $)",
                      min=20, max=1000, step=1, value=0),
         
         numericInput("loan_term", "Loan Amount Term (In Days)",
                      min=1, max=365, value=1),
         
         selectInput("credit", "Credit History",
                     choices = list("0" = 0, "1"= 1)),
         
         selectInput("area", "Property Area", 
                     choices = list("Rural"=1, "SemiUrban"=2, "Urban"=3)),
         
         actionButton("val", "Check Approval")
         
  )
  ), 
  uiOutput("value")
  
)

server <- function(input, output, session) {
  output$value = renderUI({
    if(input$val != 0){isolate({
      predict_df = data.frame(input$gender,
                              input$married,
                              input$depends,
                              input$education,
                              input$employed,
                              input$income,
                              input$coincome,
                              input$amount,
                              input$loan_term,
                              input$credit,
                              input$area)
    })
      names(predict_df) <- names(train_data)[c(-1, -13)]
      x = predict(classifier_RF, predict_df)
      if(x == "N"){
        h3("OOPs, Your Apllication has dissproved", class="output text-danger")
      } else{
        h3("Congrats! Your Apllication has approved", class = "output text-success")  
      }
      
    }else {
      ""
    }
  })
}



shinyApp(ui = ui, server = server)
