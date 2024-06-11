Data exploration is done here
SELECT column_name, data_type
FROM  INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'tripdata_combined' 

-- time to check out for null values 

SELECT 
  COUNT(*) - COUNT(ride_id) AS ride_id,
  COUNT(*) - COUNT(rideable_type) AS rideable_type,
  COUNT(*) - COUNT(weekday) AS weekday,
  COUNT(*) - COUNT(started_at) AS started_at,
  COUNT(*) - COUNT(ended_at) AS ended_at,
  COUNT(*) - COUNT(ride_length) AS ride_length,
  COUNT(*) - COUNT(start_station_name) AS start_station_name,
  COUNT(*) - COUNT(start_station_id) AS start_station_id,
  COUNT(*) - COUNT(end_station_name) AS end_station_name,
  COUNT(*) - COUNT(end_station_id) AS end_station_id,
  COUNT(*) - COUNT(start_lat) AS start_lat,
  COUNT(*) - COUNT(start_lng) AS start_lng,
  COUNT(*) - COUNT(end_lat) AS end_lat,
  COUNT(*) - COUNT(end_lng) AS end_lng,
  COUNT(*) - COUNT(member_casual) AS member_casual
FROM tripdata_combined; 

-- max of ride_length
SELECT max(ride_length) AS max_ride_length
FROM tripdata_combined ; 

/*SELECT top 1 weekday
FROM (
    SELECT weekday, COUNT(*) AS count
    FROM tripdata_combined
    GROUP BY weekday
) AS counts
ORDER BY count DESC*/

-- checking for duplicates

--SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
--FROM tripdata_combined;
/*WITH CTE AS (
    SELECT 
        ride_id,
        ROW_NUMBER() OVER (PARTITION BY ride_id ORDER BY (SELECT NULL)) AS row_num
    FROM tripdata_combined
)
-- Delete duplicates
DELETE FROM tripdata_combined
WHERE ride_id IN (
    SELECT ride_id
    FROM CTE
    WHERE row_num > 1
);*/

/*SELECT 
    LEN(ride_id) AS length_ride_id, 
    COUNT(ride_id) AS no_of_rows
FROM tripdata_combined
GROUP BY LEN(ride_id);*/

/*SELECT DISTINCT start_station_name
FROM tripdata_combined
ORDER BY start_station_name;

SELECT COUNT(ride_id) AS rows_with_start_station_null       
FROM tripdata_combined
WHERE start_station_name IS NULL OR start_station_id IS NULL;
*/

/*SELECT DISTINCT end_station_name
FROM tripdata_combined
ORDER BY end_station_name;

SELECT COUNT(ride_id) AS rows_with_null_end_station    
FROM tripdata_combined
WHERE end_station_name IS NULL OR end_station_id IS NULL; */

/*SELECT COUNT(ride_id) AS rows_with_null_end_loc
FROM tripdata_combined
WHERE end_lat IS NULL OR end_lng IS NULL; */

/*SELECT COUNT(ride_id) AS rows_with_null_start_loc
FROM tripdata_combined
WHERE start_lat IS NULL OR start_lng IS NULL;*/

/*SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM tripdata_combined
GROUP BY member_casual;*/
