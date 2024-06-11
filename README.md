**### Google Data Analytics Capstone: Cyclistic Case Study**
**Course: [Google Data Analytics Capstone: Complete a Case Study](https://www.coursera.org/learn/google-data-analytics-capstone)**

**Introduction**
In this case study, I will perform many real-world tasks of a junior data analyst at a fictional company, Cyclistic. In order to answer the key business questions, I will follow the steps of the data analysis process: ASK , PREPARE, PROCESS, ANALYZE, SHARE , ACT
Quick links:
Data Source: [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html)

SQL Queries:
[DATA EXPLORATION].(https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/blob/main/Data%20exploration.sql)
Data Combining.sql [https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/blob/main/Data%20Combining.sql]
Data cleaning.sql  [https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/blob/main/Data%20cleaning.sql]
Data process for analysis.sql [https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/blob/main/Data%20process%20for%20analysis.sql]

*Data Visualizations*: ADVANCE EXCEL

**Background**
**_Cyclistic_**
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike. The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno (the director of marketing and my manager) believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

**Scenario**
I am assuming to be a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our recommendations, so they must be backed up with compelling data insights and professional data visualizations.

**Ask**
_Business Task
Devise marketing strategies to convert casual riders to members._

**Analysis Questions**
Three questions will guide the future marketing program:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned me the first question to answer: How do annual members and casual riders use Cyclistic bikes differently?

**Prepare**
Data Source
I will use Cyclistic’s historical trip data to analyze and identify trends from JUNE 2023 to MAY 2024 which can be downloaded from [divvy_tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://www.divvybikes.com/data-license-agreement).

This is public data that can be used to explore how different customer types are using Cyclistic bikes. But note that data-privacy issues prohibit from using riders’ personally identifiable information. This means that we won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

**Data Organization**
There are 12 files with naming convention of YYYYMM-divvy-tripdata and each file includes information for one month, such as the ride id, bike type, start time, end time, start station, end station, start location, end location, and whether the rider is a member or not. The corresponding column names are ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng and member_casual.

**Process**
The 12 months data files are first prepared and two things are calculated in excel in each file , that is "RIDE_LENGTH" and "WEEKDAY". And then each of that new file is saved in subfolders and then imported to MS SQL one by one and further combined by 'UNION ALL'. 

SQL (MS SQL) is used to combine the various datasets into one dataset and clean it.


_Reason_:
A worksheet can only have 1,048,576 rows in Microsoft Excel because of its inability to manage large amounts of data. Because the Cyclistic dataset has more than 5.6 million rows, it is essential to use a platform like SQL (MS SQL) that supports huge volumes of data.

**Combining the Data**
SQL Query: Data Combining.sql [https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/blob/main/Data%20Combining.sql]
12 csv files are uploaded as tables in the dataset 'CITI BIKE TRIP DATA'. Another table named "tripdata_combined" is created, containing 43,14,389 rows of data for the entire 12 months.

**Data Exploration**
SQL Query: [DATA EXPLORATION].https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/blob/main/Data%20exploration.sql
Before cleaning the data, I am familiarizing myself with the data to find the inconsistencies.

**Observations**:

1. 

![Screenshot 2024-06-09 194706](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/b9662500-3ba7-42e1-9d79-3c51915b7dac)

2. The following table shows number of null values in each column.

![Screenshot 2024-06-09 201034](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/5f9f63a2-48d0-45d7-88c3-74e04b67b2bd)

3. As ride_id has no null values, let's use it to check for duplicates.
"SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM tripdata_combined;"

4. There are 3 unique types of bikes(rideable_type) in our data.

5.  Maximum  of the ride_length.
	Maximum time of ride_length
      max of ride_length
       SELECT max(ride_length) AS mean_ride_length
FROM tripdata_combined ;
![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/1ca0d16b-9ae0-4146-9063-d284a00185f3)

6. Mode of the weekday
 SELECT weekday
FROM (
    SELECT weekday, COUNT(*) AS count
    FROM tripdata_combined
    GROUP BY day_of_week
) AS counts
ORDER BY count DESC
![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/a3a606be-ad5d-4944-abec-efe7244596d1)

7. Total of 905166 rows have both start_station_name and start_station_id missing which needs to be removed.

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/31c2cc29-fbae-4260-8baa-3dd6f89a4f54)

8. Total of 523092 rows have both end_station_name and end_station_id missing which needs to be removed.

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/469b36ec-fcd7-44c7-beeb-902c8d81a58f)

