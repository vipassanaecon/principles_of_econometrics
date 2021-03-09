#Principles of Econometrics with  R
#https://bookdown.org/ccolonescu/RPoE4/
#chapter 1 introduction
#https://bookdown.org/ccolonescu/RPoE4/intro.html#the-rstudio-screen
rm(list=ls()) # Caution: this clears the Environment

#install missing packages
library(devtools)
library(bookdown)
library(PoEdata)
library(knitr)
library(xtable)
library(printr)
library(stargazer)
library(rmarkdown)

#the function install_git from the package devtools installs packages such as PoEdata
#from the GitHub web site. Here is the code that installs devtools and bookdown:

install.packages("devtools") #installs devtools package
devtools::install_git( #take devtools package and return install_git function
  "https://github.com/ccolonescu/PoEdata") #url for PoEdata package

#code that may be needed to install packages. 
install.packages("bookdown") 
install.packages("knitr")
install.packages("xtable")
install.packages("printr")
install.packages("stargazer")
install.packages("rmarkdown")


#1.1 the RStudio screen
knitr::include_graphics(
  "01-intro_files/RStudio_screen_1.PNG") #insert file path of saved PNG file


#1.2 how to open a data file
devtools::install_git(
  "https://github.com/ccolonescu/PoEdata")
library(PoEdata) # Makes datasets ready to use

library(PoEdata)
data("andy")  # makes the dataset "andy" ready to use
?andy         # shows information about the dataset

#show head of dataset, with variables as column names (default is 6):
head(andy)
#output
#   sales price advert
#1  73.2  5.69    1.3
#2  71.8  6.49    2.9
#3  62.4  5.63    0.8
#4  67.4  6.22    0.7
#5  89.3  5.02    1.5
#6  70.3  6.41    1.3


#show a few rows in dataset:
some(andy) #if functions work properly will return random chosen elements of an object
#https://www.rdocumentation.org/packages/DescTools/versions/0.99.40/topics/Some

#shows last 6 rows in dataset:
tail(andy)
#output
#    sales price advert
#70  73.7  6.02    2.2
#71  82.2  5.73    1.7
#72  74.2  5.11    0.7
#73  75.4  5.71    0.7
#74  81.3  5.45    2.0
#75  75.0  6.05    2.2


#1.3 creating graphs
plot(x, y, xlab="income in 100", ylab="food expenditure, in $", type="p")
#where x and y stand for the variable names to be plotted,
#xlab and ylab are the labels to see on the plot
#type refers to the style of the plot type can be one of the following:
#“p” (points), “l” for lines, and “b” for both points and lines, “n” for no plot.

#the function curve() plots a curve described by a mathematical funtion, over a specified interval
#when the argument add = TRUE is present, the function adds the curve to a previously plotted graph. 
curve(x^1, from=-2, to=2, xlab="x", ylab="y = x" ) # plots a linear graph (from -2 to 2)
# Add another curve to the existing graph:
curve(x^2, add = TRUE) # plots a parametric curve on the same graph
#plot(1:100, type='n')
curve(sqrt(x), from=0, to=100, xlab="x", ylab="y") #plots a square root graph from 0 to 100 on x-axis

#the function abline() adds a line defined by its intercept a and slope b to the current graph.
#The arguments of the function are: besides a and b, the arguments of the function are: h, the  y -
#value for a horizontal line; v, the  x -value for a vertical line; coef, the name of a simple linear
#regression object, which includes the intercept and slope of a regression line.
plot(1:10, type="n") # creates an empty graph
# Add straight lines to graph:
abline(a=8, b=-0.5, h=3.5, v=4) 
curve(x^2, from=0, to=20)
abline(v=10)


#1.4 an R cheat sheet
lm(y~x, data = datafile) #regresses y on x using the data in datafile

nrow(datafile) #return the number of observations (raws) in datafile

nobs(modelname) #gives the number of observations used by a model. 
#may be different from the number of observations in the data file 
#because of missing values or sub-sampling.

set.seed(number) #sets the seed for the random number generator to make results reproducible. 
#This is needed to construct random subsamples of data

rm(list=ls()) #removes all objects in the current Environment 
#except those that have names starting with a dot (.)
