# Load required libraries
library(ggplot2)
library(dplyr)
library(gganimate)

# Read the original Sierpinski Triangle points
sierpinski_points <- read.csv("sierpinski_points.csv")

# Read the collapsed edges
collapsed_edges <- read.table("sierpinski.txt", header = FALSE, sep = "=")
colnames(collapsed_edges) <- c("pairs", "values")

# Extract the x and y coordinates from the 'pairs' column
collapsed_edges$x1 <- sapply(strsplit(as.character(collapsed_edges$pairs), ","), function(x) as.numeric(gsub("[^0-9]", "", x[1])))
collapsed_edges$x2 <- sapply(strsplit(as.character(collapsed_edges$pairs), ","), function(x) as.numeric(gsub("[^0-9]", "", x[2])))

# Create a new data frame to hold the cumulative edges
cumulative_edges <- data.frame()

# Loop to build cumulative_edges
for (i in 1:nrow(collapsed_edges)) {
  temp_df <- head(collapsed_edges, i)
  temp_df$frame <- i
  cumulative_edges <- bind_rows(cumulative_edges, temp_df)
}

# Create the animated plot
p2 <- ggplot() +
  geom_segment(data = cumulative_edges, 
               aes(x = sierpinski_points$X671[x1], y = sierpinski_points$X822[x1], 
                   xend = sierpinski_points$X671[x2], yend = sierpinski_points$X822[x2]), 
               color = "green") +
  theme_minimal(base_family = "Times New Roman") +
  theme(panel.background = element_rect(fill = "lightgray")) +
  ggtitle("Collapsed Edges") +
  coord_fixed(ratio = 1) +
  labs(title = "Frame: {closest_state}")

# Animate the plot using the 'frame' column for states
anim <- p2 + transition_states(states = cumulative_edges$frame, transition_length = 2, state_length = 1)
anim_save("collapsed_edges_animated.gif", anim)
