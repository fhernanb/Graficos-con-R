# Gráficos para varias variables

En este capítulo se presentan funciones para la creación de gráficos que involucran varias variables.

## Función `plot` \index{plot} \index{diagrama de dispersión}

Los gráficos de dispersión son muy útiles porque permiten ver la relación que existe entre dos variables cuantitativas, la función `plot` permite crear este tipo de gráficos. La estructura de la función `plot` con los argumentos más usuales se muestran a continuación


```r
plot(x, y, type, main, sub, xlab, ylab)
```

Los argumentos de la función `plot` son:

- `x`: vector numérico con las coordenadas del eje horizontal.
- `y`: vector numérico con las coordenadas del eje vertical
- `type`: tipo de gráfico a dibujar. Las opciones son:
    - `'p'` para obtener puntos, esta es la opción por defecto.
    - `'l'` para obtener líneas.
    - `'b'` para obtener los puntos y líneas que unen los puntos.
    - `'c'` para obtener sólo las líneas y dejando los espacios donde estaban los puntos obtenidos con la opción `'b'`.
    - `'o'` para obtener los puntos y lineas superpuestas.
    - `'h'` para obtener líneas verticales desde el origen hasta el valor $y_i$ de cada punto, similar a un histograma.
    - `'s'` para obtener escalones.
    - `'S'` similar al anterior.
    - `'n'` para que no dibuje.
- `...`: otros parámetros gráficos que pueden ser pasados como argumentos para `plot`.

### Ejemplo {-}
Crear 16 parejas de puntos tales que $x=-5, -4, \ldots, 9, 10$ con $y=-10+(x-3)^2$, dibujar los nueve diagramas de dispersión de $y$ contra $x$ usando todos los valores posibles para el parámetro `type`.

A continuación se muestra el código para crear las 16 parejas de $x$ e $y$. Los nueve diagramas de dispersión se observan en la Figura \@ref(fig:ex1plot), de esta figura se observa claramente el efecto que tiene el parámetro `type` en la construcción del diagrama de dispersión.


```r
x <- -5:10
y <- -10 + (x-3)^2
par(mfrow=c(3, 3))
plot(x=x, y=y, type='p', main="con type='p'")
plot(x=x, y=y, type='l', main="con type='l'")
plot(x=x, y=y, type='b', main="con type='b'")
plot(x=x, y=y, type='c', main="con type='c'")
plot(x=x, y=y, type='o', main="con type='o'")
plot(x=x, y=y, type='h', main="con type='h'")
plot(x=x, y=y, type='s', main="con type='s'")
plot(x=x, y=y, type='S', main="con type='S'")
plot(x=x, y=y, type='n', main="con type='n'")
```

