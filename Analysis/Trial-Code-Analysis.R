### ANALYZING THE EFFECT OF TRIAL CODE ON ERIS OUTPUT
rawData <- read.csv("/cloud/project/DataFiles/rawEris-Infectious_2024-0327.csv")
rawData$pdbID <- as.factor(rawData$pdbID)
summary(rawData)

# create subset of only 1QM2 data
myData <- rawData[rawData$pdbID=="1QM2", ]
myData$trialCode <- as.factor(myData$trialCode)
myData$mutID <- as.factor(myData$mutID)
summary(myData)

# visualize relationship and two factor ANOVA
ggplot(myData)+aes(x=trialCode,y=ddG,color=trialCode)+geom_jitter()+theme(legend.position = "none")
ggplot(myData)+aes(x=trialCode,y=ddG,color=trialCode)+geom_boxplot()+theme(legend.position = "none")
# single factor ANOVA
describeBy(myData$ddG,myData$trialCode)
# skew and kurtosis for all distributions are within +/- 3, can use normal distribution
myANOVA = aov(ddG ~ trialCode, data=myData)
summary(myANOVA)
report(myANOVA)
# resulting p-value shows no significant effect on ddG by trialCode