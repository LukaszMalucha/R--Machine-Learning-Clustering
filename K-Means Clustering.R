# K-Means Clustering

# Importing the dataset
dataset = read.csv('Mall_Customers.csv')
X = dataset[4:5]


# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector() ## create a vector 
for (i in 1:10) wcss[i] = sum(kmeans(X, i)$withinss) ## withinss to compute wcss
plot(1:10,  # X
     wcss,  # y
     type = 'b', 
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(X,5, iter.max = 300, nstart = 10)  ## create an object, 5 centers
y_kmeans = kmeans$cluster

# Visualising the clusters
library(cluster)
clusplot(X,
         y_kmeans,    ## vector of clusters
         lines = 0,   ## no lines for distances
         shade = TRUE, 
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE, ## to plot elipses
         main = paste('Clusters of customers'),
         xlab = 'Annual Income',
         ylab = 'Spending Score')