![(\#fig:ex1plot)Efecto del parámetro `type` en la función `plot`.](03_graphs2v_files/figure-latex/ex1plot-1.pdf) 

### Ejemplo {-}
Como ilustración vamos a crear un diagrama de dispersión entre el precio de apartamentos usados en la ciudad de Medellín y el área de los apartamentos. El código necesario para cargar la base de datos y construir el diagrama de dispersión se muestra a continuación.


```r
url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/aptos2015'
datos <- read.table(file=url, header=T)

par(mfrow=c(1, 2))
plot(x=datos$mt2, y=datos$precio)
plot(x=datos$mt2, y=datos$precio, pch='.',
     xlab='Área del apartamento (m2)', ylab='Precio (millones de pesos)')
```

![(\#fig:ex2plot)Diagrama de dispersión del precio del apartamento versus área del apartamento. A la izquierda el diagrama de dispersión sin editar y a la derecha el diagrama de dispersión mejorado](03_graphs2v_files/figure-latex/ex2plot-1.pdf) 

En la Figura \@ref(fig:ex2plot) se presenta el diagrama de dispersión entre precio y área de los apartamentos, de este diagrama se observa claramente que a medida que los apartamentos tienen mayor área el precio promedio y la variabilidad del precio aumentan. Para el diagrama de dispersión de la derecha se usó el parámetro `pch='.'` con el objetivo de obtener pequeños puntos que representen cada apartamento y que no se traslapen debido a que se tienen 694 observaciones en la base de datos.

## Función `persp` \index{persp}
La función `persp` dibuja superfices en tres dimensiones y es posible rotar la superficie para obtener una perpectiva apropiada. La estructura de la función `persp` con los argumentos más usuales se muestran a continuación.


```r
persp(x, y, z, main, sub, theta, phi, r, col, border, box, axes, nticks)
```

Los argumentos de la función `plot` son:

- `x`: vector numérico con los valores de $x$ donde fue evaluada la función o superficie.
- `y`: vector numérico con los valores de $y$ donde fue evaluada la función o superficie.
- `z`: matriz que contiene las alturas $z$ de la supercifie para cada combinación de $x$ e $y$.
- `main`: vector numérico con las coordenadas del eje vertical.
- `sub`: vector numérico con las coordenadas del eje vertical.
- `theta, phi`: ángulo para la visión de la superficie, `theta` para la dirección azimutal y `phi` para latitud. Ver Figura \@ref(fig:globo) para una ilustración de los ángulos.
- `r`: distancia entre el centro de la caja de dibujo al punto de vista.
- `col`: color de la superficie.
- `border`: color para el borde de la superficie.
- `box`: valor lógico para indicar si se quiere dibujar la caja que contiene la superficie, por defecto es `TRUE`.
- `axes`: valor lógico para indicar si se desean marcas en los ejes y nombres de los ejes, por defecto es `TRUE`. Si `box='FALSE'` no aparecen marcas ni nombres de los ejes.
- `expand`: factor de expansión aplicado a los valores en el eje `z`.
- `ticktype`: tipo de marcas a colocar en los ejes, `simple` no dibuja nada y `detailed` coloca números a los ejes.
- `nticks`: número aproximado de marcas en los ejes.

\begin{figure}

{\centering \includegraphics[width=0.25\linewidth]{images/IC412528} 

}

\caption{Ilustración de los angulos theta y phi para la función persp. Figura tomada de https://i-msdn.sec.s-msft.com/dynimg/IC412528.png}(\#fig:globo)
\end{figure}

### Ejemplo {-}
Dibujar la superficie asociada a la función $f(x, y)=sen(x^2+y^2)$ para $-2 \leq x \leq2$ y $-2 \leq y \leq2$. Usar 4 combinaciones de los parámetros `theta` y `phi` para obtener un buen punto de vista de la superficie.

Lo primero que se debe hacer es crear la función $f(x, y)$ la cual se va a llamar `fun`. Luego se definen los vectores `x` e `y` tomando por ejemplo 25 puntos equiespaciados en el intervalo $[-2, 2]$. Luego se usa la función `outer` para crear la rejilla o matriz que contiene los valores de $f(x, y)$ para cada combinación de `x` e `y`, los resultados se almacenan en el objeto `z`. Por último se dibujan 4 perspectivas de la función variando los parámetros `theta` y `phi` de la función `persp`. A continuación el código utilizado.


```r
fun <- function(x, y)   sin(x^2 + y^2)
x <- seq(from=-2, to=2, length.out=25)
y <- seq(from=-2, to=2, length.out=25)
z <- outer(x, y, fun)

par(mfrow=c(2, 2), mar=c(1, 1, 2, 1))
persp(x, y, z, zlim=c(-1, 1.5), theta=0, phi=0, col='aquamarine',
      main='(A) theta=0, phi=0')
persp(x, y, z, zlim=c(-1, 1.5), theta=15, phi=15, col='lightpink',
      main='(B) theta=15, phi=15')
persp(x, y, z, zlim=c(-1, 1.5), theta=45, phi=30, col='yellow1',
      main='(c) theta=45, phi=30')
persp(x, y, z, zlim=c(-1, 1.5), theta=60, phi=50, col='lightblue',
      main='(D) theta=60, phi=50')
```

![(\#fig:ex1persp)Superficie generada con `persp` y diferentes valores de theta y phi.](03_graphs2v_files/figure-latex/ex1persp-1.pdf) 

En la Figura \@ref(fig:ex1persp) se presentan las 4 perspectivas de la función $f(x, y)=sen(x^2+y^2)$. De los 4 páneles se nota que (C) y (D) muestran mejor la superficie de interés. 

Al aumentar el valor del parámetro `length.out` en la creación de los vectores `x` e `y` se obtendrá una rejilla más tupida, se recomienda modificar este valor para obtener una superficie apropiada.

### Ejemplo {-}
Dibujar la superficie de una distribución normal bivariada con vector de medias $\boldsymbol{\mu}=(5, 12)^\top$, varianzas unitarias y covarianza con valor de -0.8. Explorar el efecto de los parámetros `ticktype`, `nticks`, `expand`, `axes` y `box`.

Primero se define el vector de medias y la matriz de varianzas y covarianzas, luego se carga el paquete `mvtnorm` que contiene la función `dmvnorm` que calcula la densidad dado el vector de medias y la matriz de varianzas y covarianzas. Se construye la función `fun` y se vectoriza para luego obtener las alturas de la superficie con la ayuda de `outer`. Por último se dibujan tres perspectivas diferentes para la densidad modificando los parámetros `ticktype`, `nticks`, `expand`, `axes` y `box`, a continuación el código usado.



```r
media <- c(5, 12)
varianza <- matrix(c(1, -0.8, -0.8, 1), ncol=2)

require(mvtnorm)
fun <- function(x, y) dmvnorm(c(x, y), mean=media, sigma=varianza)
fun <- Vectorize(fun)

x <- seq(from=2, to=8, length.out=30)
y <- seq(from=9, to=15, length.out=30)
z <- outer(x, y, fun)

par(mfrow=c(1, 3), mar=c(1, 1, 2, 1))
persp(x, y, z, theta=30, phi=30, ticktype = "detailed", nticks=4)
persp(x, y, z, theta=30, phi=30, col='salmon1', expand=0.5, axes=FALSE)
persp(x, y, z, theta=30, phi=30, col='springgreen1', expand=0.2, box=FALSE)
```

![(\#fig:ex2persp)Distribución normal bivariada.](03_graphs2v_files/figure-latex/ex2persp-1.pdf) 

En la Figura \@ref(fig:ex2persp) se presentan las 3 perspectivas para la densidad. Note los efectos que `ticktype`, `nticks`, `expand`, `axes` y `box` tienen sobre los dibujos de las perspectivas.



## Función `pairs` \index{pairs} 
## Función `contour` \index{contour} \index{gráfico de contornos}


