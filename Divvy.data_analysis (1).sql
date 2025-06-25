--Data Analysis

--no. of member and casual riders

SELECT
  member_casual AS membership_type,
  COUNT(member_casual) no_of_trips,
FROM `Divvy.2024tripdata_cleaned`
GROUP BY membership_type
ORDER BY no_of_trips DESC;

--no. of trips per month

SELECT
  month,
  COUNT(ride_id) AS no_of_trips,
  member_casual
FROM `Divvy.2024tripdata_cleaned`
GROUP BY month, member_casual
ORDER BY member_casual;

--average ride length per month of the year

SELECT
  member_casual,
  month,
  ROUND(AVG(ride_length),2) as avg_ride_length
FROM `Divvy.2024tripdata_cleaned`
GROUP BY month, member_casual
ORDER BY member_casual;

--no. of trips per day of the week

SELECT
  member_casual,
  day_of_week,
  COUNT(ride_id) AS no_of_trips
FROM `Divvy.2024tripdata_cleaned`
GROUP BY day_of_week, member_casual;

--average ride length per day of the week

SELECT
  member_casual,
  day_of_week,
  AVG(ride_length) AS avg_ride_length
FROM `Divvy.2024tripdata_cleaned`
GROUP BY day_of_week, member_casual;

--no. trips per hour

SELECT
  member_casual,
  EXTRACT(HOUR FROM started_at) AS hour,
  COUNT(ride_id) AS no_of_trips
FROM `Divvy.2024tripdata_cleaned`
GROUP BY hour, member_casual;

--bike type popularity throughout the year

SELECT
  member_casual,
  month,
  rideable_type,
  COUNT(rideable_type) AS no_of_trips
FROM `Divvy.2024tripdata_cleaned`
GROUP BY month, member_casual, rideable_type;

--start station locations

SELECT
  start_station_name,
  member_casual,
  COUNT(start_station_name) AS start_station_frequency,
  AVG(start_lat) AS start_lat,
  AVG(start_lng) AS start_lng
FROM `Divvy.2024tripdata_cleaned`
GROUP BY start_station_name, member_casual;

--end station locations

SELECT
 end_station_name,
 member_casual,
 COUNT(end_station_name) AS end_station_frequency,
 AVG(end_lat) AS end_lat,
 AVG(end_lng) AS end_lng
FROM `Divvy.2024tripdata_cleaned`
GROUP BY end_station_name, member_casual;



