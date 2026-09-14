library(ggplot2)

# 1. Generate a true mathematical circle for the head (radius = 0.5)
theta <- seq(0, 2*pi, length.out = 200)
head_circle <- data.frame(
  x = 0.5 * cos(theta),
  y = 0.5 * sin(theta)
)

# 2. Position the eyes safely inside the 0.5 radius
eyes <- data.frame(
  x = c(-0.18, 0.18), 
  y = c(0.15, 0.15)
)

# 3. Create a perfect upward arc for the smile
smile <- data.frame(
  x = seq(-0.22, 0.22, length.out = 100)
)
# Using a parabola that stays beautifully in the lower-middle half of the head
smile$y <- -0.2 + 2.0 * (smile$x)^2

# Plot the face
ggplot() +
  # Head: Filled polygon so it scales perfectly with coordinates
  geom_polygon(data = head_circle, aes(x, y), fill = "gold", color = "darkgoldenrod", linewidth = 1.5) +
  # Eyes
  geom_point(data = eyes, aes(x, y), size = 5, color = "black") +
  # Smile
  geom_line(data = smile, aes(x, y), linewidth = 2.5, color = "black", lineend = "round") +
  # Keep proportions locked and clear the background grids
  coord_fixed(xlim = c(-0.6, 0.6), ylim = c(-0.6, 0.6)) +
  theme_void()

