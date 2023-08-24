#a
dim(arbuthnot_1_)

#b
names(arbuthnot_1_)

#c
length(arbuthnot_1_$girls)
#d
plot(x = arbuthnot_1_$year, y = arbuthnot_1_$girls)

#e
plot(x = arbuthnot_1_$year, y = arbuthnot_1_$boys, type = "l")

#f
arbuthnot_1_ %>% ggplot(aes(year, total)) +
  geom_line() +
  xlab("Year") + ylab("Baptized children (boys and girls)") +
  ggtitle("Baptized children, born in London. Recorded by Dr. John Arbuthnot.")

