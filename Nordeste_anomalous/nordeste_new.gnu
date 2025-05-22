reset
#
##%%BoundingBox: 60 50 345 265
#
set terminal postscript eps enhanced color size 21.0cm,29.7cm font 'Times,20pt'
set output 'nordeste_pred.eps'
#
### CONFIGURACOES GERAIS
#set key horizontal maxrows 1 samplen 1.4 spacing 1.5 width -5 font 'Times,26pt' 
set key horizontal samplen 1.4  font 'Times,26pt' 
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
array arquivo[2]
arquivo[1] =  "nordeste_treino1.dat"
arquivo[1] =  "nordeste_treino1.dat"
#
nomePlot = "'>>' '<<'"
#
rgbLinha = "'#ff2808'"
# 
## LABELS
labelX = "'Year-Month' ''"
labelY = "'{/Symbol D} E' '{/Times-Oblique=28 T^{ an.}} ({/Symbol \260}C)'"
#
#
## EIXOS: INTERVALO
# EIXO X
minimoX = "'595' '595'"
maximoX = "'744' '744'"
defineMXTics = "5"
formatoX = "'%.0f'"
#
# EIXO Y
minimoY = "'0' '-0.5'"
maximoY = "'1' '1.5'"
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
do for [i = 1:2]{
if(i==1){
  b = t + espacoV
  t = b + altura*0.4
  set bmargin at screen b
  set tmargin at screen t
}
if(i==2){
  b = t + espacoV
  t = b + altura
  set bmargin at screen b
  set tmargin at screen t
}
#
# EIXOS
  set xrange [word(minimoX,i):word(maximoX,i)]
  set xtics 744/2
  set mxtics 1
#  
  set yrange [word(minimoY,i):word(maximoY,i)]
  set ytics 1
  set mytics 1
#  
  set xlabel word(labelX,i) offset 0,.5
  set ylabel word(labelY,i) offset word(offsetY,i)
#
set label 1001 '(e)' at screen 0.11,(t - 0.01) left font 'Times,30pt' front
#set label 1002 'Brazil' at screen 0.252,t+0.02 left font 'Times,28pt' front
set trange [0:50]
if(i==2){
set ytics add ('-0.5' -0.5, '0' 0, '1.5' 1.5, '1' 1)
set xtics add ('' 744, '' 595, '' 672)
plot arquivo[1] u 2 w lines lw 3 lt rgb 'cyan' title 'Real', arquivo[1] u 3 w lines lw 3 lt rgb 'red' title 'Pred.'
  }
  if(i==1){
  unset label 1001
  set xtics add ('2022-12' 744, '2010-07' 595, '2016-12' 672)
  plot arquivo[1] u 4 w lines lw 3 lt rgb 'black' notitle 'Real'
  }
}
### FECHAMENTO
unset multiplot
set output
