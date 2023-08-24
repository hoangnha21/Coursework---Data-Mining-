data(attitude)
summary(attitude)
#b
nrow (attitude)
#c
with(attitude, {
  plot (rating ~ learning)
  title('rating vs. learning')
})

#d
{#scatterplot
  
plot (attitude)}
#e
with(attitude, {par(mfrow=c(2,2))
  hist(rating)
  hist(learning)
})
