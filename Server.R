source("helpers.R")
plotdata <- data.frame(TotalWealth=0,y=0)

shinyServer(
    function(input, output) {
        output$text3 <- renderText({
            if (input$CalcButton < 1) 
            paste("Enter your age and wealth hit the calculate button to see your results")
        })
            
        output$text1 <- renderText({
            if (input$CalcButton > 0) 
            isolate(paste("Based on your age  between ", input$Age,
                          # "and the ", input$AvgPersHouseHold,"of people in your household",
                        "your wealth should be:")) 
            })
            
        output$text2 <- renderText({
            if (input$CalcButton > 0) 
            isolate(paste(predwealth(input$Age),'euro'))
             })
     
        output$newHist <- renderPlot({
            if (input$CalcButton > 0) 
            plotdata <- isolate(Basis[Basis$Age == input$Age,])
            hist(plotdata$TotalWealth*1000, xlab = "TotalWealth in 1000 euro", col='lightblue',
                 main='Total wealth in your age group, the red line indicates your wealth') 
            abline(v = input$inputwealth/1000, col="red", lwd = 5)
            })
    })
#    
# #        # BasisAge <- Basis[Age = input$Age]
# #         #output$newHist <- renderPlot({
# #             hist(Basis$TotalWealth, xlab='TotalWealth', col='lightblue',main='Total wealth in your age group')
# #             mu <- input$mu
# #             lines(c(mu, mu), c(0, 200),col="red",lwd=5)
# #             mse <- mean((galton$child - mu)^2)
# #             text(63, 150, paste("mu = ", mu))
# #             text(63, 140, paste("MSE = ", round(mse, 2)))
# #             input <- data.frame(Household = 40, AvgPersHousehold = 2)
# #             predict(fitWealth,input)
#             
