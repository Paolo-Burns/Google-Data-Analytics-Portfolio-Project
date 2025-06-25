-- Data Cleaning

DROP TABLE IF EXISTS `Divvy.2024tripdata_cleaned`;

-- create cleaned data table

CREATE TABLE IF NOT EXISTS `Divvy.2024tripdata_cleaned` AS ( 
  SELECT
    a.ride_id, rideable_type, started_at, ended_at, ride_length,
    CASE EXTRACT(DAYOFWEEK FROM started_at)
      WHEN 1 THEN 'SUN'
      WHEN 2 THEN 'MON'
      WHEN 3 THEN 'TUE'
      WHEN 4 THEN 'WED'
      WHEN 5 THEN 'THURS'
      WHEN 6 THEN 'FRI'
      WHEN 7 THEN 'SAT'
    END AS day_of_week,
    CASE EXTRACT(MONTH FROM started_at)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEB'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'APR'
      WHEN 5 THEN 'MAY'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AUG'
      WHEN 9 THEN 'SEP'
      WHEN 10 THEN 'OCT'
      WHEN 11 THEN 'NOV'
      WHEN 12 THEN 'DEC'
    END AS month,
    start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual
    FROM `Divvy.2024tripdata` AS a 
    JOIN (
      SELECT 
        ride_id,( 
        --ride_length (mins)
        EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
        EXTRACT(MINUTE FROM (ended_at - started_at)) +
        EXTRACT(SECOND FROM (ended_at - started_at)) / 60
        ) AS ride_length
      FROM `Divvy.2024tripdata`
      ) AS b
    ON a.ride_id = b.ride_id
    WHERE 
      start_station_name IS NOT NULL AND
      end_station_name IS NOT NULL AND
      end_lat IS NOT NULL AND
      end_lng IS NOT NULL AND
      ride_length > 1 AND --remove rides shorter than a minute and longer than a day
      ride_length < 1440
);
     
--set ride_id as the primary key
ALTER TABLE `Divvy.2024tripdata_cleaned`
ADD PRIMARY KEY(ride_id) NOT ENFORCED;

SELECT                          
  COUNT(ride_id) AS no_of_rows  --returned 4,168,157 rows indicating that 1,692,411 rows were removed
FROM `Divvy.2024tripdata_cleaned`;

--seeing how many rows of electric scooters were removed due to NULL values (96,510)

SELECT 
  rideable_type,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  end_lat,
  end_lng,
FROM `Divvy.2024tripdata`
WHERE 
  rideable_type = 'electric_scooter' 
  AND (
    start_station_name IS NULL OR
    start_station_id IS NULL OR
    end_station_name IS NULL OR
    end_station_id IS NULL OR
    end_lat IS NULL OR
    end_lng IS NULL
  );

--checking how many rows of electric scooters remain (46,940)

  SELECT
    rideable_type,
    COUNT(rideable_type) AS num_of_trips
  FROM `Divvy.2024tripdata_cleaned`
  WHERE rideable_type = 'electric_scooter'
  GROUP BY rideable_type;
