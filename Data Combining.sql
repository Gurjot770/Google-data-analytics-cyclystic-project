Data Combining.sql
-- USE [citi bike trip data]
/* SELECT *
INTO tripdata_combined
FROM (
  SELECT * FROM june_2023
  UNION ALL
  SELECT * FROM july_2023
  UNION ALL
  SELECT * FROM august_2023
  UNION ALL
  SELECT * FROM september_2023
  UNION ALL
  SELECT * FROM october_2023
  UNION ALL
  SELECT * FROM november_2023
  UNION ALL
  SELECT * FROM december_2023
  UNION ALL
  SELECT * FROM january_2024
  UNION ALL
  SELECT * FROM february_2024
  UNION ALL
  SELECT * FROM march_2024
  UNION ALL
  SELECT * FROM april_2024
  UNION ALL
  SELECT * FROM may_2024
) AS combined_data;*/

-- now checking the number of rows we got
 SELECT COUNT(*)
FROM tripdata_combined ;
