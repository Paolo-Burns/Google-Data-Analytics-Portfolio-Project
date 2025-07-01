# Google-Data-Analytics-Portfolio-Project

## Introduction

#### 
For this project, I am a junior data analyst working on the marketing analyst team at Cyclistic, a a fictional bike-share company in Chicago. I will be performing tasks that help the company answer business questions using the data provided. The data provided is actually data from a company called Divvy, however for the purpose of this project, the data will help answer Cyclistic's business questions. 

## Background

Cyclistic is a bike-share program  with over 5,824 geo-tracked bicycles that are part of a large network of 692 stations across Chicago. Users are able to pick up a bike from any station and then return it to any other station. Cyclistic's current marketing strategy relies on general awareness and appealing to broad consumer segments. Cyclistic achieved this by offering various pricing plans, such as single-ride passes, full-day passes, or annual memberships. 

Cyclistic has recently taken note that annual members are much more profitable than casual users who purchase single ride or full day passes. Moreno, the director of marketing, believes that maximizing the number of annual members is the key to future growth. 

## Scenario

Moreno's goal is to design marketing strategies aimed at converting casual riders into annual members. 

Moreno has asked three main questions that will guide the future marketing program:

1. How do annual member and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

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

Exploration Summary:

- 5,860,568 total rows

- Only 3 distinct values exist for the rideable_type meaning that Cyclistic only offers these 3 bike types in their bike-sharing program: 
Classic Bikes, Electric Bikes, and Electric Scooters.

- In the member_casual column, only 2 distinct values exist: member & casual.

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

The following chart shows the popularity of each bike type among Cyclistic users.

![Screenshot 2025-06-27 175448](https://github.com/user-attachments/assets/ceb9d9e5-6b5e-46c4-a84d-571cf4cf5353)

Classic Bikes are by far the most popular bike type making up 65.12% of total number of trips in 2024 while Electric scooters are by far the least popular with only 1.13%.

Now let's see *who* is using which bikes:

![Screenshot 2025-06-27 175410](https://github.com/user-attachments/assets/e462f4d9-1059-4bd7-b6e2-5272d64fa4fb)

Across all bike types, there is a pretty even split between members and casuals, with members making up over half of classic and electric bike users. It is observed that there is no preference in bike type depending on whether the rider is an annual member or casual rider. 

The total number of trips in 2024:


![tripspermonth](https://github.com/user-attachments/assets/a4589ad3-6581-40fb-8cfa-6ff87c0925eb)

Both members and casuals follow a similar seasonal pattern throughout the year in which the total number of trips for both members and casual riders begins to rise in the spring. For casual riders the peak of their trips occurs in the summer while members peak in the early fall. After their respective peaks, both group's trip amounts decline as winter months approach. 



![tripsperhour](https://github.com/user-attachments/assets/4d8304d2-cb87-4a54-bf11-8bd5d5dfc035)

Here, the largest difference in behavior between the 2 groups thus far can be observed. Starting at around 6 AM member's total amount of trips begin to quickly increase, peaking at 8 AM. As the day progresses, both groups continue to steadily incline until about 5 PM where members hit another large spike, 5 PM represents the peak hour for total trips for both members and casual riders. After 5 PM there is a rapid decline for both groups. 

The observations above lead to a couple inferences:

1) Cyclistic's bike share program is much more popular in the spring, summer, and early fall when the weather is nice and warm.
2) Members use Cyclistic the most during commute hours 8AM/5PM, perhaps to commute to and from work.

Next, the average ride length was analyzed

![lenpermonth](https://github.com/user-attachments/assets/a51c02f9-6e49-4ac7-8d94-a27a7f68f070)

![lenperday](https://github.com/user-attachments/assets/e3d36b4a-53c5-45f9-a2a7-f984cf10efd6)


![lenperhour](https://github.com/user-attachments/assets/fbc6b053-fe4c-47a0-aa4b-00ad40756f7b)

Annual members show a consistent 10-15 minutes average ride length in all 3 graphs while casual riders see a bit more fluctuation in ride length. Casual rider's bike trips typically last 20-30 minutes double that of member's trips in some cases.

Regardless of what month, day, or hour it may be, casual riders have a higher average ride length than members, double in most cases.

This could be for a handful of reasons:
1) If annual members are using Cyclistic primarily to commute to and from work, then they must be close by (within 10-15 minutes). Anybody who is farther than 20 minutes probably uses a car to get to work, and anybody who lives closer than a 10 minute bike ride might walk to work.
2) Casual Members ride length shoots up at around 10 AM and remains at nearly 30 minutes until 2 PM. This is typically the best weather during the day and when most people might be using a bike leisurely.
3) The absence of a second spike in ride length later on in the day (to get home from work) for casual riders strengthens the idea that casual riders are not using Cyclistic to get to work.

This data supports the previous hypothesis of annual members using Cyclistic for daily job commute while casual riders use Cyclistic for pleasure and recreational purposes.

The following visualizations show which bike stations were used most frequently by Cyclistic users.

![startinglocations](https://github.com/user-attachments/assets/268c7b98-d4b8-4328-b61f-1fc473f736ef)

- Casual riders start their rides more frequently along the coast where a large concentration of Chicago's parks are as well as the beaches and piers.
- Annual members start their bike trips deeper in Chicago's business districts.
- Note the point at the University of Illinois at Chicago. This indicates that annual memberships might be popular with students and/or university professors & staff.
  
![ending locations](https://github.com/user-attachments/assets/206981b7-e523-44e6-b14d-2360a6da957a)

- The ending station frequencies tell a similar story.
- Note the 2 southern points for members in both charts. These points represent stations that are adjacent to the University of Chicago Bookstore, University of Chicago Main Quadrangle, University of Chicago School of Law, and an ancient cultures museum.

  Analysis Summary:

  |Casual|Member|
  |:------:|:------:|
  | Takes longer rides on average, with the longest rides being around noon. | Shorter rides on average, very consistent ride length indicating that their journey does not typically change. |
  | Total number of rides peak during mid summer. | Total number of rides peak in the early fall. |
  | Rides gradually increase throughout the day | Rides spike at 8AM/5PM indicating, common work commuting hours. |
  | Trips start and end near beaches, piers, and parks. | Trips start and end deeper in the city of Chicago near businesses and restaurants. |
  
## Recommendations

After analyzing how members and casual riders differ, I have a few recommendations that might help in the overall objective: converting casual riders to the more profitable members.

1. Offer rewards for members who take rides longer than 30 minutes.
2. Increase promotion during the warmer months (late spring, summer, and early fall).
3. A cheaper membership option where these members can only access the popular stations near the parks, beaches, and other leisure areas with their membership.
4. A seasonal membership option can also be utilized (e.g. a summer pass)




