library(shiny)

shinyUI(pageWithSidebar(

  # Application title
  
  headerPanel("'mtcars' Miles Per Gallon boxplots"),
	
  sidebarPanel(
	  # Input: Selector for radio buttons to determine variable to plot against MPG
    radioButtons("radio",
	               label = h3("Select Characteristic"),
	               choices = list("Transmission Type (auto vs manaul (default))" = "am",
	                              "Number of Cylinders" = "cyl",
                                "Engine Type (V- vs Standard)" = "vs",
	                              "Number of Gears" = "gear",
	                              "Number of Carburetors" = "carb")
	               ),
    
    # Input: Include outliers? (defualt is TRUE)
    checkboxInput("outliers", "Show outliers?", TRUE), 
    
    # Instructions
    h3('Instructions:'),
    h5('1. Select a vehicle characteristic (variable) to assess against MPG'),
    h5('2. Check/uncheck Outliers checkbox if you want to see outlier data plotted '),
    h6('   NOTE: (some variables do NOT have outliers)')
	  ),
	
  mainPanel(
    h3(textOutput("caption")),
    plotOutput("mPlot")
  )

))
