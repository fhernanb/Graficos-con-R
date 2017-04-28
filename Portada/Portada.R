


png(file = "portada.png", bg = "transparent")

par(col.axis='white', col.lab='white', col.main='white')

with(iris, plot(x=Sepal.Length, y=Petal.Length, pch=19, bty='n',
                col=c('salmon', 'steelblue1', 'green1')[Species]))

axis(side=1, col='white')
axis(side=2, col='white')

legend('topleft', legend=levels(iris$Species),
       col=c('salmon', 'steelblue1', 'green1'), pch=19,
       text.col='white', bty='n')


dev.off()
