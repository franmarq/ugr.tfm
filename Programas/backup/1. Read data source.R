

#Read the source data

#example
temp <- tempfile()
download.file("https://s3.amazonaws.com/tripdata/JC-201509-citibike-tripdata.csv.zip",temp)
data <- read.csv(unz(temp, "JC-201509-citibike-tripdata.csv"))
unlink(temp)

#real

temp <- tempfile()
download.file("https://s3.amazonaws.com/tripdata/2023-citibike-tripdata.zip",temp)
file<-unz(temp, "2023-citibike-tripdata/202312-citibike-tripdata.zip")

data <- read.csv(file)
unlink(temp)

