-- DATA PROCESSING for analysis

/*-- bikes types used by riders

-- Drop the table if it already exists
IF OBJECT_ID('Diff_casual_member_ridebikes', 'U') IS NOT NULL
DROP TABLE Diff_casual_member_ridebikes;

-- Create the new table and insert the results of the query
SELECT member_casual, rideable_type, COUNT(*) AS total_trips
INTO Diff_casual_member_ridebikes
FROM tripdata_cleaned_combined_data
GROUP BY member_casual, rideable_type
ORDER BY member_casual, total_trips DESC;*/

--select * from diff_casual_member_ridebikes

-------------------------------------------------------------------

-- no. of trips per month


/*IF OBJECT_ID('trips_per_month', 'U') IS NOT NULL
DROP TABLE trips_per_month;

SELECT month, member_casual, COUNT(ride_id) AS total_trips
INTO trips_per_month
FROM tripdata_cleaned_combined_data
GROUP BY month, member_casual
ORDER BY member_casual;*/

--select * from trips_per_month

------------------------------------------------------------------
/*IF OBJECT_ID('trips_per_weekday', 'U') IS NOT NULL
DROP TABLE trips_per_weekday;

-- Create the new table and insert the results of the query
SELECT 
    weekday AS weekday, 
    member_casual, 
    COUNT(ride_id) AS total_trips
INTO trips_per_weekday
FROM tripdata_cleaned_combined_data
GROUP BY weekday, member_casual
ORDER BY member_casual;
*/

---------------------------------------------------------------
-- no. of trips per hour
/*IF OBJECT_ID('trips_per_hour', 'U') IS NOT NULL
DROP TABLE trips_per_hour;

-- Create the new table and insert the results of the query
SELECT 
    DATEPART(HOUR, started_at) AS hour_of_day, 
    member_casual, 
    COUNT(ride_id) AS total_trips
INTO trips_per_hour
FROM tripdata_cleaned_combined_data
GROUP BY DATEPART(HOUR, started_at), member_casual
ORDER BY member_casual;*/

-----------------------------------------------------------------

-- average ride_length per month
/*IF OBJECT_ID('avgridelengthpermonth', 'U') IS NOT NULL
DROP TABLE avgridelengthpermonth;

-- Create the new table and insert the results of the query
SELECT 
    month, 
    member_casual, 
    AVG(ride_length) AS avg_ride_duration
INTO avgridelengthpermonth
FROM tripdata_cleaned_combined_data
GROUP BY month, member_casual;*/

-------------------------------------------------

-- starting station locations
/*IF OBJECT_ID('start_station_locations', 'U') IS NOT NULL
DROP TABLE start_station_locations;

-- Create the new table and insert the results of the query
SELECT 
    start_station_name, 
    member_casual,
    AVG(start_lat) AS avg_start_lat, 
    AVG(start_lng) AS avg_start_lng,
    COUNT(ride_id) AS total_trips
INTO start_station_locations
FROM tripdata_cleaned_combined_data
GROUP BY start_station_name, member_casual;*/

-------------------------------------------------------------
IF OBJECT_ID('end_station_locations', 'U') IS NOT NULL
DROP TABLE end_station_locations;

-- Create the new table and insert the results of the query
SELECT 
    end_station_name, 
    member_casual,
    AVG(end_lat) AS avg_end_lat, 
    AVG(end_lng) AS avg_end_lng,
    COUNT(ride_id) AS total_trips
INTO end_station_locations
FROM tripdata_cleaned_combined_data
GROUP BY end_station_name, member_casual;
