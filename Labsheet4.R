# installing ggplot2 library
install.packages("ggplot2")
library(ggplot2)

ggplot(diamonds)
#if only x axis is known, y axis can be specified in respective geoms
ggplot(diamonds, aes(x=carat))
#if both x and y axis are fixed for all layers
ggplot(diamonds, aes(x=carat, y=price))
#each category of the cut variable have a distinct color once geom is added
ggplot(diamonds, aes(x=carat, color=cut))
#x axis will be carat and color will be steel blue
ggplot(diamonds, aes(x=carat), color="steelblue")

# plotting a scatterplot geom (layer 1) and smoothing geom (layer 2)
ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point() + geom_smooth()

#same as above but specifying the aesthetics inside geoms
ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price, color=cut))

#removing color from geom smooth
ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) + geom_smooth(aes(x=carat, y=price))

# same as above but in simple way
ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut)) + geom_smooth()

#shape of the points vary with the color
ggplot(diamonds, aes(x=carat, y=price, color=cut, shape=color)) + geom_point()

#plotting scatter plot with labels for x and y axis and a title for the plot
gg <- ggplot(diamonds, aes(x-carat,y=price,color=cut)) + geom_point() + labs(title = "Scatter plot", x = "Carat", y = "Price")
#displaying the above created plot
print(gg)

#theming the plot
ggl <- gg + theme(plot.title = element_text(size = 30, face = "bold"),
									axis.text.x = element_text(size = 15),
									axis.text.y = element_text(size = 15),
									axis.title.x = element_text(size = 25),
									axis.title.y = element_text(size = 25)) +
	scale_color_discrete(name ="Cut of diamonds")
#displaying the plot
ggl

#in previous plot all the cuts are in a same graph, this will seperate the plots by cuts
#columns are types of cuts
ggl + facet_wrap(~ cut, ncol = 3)

#row: color, column: cut
ggl + facet_wrap(color ~ cut)

#Bar chart
#y axis will be the count of x axis
plot1 <- ggplot(mtcars, aes(x=cyl)) + geom_bar() + labs(title = "Frequency bar chart")
plot1

#creating a data frame
df <- data.frame(var = c("a","b","c"),  nums = c(1:3))
#by default y axis means the count of x axis if u want a specific y axis use identity
plot2 <- ggplot(df, aes(x=var,y=nums)) + geom_bar(stat = "identity")
plot2

#installing grid extra package
install.packages("gridExtra")
library(gridExtra)

#arrange multiple ggplots in a single grid
grid.arrange(plot1, plot2, ncol = 2)

#flipping the plot horizontaly
ggplot(df, aes(x=var,y=nums)) + geom_bar(stat = "identity") + coord_flip() + labs(title = "coordinates are flipped")

# plot is zoomed in so y axis ranges from 0 -10000
ggplot(diamonds, aes(x=carat,y=price, color=cut)) + geom_point() + geom_smooth() + coord_cartesian(ylim = c(0,10000)) + labs(title = "Coord_cartesian zoomed in")

#limit the plot that x and y axis shows same frequencies
ggplot(diamonds, aes(x=carat,y=price, color=cut)) + geom_point() + geom_smooth() + coord_equal() + labs(title = "Coord_cartesian equal")

#set the theme to bw
ggplot(diamonds, aes(x=carat,y=price, color=cut)) + geom_point() + geom_smooth() + theme_bw() + labs(title = "bw theme")

#removing the legend
ggplot(diamonds, aes(x=carat,y=price, color=cut)) + geom_point() + geom_smooth() + theme(legend.position = "none") + labs(title = "Hiding the legend")

#legend at the top
ggplot(diamonds, aes(x=carat,y=price, color=cut)) + geom_point() + geom_smooth() + theme(legend.position = "top") + labs(title = "Legend at the top")

#legend inside the plot
ggplot(diamonds, aes(x=carat,y=price, color=cut)) + geom_point() + geom_smooth() + theme(legend.justification = c(1,0), legend.position = c(1,0)) + labs(title = "legend inside the plot")

#grid lines
ggplot(mtcars, aes(x=cyl)) + geom_bar(fill = 'darkgoldenrod2') + theme(panel.background = element_rect(fill = 'steelblue'),
																																			 panel.grid.major = element_line(colour = "firebrick", size = 3),
																																			 panel.grid.minor = element_line(colour = "blue", size = 1))

#plot margin background
ggplot(mtcars, aes(x=cyl)) + geom_bar(fill = 'firebrick') + theme(plot.background = element_rect(fill = 'steelblue'),
																																	plot.margin = unit(c(2,4,1,3),"cm"))

library(grid)						
#creating a custum annotation
my_grob = grobTree(textGrob("This text is at x=0.1 and y=0.9, relative!\n Anchor point is at 0,0",x=0.1,y=0.9,hjust = 0,gp=gpar(col="firebrick",fontsize=25, fontface="bold")))

#adding the creating annotation to the ggplot
ggplot(mtcars, aes(x=cyl)) + geom_bar() + annotation_custom(my_grob) + labs(title = "Annotation example")