9. Total of 119 rows have both end_lat and end_lng missing which needs to be removed.

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/b236d812-5b1e-42cc-a3c3-f8a080d4070d)

10. member_casual column has 2 unique values as member or casual rider.

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/35c4f1e3-3386-4e5b-aff1-f5d4182ab71b)

**Data Cleaning**
SQL Query: [Data Cleaning](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/03.%20Data%20Cleaning.sql)

- All the rows having missing values are deleted.
- 2 more columns ride_length for duration of the trip, weekday a are added.
- Total 15,37,523 rows are removed in this step.

### **Analyze and Share**
_SQL Query_: [Data Analysis](https://github.com/SomiaNasir/Google-Data-Analytics-Capstone-Cyclistic-Case-Study/blob/main/04.%20Data%20Analysis.sql)
Data Visualization: ADVANCE EXCEL
The data is stored appropriately and is now prepared for analysis. I queried multiple relevant tables for the analysis and visualized them in Tableau.
The analysis question is: How do annual members and casual riders use Cyclistic bikes differently?

First of all, member and casual riders are compared by the type of bikes they are using.

BIKE TYPES USED IN THOSE 12 MONTHS DATA (JUNE 2023 -MAY 2024)
 
![Screenshot 2024-06-11 064429](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/b56efd17-1724-4fbf-b7d1-a6f46eb75c4a)

The members make 64.77% of the total while remaining 35.23 constitutes casual riders. Each bike type chart shows percentage from the total. Most used bike is classic bike followed by the electric bike. Docked bikes are used the least by only casual riders.

Next the number of trips distributed by the months, days of the week and hours of the day are examined.
 TRIPS IN THE 12 MONTHS (JUNE 2023 TO MAY 2024)

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/e09203c3-704b-43fa-9aba-ec103957eac2)

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/0ec463d0-e526-496a-bfa0-eb4098a0d52f)


![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/1571e712-31e7-44ff-8aa6-cf8a32e05ac4)

_Months_: When it comes to monthly trips, both casual and members exhibit comparable behavior, with more trips in the spring and summer and fewer in the winter. 
_Days of Week_: When the days of the week are compared, it is discovered that casual riders make more journeys on the weekends while members show a decline over the weekend in contrast to the other days of the week.
_Hours of the Day_: The members shows 2 peaks throughout the day in terms of number of trips. One is early in the morning at around  8 am and other is in the evening at around 4 pm to 8 pm while number of trips for casual riders increase consistently over the day till evening and then decrease afterwards.

We can infer from the previous observations that member may be using bikes for commuting to and from the work in the week days while casual riders are using bikes throughout the day, more frequently over the weekends for leisure purposes. Both are most active in summer and spring.

Ride duration of the trips are compared to find the differences in the behavior of casual and member riders.

### Average Ride duration per month

![image](https://github.com/Gurjot770/Google-data-analytics-cyclystic-project/assets/172128682/e20d19fd-0304-4e97-a6ed-726d376c55fe)


Take note that casual riders tend to cycle longer than members do on average. The length of the average journey for members doesn't change throughout the year, week, or day. However, there are variations in how long casual riders cycle.

These findings lead to the conclusion that casual commuters travel longer (approximately 2x more) but less frequently than members. They make longer journeys on weekends and during the day outside of commuting hours and in spring and summer season, so they might be doing so for recreation purposes.

To further understand the differences in casual and member riders, locations of starting and ending stations can be analysed. Stations with the most trips are considered using filters to draw out the following conclusions.

Casual riders have frequently started their trips from the stations in vicinity of museums, parks, beach, harbor points and aquarium while members have begun their journeys from stations close to universities, residential areas, restaurants, hospitals, grocery stores, theatre, schools, banks, factories, train stations, parks and plazas.

**### FINAL STATEMENTS:**
Casual:--
1.  Prefer using bikes throughout the day, more frequently over the weekends in summer and spring for leisure activities.
2. Travel 2 times longer but less frequently than members.

Members:-

1. Prefer riding bikes on week days during commute hours (8 am / 5pm) in summer and spring.
2. Travel more frequently but shorter rides (approximately half of casual riders' trip duration).

**### Act**

_Recommendations:_

1. Marketing campaigns might be conducted in spring and summer at tourist/recreational locations popular among casual riders.
2. Casual riders are most active on weekends and during the summer and spring, thus they may be offered seasonal or weekend-only memberships.
3. Casual riders use their bikes for longer durations than members. Offering discounts for longer rides may incentivize casual riders and entice members to ride for longer periods of time.
