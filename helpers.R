library(shiny)
library(caret)
library(devtools)
Basis <- read.csv("data/80055ned_UntypedDataSet.csv", sep= ";")
colnames(Basis) <- c("ID","Wealth","Household", "Year","Count","AvgPersHousehold","TotalWealth","Avg","Median")
Basis <- Basis[Basis$Household %in% c(6101:6112),]
Basis$Household <- (Basis$Household-6101)*5+25
Basis$Age <- paste((Basis$Household-5),"-", Basis$Household)
Basis <- Basis[!is.na(Basis$TotalWealth),]
fitWealthA <- train(Avg ~  Age, data = Basis, method = "lm")
predwealth <- function(a) {
    inputdataframe <- 
            data.frame(a)
    colnames(inputdataframe) <- c("Age")
    # print(inputdataframe)
    round(predict(fitWealthA,inputdataframe)*1000)
}
