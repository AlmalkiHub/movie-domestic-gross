#-----------------Movie Domestic % Gross--------------------#

#-----------------Exploratory Data Analysis (EDA)-----------#

#----Made by: Ali Almalki----# 

#Import the data
getwd() #Check current working directory
df <- read.csv("Data.csv")

#Import ggplot2 visualisation library 
library(ggplot2)

#Get an overview of the dataset
head(df)
tail(df)
#Get some info about the dataset 
colnames(df)
str(df)
summary(df)

#What is the day on which most films were released?
ggplot(data=df, aes(x=Day.of.Week)) +
  geom_bar(colour="black", aes(fill=Day.of.Week))

#Filter the dataset to have certain films genres 
df$Genre #Check movies genres
filter <- df$Genre %in% c("action" , "adventure", "comedy", "animation", "drama")  
filteredmovies <- df[filter,]                                                                  
filteredmovies

#Also filter the dataset to have certain studios  
df$Studio #Check Studio
filter2 <- df$Studio %in% c("Fox" , "WB", "Buena Vista Studios", "Universal", "Sony", "Paramount Pictures")  
filteredstudio <- df[filter2,]                                                                  
filteredstudio

#Match two filters together
newdata <- df[filter & filter2, ]
newdata

#Let's visualise the data
p <- ggplot(data=newdata, aes(x=Genre, y=Gross...US))
p

#Add geometries
w <- p + geom_jitter(aes(size=Budget...mill., colour=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.colour = NA) 
  
w

#Set axis labels
w <- w + 
  xlab("Genre")+ 
  ylab("Gross % US") + 
  ggtitle("Domestic Gross % by Movie Genre")
w

# Add theme 
w <- w +
  theme(
    axis.title.x = element_text(colour="navy", size=25),
    axis.title.y = element_text(colour="navy", size=25), 
    axis.text.x = element_text(size=15),
    axis.text.y = element_text(size=15),
    
    plot.title = element_text(size=30), 
    legend.title = element_text(size=20),
    legend.text = element_text(size=20)
    
    # Apply text font 
    text = element_text(family="Comic Sans MS")
  )
w

#Change size 
w$labels$size <- "Budget $M"
w