## -------------------------------------------------------------------------------
## Kyle Scot Shank
## 03/13/2017
##
## This quick script will add random noise (i.e., "jitter") to a vector of
## longitudinal/latitudinal coordinates for assistance in geocoding. This can be
## especially helpful in situations where you have geocoded multiple entities
## without street addresses. 
## -------------------------------------------------------------------------------

## data <- read.csv("")
## read in data

rad.earth = 6378.16
## Equatorial radius of Earth in km
one.degree = (2 * pi * rad.earth) / 360
## Number of km per degree on Earth
one.km = 1/one.degree
## Number of degrees per km 

inRange <- function(from,to){
  return(round((runif(1) * (to - from)),5))
}
## For generating a random number based upon the coordinate

jitter <- function(x){
  output <- inRange(x - one.km, x + one.km)
  return(output)
}
## Produce the jitter

lat.new <- NULL
lon.new <- NULL

## Subset your data into an array that has a column for lat, a column for lon
## work.data <- data.frame(lon = data$lon, lat = data$lat)

for(i in 1:length(work.data[,1])) {
  lon.vec[i]<-work.data$lon[i]+sample(c(-1,1),size=1)*jitter(work.data$lon[i])
  lat.vec[i]<-work.data$lat[i]+sample(c(-1,1),size=1)*jitter(work.data$lat[i])
}


