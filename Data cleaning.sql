-- Data cleaning (REMOVUBG THE NULLS)

-- removing the null rows in start station id and name columns

--DELETE FROM tripdata_combined
--WHERE start_station_name IS NULL OR start_station_id IS NULL;

-- removing the null rows in end station id and name columns

/* DELETE FROM tripdata_combined
WHERE end_station_name IS NULL OR end_station_id IS NULL; */

/*DELETE FROM tripdata_combined
WHERE end_lat IS NULL OR end_lng IS NULL; */

/*DELETE FROM tripdata_combined
WHERE start_lat IS NULL OR start_lng IS NULL;*/



-- Drop the table if it exists
/*IF OBJECT_ID('tripdata_cleaned_combined_data', 'U') IS NOT NULL
DROP TABLE tripdata_cleaned_combined_data;

-- Ensure the schema exists (Uncomment if you need to create the schema)
-- IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'tripdata')
-- BEGIN
--     EXEC('CREATE SCHEMA [tripdata]')
-- END;

-- Create the tripdata_cleaned_combined_data table
SELECT 
    a.ride_id, 
    a.rideable_type, 
    a.started_at, 
    a.ended_at, 
    b.ride_length,
    CASE DATEPART(WEEKDAY, a.started_at) 
        WHEN 1 THEN 'SUN'
        WHEN 2 THEN 'MON'
        WHEN 3 THEN 'TUES'
        WHEN 4 THEN 'WED'
        WHEN 5 THEN 'THURS'
        WHEN 6 THEN 'FRI'
        WHEN 7 THEN 'SAT'    
    END weekday,
    CASE DATEPART(MONTH, a.started_at)
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
    a.start_station_name, 
    a.end_station_name, 
    a.start_lat, 
    a.start_lng, 
    a.end_lat, 
    a.end_lng, 
    a.member_casual
INTO tripdata_cleaned_combined_data
FROM tripdata_combined a
JOIN (
    SELECT 
        ride_id, 
        DATEDIFF(MINUTE, started_at, ended_at) AS ride_length
    FROM tripdata_combined
) b 
ON a.ride_id = b.ride_id
WHERE 
    a.start_station_name IS NOT NULL AND
    a.end_station_name IS NOT NULL AND
    a.start_lat IS NOT NULL AND
    a.start_lng IS NOT NULL AND
    a.end_lat IS NOT NULL AND
    a.end_lng IS NOT NULL AND
    b.ride_length > 1 AND b.ride_length < 1440;

-- Add primary key
--ALTER TABLE tripdata_cleaned_combined_data 
--ADD CONSTRAINT PK_cleaned_combined_data PRIMARY KEY (ride_id);

-- Count the number of rows in the cleaned table*/
SELECT COUNT(ride_id) AS no_of_rows
FROM tripdata_cleaned_combined_data;
