# 1. Install and Load Packages
# You only need to run the install.packages() line once if you haven't installed it before.
# install.packages("jsonlite")

library(jsonlite)
library(dplyr) # Recommended for cleaning and manipulating the resulting data frame

# 2. Specify the URL
json_url <- "https://gbfs.citibikenyc.com/gbfs/en/station_status.json"

# 3. Read the JSON data
# fromJSON() fetches the URL and automatically converts the JSON structure
# into a nested R list or data frame structure.
citi_bike_data <- fromJSON(json_url)

# 4. Extract the Station Status Data Frame
# The station status information is nested within 'data', under the key 'stations'
# within the top-level list object.
station_status_df <- citi_bike_data$data$stations

# 5. Review the resulting data frame
print("First 6 rows of the Station Status Data:")
head(station_status_df)

print("\nStructure of the Data Frame (names and data types):")
str(station_status_df)

# Example: Clean up and convert epoch times to readable date/time
# 'last_updated' is at the top level, and station data includes 'last_reported'
last_updated_time <- as.POSIXct(citi_bike_data$last_updated, origin="1970-01-01", tz="America/New_York")
print(paste("\nData was last updated at:", last_updated_time))

station_status_df <- station_status_df %>%
  mutate(
    # Convert epoch time (seconds since 1970) to a standard date/time format
    last_reported_time = as.POSIXct(last_reported, origin="1970-01-01", tz="America/New_York")
  )

print("\nFirst 6 rows after time conversion:")
head(station_status_df[, c("station_id", "num_bikes_available", "num_docks_available", "last_reported_time")])

# --- PASO 3: BORRAR TODOS LOS GUIONES (-) DEL station_id y luego buscar la estacion "DC1CB984821DFFF7"---


station_status_df2 <- station_status_df %>%
  mutate(
    station_id = gsub("-", "", station_id)
  )

target_station_id <- "DC1CB984821DFFF7"

filtered_station_status <- station_status_df2 %>%
  filter(grepl(target_station_id, station_id))