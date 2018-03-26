library(shiny)

# pre-processing
#  1. load the 'mtcars' dataset
#  2. generate factors for various variables

mData <- mtcars
mData$cyl <- factor(mData$cyl)
mData$vs <- factor(mData$vs, labels=c("V-Shaped","Straight-Line"))
mData$am <- factor(mData$am, labels=c("Automatic","Manual"))
mData$gear <- factor(mData$gear)
mData$carb <- factor(mData$carb)

shinyServer(
	function(input, output) {
	  reactText <- reactive({paste("mpg ~", input$radio)})
	  output$caption <- renderText({reactText()})
	  output$mPlot <- renderPlot({
	    boxplot(as.formula(reactText()),
	            data = mData,
	            outline = input$outliers,
	            col = "light green",
	            pch = 20)
	  })
    }
)
