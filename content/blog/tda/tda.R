# Load the igraph package
library(igraph)

# Create a custom color palette excluding red
my_colors <- c("blue", "green", "purple", "orange", "pink")

# Create the graph
g <- graph_from_data_frame(data.frame(from=c(0, 1, 1, 2, 3, 3), to=c(1, 2, 3, 3, 0, 1), weight=c(1, 1, 2, 1, 1, 2)))

# Plot the graph with colorful edges (excluding red)
plot(g, 
     edge.width=E(g)$weight, 
     edge.color=my_colors[E(g)$weight],  # Use the custom color palette
     vertex.color="white", 
     vertex.frame.color="white", 
     vertex.label.color="black", 
     vertex.label.dist=0, 
     vertex.size=20,
     main="",
     xlab="",
     ylab="",
     sub="",
     frame=FALSE)
