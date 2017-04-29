


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


jpeg(file = "portada.jpeg")
plot(1:10)
rect(1, 5, 3, 7, col = "white")
dev.off()




jpeg(filename="portada999.jpeg", #bg="transparent",
     quality=99,
     width=859, height=453)

par(col.axis='white', bg='transparent',
    col.lab='white', col.main='white')

plot(f[[1]], main='', las=1, lwd=3,
     bty='n', xaxt='n', yaxt='n',
     xlim=c(4, 20), col=paleta[1],
     xlab='Producción promedio por día (lt)',
     ylab='Densidad')
for (i in 2:8) lines(f[[i]], lwd=3, col=paleta[i])

axis(side=1, col='white')
axis(side=2, col='white')

legend('topright', col=paleta, text.col='white',
       lwd=2, bty='n',
       legend=paste('Parto ', 1:8))

dev.off()

