### COMPARING PDB STRUCTURES
# Validating usage of 1QM2 for analysis
myData <- read.csv("/cloud/project/DataFiles/rawEris-Infectious_2024-0327.csv")

# set categorical variables as.factor
myData$pdbID = as.factor(myData$pdbID)
myData$trialCode = as.factor(myData$trialCode)
myData$mutID = as.factor(myData$mutID)

# explore correlation between PDB structure and ddG
rcorr(myData$ddG, myData$pdbID)
# with a p-value of 0.1953, the PDB structure used does not seem to effect ddG
ggplot(myData)+aes(x=pdbID,y=ddG,color=pdbID)+geom_jitter()+theme(legend.position = "none")
ggplot(myData)+aes(x=pdbID,y=ddG,color=pdbID)+geom_boxplot()+theme(legend.position = "none")

# single factor ANOVA
describeBy(myData$ddG,myData$pdbID)
# skew and kurtosis for both distributions are within +/- 3, can use normal distribution
myANOVA = aov(ddG ~ pdbID, data=myData)
summary(myANOVA)
# resulting p-value shows no significant effect on ddG by pdbID
