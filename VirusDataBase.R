library("seqinr")
library(bioseq)
# *_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*
# Trabajo elaborado por:
# Arnold Ponce A01625647
# Guillermo Esquivel Ortiz A01625621
# Pablo Erhard Hernandez A01721124
# Santiago Santos Bante A01731506
# Pedro Fernandez Merino A01733006
# *_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*_*

# Secuencias de entidades estudiadas :
# zV <- Zika virus, complete genome
# cV <- SARS coronavirus, complete genome
# wV <- Wuhan seafood market pneumonia virus isolate Wuhan-Hu-1, complete genome
# mV <- Middle East respiratory syndrome coronavirus, complete genome
# dV <- Dengue virus 1, complete genome 

# Obtencion de las secuencias

zV <- read.fasta("./Zikavirus.fasta") # Formato seqinr
zVS <- read_fasta("./Zikavirus.fasta") # Formato bioseq

cV <- read.fasta("./SARS.fasta")  # Formato seqinr
cVS <- read_fasta("./SARS.fasta") # Formato bioseq

wV <- read.fasta("./wuhan.fasta")  # Formato seqinr
wVS <- read_fasta("./wuhan.fasta") # Formato bioseq

mV <- read.fasta("./MERS.fasta")  # Formato seqinr
mVS <- read_fasta("./MERS.fasta") # Formato bioseq

dV <- read.fasta("./DengueVirus.fasta")  # Formato seqinr
dVS <- read_fasta("./DengueVirus.fasta") # Formato bioseq


# ----------- ¿Cual es el tamaño de cada secuencia? -----------

sprintf("Virus del Zika: %s proteínas", length(zV[[1]]))
sprintf("Virus Wuhan Hu-1: %s proteínas", length(wV[[1]]))
sprintf("Virus del SARS : %s proteínas", length(cV[[1]]))
sprintf("Virus del MERS : %s proteínas", length(mV[[1]]))
sprintf("Virus del Dengue: %s proteínas", length(dV[[1]]))


# ----------- ¿Cúal es la composición de nucleótidos de cada secuencia? -----------

count(zV[[1]],1) # Virus del Zika
count(wV[[1]],1) # Virus del Wuhan-Hu-1
count(cV[[1]],1) # Virus del SARS
count(mV[[1]],1) # Virus del MERS
count(dV[[1]],1) # Virus del Dengue


# ----------- ¿Cuál es el contenido de GC de cada virus? -----------

print(GC(zV[[1]])) # Virus del Zika
print(GC(wV[[1]])) # Virus del Wuhan-Hu-1
print(GC(cV[[1]])) # Virus del SARS
print(GC(mV[[1]])) # Virus del MERS
print(GC(dV[[1]])) # Virus del Dengue

# Función para obtener la secuencia en complementaria e imprimirla por cada secuencia 

zVSC <- seq_complement(zVS) # Virus del Zika
sprintf("Virus original %s ", zVS)
sprintf("Complementaria %s ", zVSC)

wVSC <- seq_complement(wVS) # Virus del Wuhan-Hu-1
sprintf("Virus original %s ", wVS)
sprintf("Complementaria %s ", wVSC)

cVSC <- seq_complement(zVS) # Virus del SARS
sprintf("Virus original %s ", cVS)
sprintf("Complementaria %s ", cVSC)

mVSC <- seq_complement(zVS) # Virus del 
sprintf("Virus original %s ", mVS)
sprintf("Complementaria %s ", mVSC)

dVSC <- seq_complement(dVS) # Virus del Dengue
sprintf("Virus original %s ", dVS)
sprintf("Complementaria %s ", dVSC)


# Comparacion de la composicion de neuclotidos de las 5 secuencias
# Opciones a comparar ----> zV, cV, wV, mV, dV, iV

comp(dV,zV)


# Segmentos del virus H1N1 de México en el 2008

iV <- read_fasta("./InfluenzaAMex.fasta")

iVDNA <- dna(iV) # ADN del virus de la Influenza

iVRNA <- seq_transcribe(iVDNA) # ARN del virus de la Influenza

iVAA <- seq_translate(iVDNA) # Secuencia de aminoacidos del virus de la influenza

iVDNAComp <- seq_complement(iVDNA) # Obtencion del complemento de la secuencia de ADN

iVDNACompRev <- seq_reverse(iVDNAComp) # Secuencia complemento inversa



# Funcion para la comparacion en composicion de nucleotidos

comp <- function (seq1, seq2) {
  par(mfrow=c(1,2))
  barplot(table(seq1),col = 1:4)
  barplot(table(seq2),col = 1:4)
}





