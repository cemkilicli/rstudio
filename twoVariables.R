getwd()
list.files()

install.packages('ggplot2')
install.packages('ggthemes', dependencies = TRUE) 
library(ggthemes) 


pf <- read.csv('pseudo_facebook.tsv', sep = '\t')
names(pf)

library(ggplot2) #library of ddplot2 load


qplot(x =age, y = friend_count, data = pf) #scatter plot for 2 variables
