#CSES Module 4: Generation of New Liberalism Scale
#Author: Jennifer Lin
#Purpose: Generate new Liberalism scale with only social variables

#USe cleanred data from Management File
source("Management.R")

#View Libvars Data
libvars

#Social Issue Scale: obmits Police (7) and Military (4)
libvars$social <- libvars[,1] + libvars[,2] + libvars[,3] + libvars[,5] + libvars[,6] + libvars[,8] + libvars[,9]
summary(libvars$social)
na.omit(libvars)
stat.desc(libvars)
hist(libvars$social)


