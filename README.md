# Google-Data-Analytics-Portfolio-Project

## Introduction

#### 
For this project, I am a junior data analyst working on the marketing analyst team at Cyclistic, a bike-share company in Chicago. I will be performing tasks that help the company answer business questions using the data provided.

## Background

Cyclistic is a bike-share program  with over 5,824 geotracked bicycles that are part of a large network of 692 stations across chicago. Users are able to pick up a bike from any station and then return it to any other station. Cyclistic's current marketing strategy relies on general awareness and appealing to broad consumers segments. Cyclistic achieved this by offering various pricing plans, such as single-ride passes, full-day passes, or annual memberships. 

## Scenario

Cyclistic has recently taken note that annual members are much more profitable than casual users who purchase single ride or full day passes. Moreno, the director of marketing, believes that maximizing the number of annual members is the key to future growth. 

Moreno's goal is to design marketing strategies aimed at converting casual riders into annual members. 

Moreno has asked three main questions that will guide the future marketing program:

1. How do annual member and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digitial media to influence casual riders to become members?

#### Moreno has assigned me the first question to answer: How do annual member and casual riders use Cyclistic bikes <ins>differently</ins>?

## Preparing & Processing the Data

The data used for this project is within the [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) and includes the 12 files for the 12 months of 2024. The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement).

The Divvy Trip dataset contains 5.86 million rows of data. The amount of data being to process is too large for Excel (over 1,048,576 rows) so a platform like Google BigQuery must be used in order to support huge volumes of data like this. 

### Combining the Data

SQL Query: [Data Combining](https://github.com/Paolo-Burns/Google-Data-Analytics-Portfolio-Project/blob/main/01.%20Data%20Combining)

12 different csv files that represent each of the 12 months in 2024 are combined using a CREATE TABLE with SELECT ALL & UNION ALL statements to create the '2024tripdata' table containing the company's data for the year of 2024.

The resulting table contains 13 columns: 
ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, and member_casual.

![2024tripdata](https://github.com/user-attachments/assets/4c965eb7-bc6b-4f87-a65c-669a047d7a4e)

### Exploring the Data
SQL Query: [Data Exploration](https://github.com/Paolo-Burns/Google-Data-Analytics-Portfolio-Project/blob/main/02.%20Data%20Exploration.sql)

I began by exploring the data to look for any errors or inconsistencies in the data.
A good place to start is to count the total number of rows that you're working with.

The following query returned a total of 5,860,568 rows

![rows](https://github.com/user-attachments/assets/02c8bd93-723a-4003-a26e-7ed97768af9e)


Next, it's always good to check for any NULL values early on. 

The table below shows how many NULL values exist within each of the columns:

![NULLvalues](https://github.com/user-attachments/assets/677c9e96-bf63-4d63-a5e8-ec73981fe1a5)

It's always important to check your primary key for any mistakes.
In this case, the primary key is the ride_id column and a quick check will tell you all values in the ride_id field are 16 characters in length with no NULL values.

![pkquery](https://github.com/user-attachments/assets/d115200e-e97e-4127-9acb-42fe9a28d20d)
![pkresult](https://github.com/user-attachments/assets/bba2cb5e-5bf3-40f0-aff7-0e8e7d47b53a)

Next, a quick look at how many values exist in rideable type and if there are any typos that we need to fix.

![biketypes](https://github.com/user-attachments/assets/4466bfbd-6363-402d-acf1-21c05ee01602)

Only 3 distinct values exist for the rideable_type meaning that Cyclistic only offers these 3 bike types in their bike-sharing program: 
Classic Bikes, Electric Bikes, and Electric Scooters.

The same thing was done for the member_casual column which is the column that identifies whether the ride was taken by an annual member or a casual rider. 

I found that only 2 distinct values exist: member & casual, also with no NULL values or typos.

## Cleaning The Data
SQL Query: [Data Cleaning](https://github.com/Paolo-Burns/Google-Data-Analytics-Portfolio-Project/blob/main/03.%20Data%20Cleaning.sql)

After exploring the data I have a good idea of what needs to be cleaned up. For this project I will be dealing with NULL values by entirely removing any rows with NULL values. 

To create the new cleaned table that will be used for analysis:

1) 2 new columns are added to the select statement, day_of_week and month.
2) A 3rd column, ride_length, is added through a JOIN with a SELECT statement that converts the difference in ended_at and started_at times into minutes.
3) Rows containing NULL values are removed.
4) Finally, any rows that have rides shorter than 1 minute or longer than a day are also removed resulting in a total of 4,168,157 rows indicating that 1,692,411 total rows were removed in the cleaning process.


## Data Analysis
SQL Query: [Data Analysis](https://github.com/Paolo-Burns/Google-Data-Analytics-Portfolio-Project/blob/main/04.%20Data%20Analysis.sql)

![Screenshot 2025-06-27 175448](https://github.com/user-attachments/assets/ceb9d9e5-6b5e-46c4-a84d-571cf4cf5353)

Classic Bikes are by far the most popular bike type making up 65.12% of total number of trips in 2024 while Electric scooters are by far the least popular with only 1.13%.

Now let's see *who* is using which bikes:

![Screenshot 2025-06-27 175410](https://github.com/user-attachments/assets/e462f4d9-1059-4bd7-b6e2-5272d64fa4fb)

Across all bike types, there is a pretty even split between members and casuals, with members making up over half of classic and electric bike users. We can observe that there is no preference in bike type depending on the whether the rider is an annual member or casual rider. 

The total number of trips in 2024:
Per Month

![tripspermonth](https://github.com/user-attachments/assets/a4589ad3-6581-40fb-8cfa-6ff87c0925eb)

Both members and casuals follow a similar seasonal pattern throughout the year in which the total number of trips for both members and casual begins to rise in the spring. For casual riders the peak of their trips occurs in the summer while members peak in the early fall. After their respective peaks, both group's trip amounts decline as winter months approach. 

Per Hour

![tripsperhour](https://github.com/user-attachments/assets/4d8304d2-cb87-4a54-bf11-8bd5d5dfc035)

