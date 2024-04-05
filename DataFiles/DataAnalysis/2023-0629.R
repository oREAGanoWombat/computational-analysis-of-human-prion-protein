# 2023-0629_rawEris.csv
MyData <- read_csv("G:/@@ResearchFiles/RawData/2023-0629_rawEris.csv")
View(MyData)
MyData <- na.omit(MyData)
library(dplyr)
MyData %>% mutate_if(is.character, as.factor)

summary(MyData)
rcorr(MyData$ddG,MyData$resn,type="spearman")
rcorr(MyData$ddG,MyData$infectious,type="spearman")

describeBy(MyData$ddG,MyData$infectious)
describeBy(MyData$ddG,MyData$resn)

MyANOVA = aov(ddG ~ infectious+resn,data=MyData)
summary(MyANOVA)
report(MyANOVA)
