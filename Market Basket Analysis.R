######################
## Association Rule ##
######################

library(arules)
library(arulesViz)

data("Groceries")  ## Lazy dataset from arules library

ar= Groceries

summary(ar)

inspect(head(ar,5))

itemFrequencyPlot(ar,topN= 10, col= rainbow(10))

## Apriori Algorithm ##

ar_rules= apriori(ar, parameter = list(support= 0.01,
                                       confidence= 0.3,
                                       target= 'rules'))

## Values of support & confidence will vary from industry to industry.

ar_rules1= apriori(ar, parameter = list(support= 0.01,
                                       confidence= 0.1,
                                       target= 'rules'))

inspect(subset(ar_rules1, lift>3))

## Visualization of Market Basket Analysis ##

inspectDT( ar_rules1)  ## Data Table

plot(ar_rules1,engine = 'plotly')

plot(ar_rules1[c(71,111,120)], method = 'graph', engine = 'htmlwidget') 

plot(ar_rules1, method = 'grouped')
