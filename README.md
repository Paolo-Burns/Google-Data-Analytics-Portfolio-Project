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
In this data



