-- Data Exploration

-- checking how many null values exist in each column

SELECT 
  COUNT(*) - COUNT(ride_id) AS ride_id,
  COUNT(*) - COUNT(rideable_type) AS rideable_type,
  COUNT(*) - COUNT(started_at) AS started_at,
  COUNT(*) - COUNT(ended_at) AS ended_at,
  COUNT(*) - COUNT(start_station_name) AS start_station_name,
  COUNT(*) - COUNT(start_station_id) AS start_station_id,
  COUNT(*) - COUNT(end_station_name) AS end_station_name,
  COUNT(*) - COUNT(end_station_id) AS end_station_id,
  COUNT(*) - COUNT(start_lat) AS start_lat,
  COUNT(*) - COUNT(start_lng) AS start_lng,
  COUNT(*) - COUNT(end_lat) AS end_lat,
  COUNT(*) - COUNT(end_lng) AS end_lng,
  COUNT(*) - COUNT(member_casual) AS member_casual,
FROM `Divvy.2024tripdata`;

-- counting total number of rows (5,860,568)
  
SELECT COUNT(*)             
FROM `Divvy.2024tripdata`;

-- ride_id - all are 16 characters in length

SELECT 
  LENGTH (ride_id) AS id_length,
  COUNT(ride_id) AS no_of_rows,
FROM `Divvy.2024tripdata`
  GROUP BY id_length;

-- rideable_type - checking how many unique types of bikes there are (3)

SELECT 
  DISTINCT(rideable_type),
  COUNT(rideable_type) AS no_of_trips
FROM `Divvy.2024tripdata`
  GROUP BY rideable_type
  ORDER BY no_of_trips DESC;

-- member_casual - only 2 unique values (member or casual)

SELECT
  DISTINCT(member_casual),
  COUNT(member_casual) AS no_of_trips
FROM `Divvy.2024tripdata`
  GROUP BY member_casual
  ORDER BY no_of_trips DESC;
