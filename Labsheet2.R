#Importing data from text file
D <- read.table("./DataSet/TestData1.txt", header=TRUE)
X <- D[,2:10]
Y <- D[,1]

#selecting subset of data where X3 > 38
D[D[,4] > 38,] #or u can use D[D$X3 > 38,]

#selecting a subset of data where X8 > 2000
D[D[,9] > 2000,] #or u can use D2000 <- [D$X8 > 2000,]

#attaching data set for graphical representation
attach(D)
#main means the heading of the plot
plot(x1,y,main = "Scatter Plot of Y and X1")
hist(x2, main = "Histogram of X2")
#detaching data set
detach(D)

#Importing data from CSV file
Dcsv <- read.csv("./DataSet/TestData2.csv")

#if you don't the file locatiion R studio will show a choose file dialog and u can choose the file
read.table(file.choose())

#Importing data from Excel file
#installing the readxl package
install.packages("readxl")
library(readxl)
Dxlsx <- read_excel("./DataSet/Dtest.xlsx")
#read data from sheet named Dataset1
read_excel("./DataSet/Dtest.xlsx",sheet = "Dataset1")
#read data from sheet 2
read_excel("./DataSet/Dtest.xlsx",sheet = 2)

#loading infants data set to infants globle variable
infants <- read.table("./DataSet/Infants.txt", header=TRUE)
attach(infants)
#get ethnic count and add them to mytable
mytable <- table(Ethnic)
#printing mytable
mytable

#detailed pie chart
pie(mytable)
#ethnic count as a percentage and round of it
pcnt <- round(mytable*100/sum(mytable))
#get table names with their percentages as labels
lbls <- paste(names(mytable),'\n', pcnt,'%')
#plot the pie chart with above created lables
pie(mytable,labels = lbls)

#3d pie chart
#installing the plotric package
install.packages("plotrix")
library(plotrix)
#plot a 3d pie chart with above created labels
pie3D(mytable,labels = lbls, explode = 0.2)

#simple bar chart
#main means the heading, ylab means the y label and xlab means the x label
#verticle bar plot
barplot(mytable,main = "Ethnicity distribution", ylab = "No.of infants", xlab = "Ethnicity")
#horizontal bar plot
barplot(mytable,main = "Ethnicity distribution", ylab = "No.of infants", xlab = "Ethnicity",horiz = TRUE)

#simple boxplot with BthWeight vs Smoke
boxplot(BthWeight~Smoke)

#histogram of age
hist(Age,density = 10)

#stacked bar chart
#create a table with Ethnicity vs breastfed
mytable1 <- table(Ethnic,BreastFed)
#on top
barplot(t(mytable1), main = "Ethnicity and breast fed", ylab = "no.of infants", xlab = "Ethnicity",legend = colnames(mytable1))
#besides
barplot(t(mytable1), main = "Ethnicity and breast fed", ylab = "no.of infants", xlab = "Ethnicity",legend = colnames(mytable1),beside = TRUE)

#scatter plot on Bthweight vs Bthlength
plot(BthLength,BthWeight, pch = 3)

oplot(BthWeight ~ Age|Ethnic)

#one way table
table(Smoke)
#two way table
table(Smoke,Ethnic)
#summary table
#tapply function applies a summary function to a numerical value on table
#mean age of smokers
tapply(Age,Smoke,mean)
#mean age of smokers of different ethnics
tapply(Age,list(Smoke,Ethnic),mean)
#user defined functions with tapply
#R doesn't have function to calculate standard error so we'll make it
tapply(Age,list(Smoke,Ethnic),
			 function(x) 
			 	sqrt(var(x)/length(x))
			 )
#tables of propotion 
tbl1 <- table(Ethnic,Smoke)
prop.table(tbl1,1)
prop.table(tbl1,2)
