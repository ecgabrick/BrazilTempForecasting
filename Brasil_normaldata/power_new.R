library(gsignal)
library(oce)
cases <- read.csv("/home/enrique/Dropbox/Projetos/Climate_Sidney/Programas_novo/Brasil/brasil_meses.csv", header=FALSE)
t<- c(cases$V1)
x <- c(cases$V2)
plot(t, x, type = "l", xlab = "Time (m)", ylab = "", main = "Original signal")
pw <- pwelch(x)
plot(pw, xlim=c(0,0.5), main = "PSD estimate using FFT")

my.spec = spectrum(x, plot=TRUE)
plot(my.spec, xlab="Frequency", ylab="Log-amplitude",
     main="", sub="")
plot(1/my.spec$freq,my.spec$spec, type="b", xlab=
       "Period (Monthly)", ylab="Amplitude", xlim=c(5.9,12.1))
summary(my.spec)
