reset
#
##%%BoundingBox: 60 50 345 265
#
set terminal postscript eps enhanced color size 21.0cm,29.7cm font 'Times,20pt'
set output 'nordeste_an.eps'
#
### CONFIGURACOES GERAIS
set key vertical maxrows 2 samplen 1.4 spacing 1.5 width -5 font 'Times,26pt' 
unset colorbox
set border lw 2.5 back
set multiplot
#
### PARAMETROS PARA AJUSTE
## PROPORCOES
proporcaoBase = 70./99.
proporcaoEcra = (1. + sqrt(5.))/4.
#
## ESPACOS
# MARGENS
margemL = 0.1
margemR = 0.03
margemB = 0.04
# ENTRE QUADROS
#espacoV = 0.05
espacoV = 0.04
# DEMAIS ESPACOS
alturaCB = 0.016
espacoCBV = 0.025
espacoCBHProp = 1./6.
espacoLabelH = 0.007
espacoLabelV = 0.012
#
## CALCULADO
largura = (0.5 - (margemL + margemR))
altura = largura*proporcaoBase*proporcaoEcra
#
### CONFIGURACOES ESPECIFICAS
## PASTAS E ARQUIVOS DADOS
array arquivo[1]
arquivo[1] =  "nordeste_anomalous.dat"
#
nomePlot = "'>>' '<<'"
#
rgbLinha = "'#ff2808'"
# 
## LABELS
labelX = "'Year-Month'"
labelY = "'{/Times-Oblique=28 T^{ an.}} ({/Symbol \260}C)'"
#
#
## EIXOS: INTERVALO
# EIXO X
minimoX = "1"
maximoX = "744"
defineMXTics = "5"
formatoX = "'%.0f'"
#
# EIXO Y
minimoY = "-1.5"
maximoY = "1.5"
defineMYTics = "5"
formatoY = "'%.1f'"
offsetY = "'0.5,0'"
#
# GERAL EIXOS
set xtics out mirror scale 2.5,1.2 offset 0.,0.2 font 'Times,26pt'
set ytics out mirror scale 2.5,1.2 offset 0.5,0.  font 'Times,26pt'
#
set xlabel font 'Times,26pt'
set ylabel font 'Times,26pt' rotate by 90
#
l = margemL
r = l + largura
set lmargin at screen l
set rmargin at screen r
#
t = margemB - espacoV
#
do for [i = 1:1]{
  b = t + espacoV
  t = b + altura
  set bmargin at screen b
  set tmargin at screen t
#
# EIXOS
  set xrange [word(minimoX,i):word(maximoX,i)]
  set xtics 744/2
  set mxtics 5
#  
  set yrange [word(minimoY,i):word(maximoY,i)]
  set ytics 1.5
  set mytics 5
#  
  set xlabel word(labelX,i) offset 0,.5
  set ylabel word(labelY,i) offset word(offsetY,i)
#
set label 1001 '(e)' at screen 0.44,(t - 0.01) left font 'Times,30pt' front
set label 1002 'Northeast' at screen 0.248,t+0.02 left font 'Times,25pt' front
set label 1003 '1987-03' at screen 0.213,t-0.19 left font 'Times,24pt' front
#set label 1004 '{/Symbol \341}{/Times-Oblique=20 T}{/Symbol \361} = 25.71 {/Symbol \261} 0.62' at screen 0.105,t-0.035 left font 'Times,24pt' front
#set label 1005 '{/Symbol \341}{/Times-Oblique=20 T}{/Symbol \361} = 26.21 {/Symbol \261} 0.66' at screen 0.31,t-0.035 left font 'Times,24pt' front
#set label 1006 '{/Symbol \341}{/Symbol-Oblique=22 t}{/Symbol \361} = 25.72 {/Symbol \261} 0.19' at screen 0.105,t-0.05 left font 'Times,24pt' front
#set label 1007 '{/Symbol \341}{/Symbol-Oblique=22 t}{/Symbol \361} = 26.21 {/Symbol \261} 0.22' at screen 0.31,t-0.05 left font 'Times,24pt' front
set xtics add ('1961-01' 1, '1991-12' 372, '2022-12' 744)
set ytics add ('22' 22)
set parametric
set trange [-10:10]
  plot arquivo[1] u 2 w lines lw 3 lt rgb 'cyan' notitle, 314,t w lines lw 8 lt rgb 'red' dt 3 notitle 
  
}
### FECHAMENTO
unset multiplot
set output
