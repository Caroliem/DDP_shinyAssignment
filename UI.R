

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("How much wealth should you have?"),
    sidebarPanel(
        h4("Instructions"),
        p("Select the age from the main breadwinner in your household from the dropdown box below.
            The age is used to calculate the average wealth a dutch household in the Netherlands has. 
            Based on the age a histogram is created with based on total wealth households in that age group have.
            If you want you can also add your own wealth. The histogram will show in a red line 
            how your wealth compares with other households in your age groups."),
        p("To calculate your wealth and plot the histogram you have to press the calculate button."),
        selectInput("Age", label = h3("Select your age"), 
                    choices = list("20 - 25" , 
                                   "25 - 30" ,
                                   "30 - 35" ,
                                   "35 - 40" ,
                                   "40 - 45" ,
                                   "45 - 50" ,
                                   "50 - 55" ,
                                   "55 - 60" ,
                                   "60 - 65" ,
                                   "70 - 75" ,
                                   "75 - 80"
                                   ), selected = "20 - 25"),
        sliderInput('inputwealth', 'How much wealth do you have',value = 20000, 
                   min = -10000, max = 1000000, step = 100000),
        actionButton("CalcButton", "Calculate!")
           ),
    mainPanel(
        h4("Introduction"),
        p("In this application you can check how much wealth, a dutch household has, 
            based on the age of the main breadwinner of the household.
            Wealth is defined as the difference between the sum of the assets minus the debts.
            The source of the data is from the CBS:"),
        a("Vermogensstatistiek huishoudens", 
          href='http://www.cbs.nl/NR/exeres/45B046B6-C407-4CA0-B6B2-2066E8FFD15A'),
        p("The data from CBS is used to create a linear model between age and wealth. 
          Based on the age input provided by the user the wealth is predicted and plot is created."),
        h3("Your results:"),
        textOutput("text3"),
        textOutput("text1"),
        strong(textOutput("text2")),
        plotOutput('newHist')
    )
))

