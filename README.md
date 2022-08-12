# Portfolio: Cyclistic Bike-Share Case Study
This is the final project for the Google Data Analytics Certificate. To view the dashboard, please see here: https://public.tableau.com/app/profile/jean.hwang/viz/CyclisticBike-ShareCaseSnapshot/Cyclistic

## Background

Cyclistic is a bike-share company. In 2016, Cyclistic launched a successful bike-share program that features more than 5,800 bicycles and 600 docking stations in Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. To develop a cycling-friendly city for everyone in Chicago, Cyclistic not only offers standard two-wheeled bikes but also reclining bikes, hand tricycles, and cargo bikes. It makes bike-share more inclusive to people with disabilities and sets itself apart from the competition.

## Objectives

Cyclistic's finance analysts have concluded that customers who purchase annual membership are more profitable than those who purchase single-ride or full-day passes. Therefore, Cyclistic's goal is to design marketing strategies to convert casual riders into annual members. 

There are three questions to achieve the goal. 

+ How do annual members and casual riders use Cyclistic bikes differently?
+ Why would casual riders buy Cyclistic annual memberships?
+ How can Cyclistic use digital media to influence casual riders to become members? 

## About Dataset 

### Context 
The dataset contains the historical Cyclistic's historical trip data from June 1, 2022 to June 30, 2022. 

Based on the data-privacy issues, only some public Cyclistic's historical trip data can be used to explore how annual members and casual riders use Cyclistic bikes differently. Therefore, this project only focuses on answering the first question: how do annual members and casual riders use Cyclistic bikes differently?

### Content  
It contains 769,204 users across 13 variables.

Tabular data includes: 
+ ride_id: A combination of letters and numbers. The Length of ride_id is 16. 
+ rideable_type: The types of bicycles, including electric bike, classic bike, and docked bike.  	
+ started_at: The day and time to start using Cyclistic (YYYY-MM-DD HH:MM:SS).
+ ended_at: The day and time to stop using Cyclistic (YYYY-MM-DD HH:MM:SS).
+ start_station_name: The name of the start station. 
+ start_station_id: The ID of the start station to start can be (1) all numbers, (2) a combination of letters and numbers, or (3) a combination of all numbers, letters, and a special character. 
+ end_station_name: The name of the end station.
+ end_station_id: The ID of the end station can be (1) all numbers, (2) a combination of letters and numbers, or (3) a combination of all numbers, letters, and a special character. 
+ start_lat: Latitude of the start station. 
+ start_lng: Longitude of the start station. 
+ end_lat: Latitude of the end station. 
+ end_lng: Longitude of the end station.
+ member_casual: The type of users, either annual members or casual riders. 

## Data Cleaning and Data Manipulation

This dataset is already very well formatted. There is no duplicate data or irrelevant data. However, there were12 data that start_at was longer than end_at, which should be the opposite. Therefore, I flipped those data and updated the table so that start_at can be shorter than end_at to calculate the correct ride length. Also, 54 users have the same started_at and ended_at, and it might be a red flag. I still keep them in the dataset because it is a small number of users (compared to the 769,204 users).  

## Findings

+ In June 2022, 47% of Cyclistic users are casual riders and 52% of users are annual members. 
+ Not surprisingly, the average ride length of casual riders is much longer than annual members (32 min vs.14 min).   
+ More than half of Cyclistic users (53%) choose to ride classic bikes, and 43% of Cyclistic users ride electric bikes. 
+ However, annual members are more likely to ride classic bikes than casual riders (31% vs. 22%). About 1 in 5 in both groups ride electric bikes. Additionally, docked bikes are the least favorable bike in both groups. Only 4% of casual riders ride docked bikes and none of the annual members ride docked bikes this month.
+ Casual riders love using Cyclistic on weekends, but not for annual members (Sunday: 18% vs.12%, Saturday: 18% vs. 12%). 
+ Annual members do not heavily use Cyclistic on weekends. Instead, Thursday (18%) and Wednesday (17%) are popular days for them.        
+ The top 5 start and end locations for causal riders are around the Illinois Coast of Lake Michigan. The top 1 start and end locations for casual riders are Streeter Dr & Grand Ave. 
+ Compared to casual riders, annual members tend to use Cyclistic in the downtown area. The top 1 start and end location for them is DuSable Lake Shore Dr & North Blvd station. 

## Summary 

+ In general, casual riders and annual members use Cyclistic for different purposes – the former is for leisure purposes and the latter is for commuting purposes. 
+ Specifically, casual riders tend to love riding bikes on weekends along with the Illinois Coast of Lake Michigan, and the average riding length is 2x more than annual members (32.09 min vs. 13.99 min). Even though casual riders are open to any type of bike, the docked bike is the least favorable type for them.  
+ Compared to casual riders, annual members tend to ride bikes on weekdays, and the most popular days are Thursday (#1) and Wednesday (#2). Unlike casual riders, annual members not only ride bikes along with the Illinois Coast of Lake Michigan but also in the downtown area. For commuting purposes, the classic bike (31%) is the most popular bike for annual members, followed by an electric bike (21%). 
+ Based on the analysis in terms of the top 5 popular locations to use Cyclistic, about 10% of total Cyclistic users ride bikes in the listed stations. It shows that the mobility of Cyclistic is one of the factors in attracting Cyclistic users.

## Recommendations

The frequency of using Cyclistic is key to defining whether a user wants to become an annual member of Cyclistic. Even though annual members have a shorter ride length than casual members, they ride bikes more frequently from Monday to Thursday (61%) than casual members (50%). Therefore, the marketing team should design a marketing strategy to attract casual riders to use Cyclistic on weekdays.   

## Future Exploration 
+ It would be great to trend data in the future to see the monthly changes or yearly changes. For example, casual riders might be increased during the tourist season.
+ It would be great to conduct statistical testing to see the differences between two groups. 


