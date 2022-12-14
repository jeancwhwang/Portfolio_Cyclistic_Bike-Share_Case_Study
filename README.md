# Portfolio: Cyclistic Bike-Share Case Study
To view the Tableau dashboard, please see [Cyclistic Bike-Share Snapshot](https://public.tableau.com/app/profile/jean.hwang/viz/CyclisticBike-ShareCaseSnapshot/Cyclistic)

## Key Takeaways

+ A bike-share company Cyclistic wants to understand how annual members, who purchase annual membership, and casual riders, who purchase single-ride or full-day passes, use Cyclistic bikes differently so that the marketing team can design marketing strategies to convert casual riders into annual members.
+ The results show that casual riders use Cyclistic for leisure purposes whereas annual members are for commuting purposes. Casual riders tend to ride along the Illinois Coast of Lake Michigan on weekends. However, annual members tend to use Cyclistic on weekdays and ride bikes across downtown Chicago. 
+ Even though annual members have a shorter ride length (14 min) than casual members (32 min), they ride bikes more frequently from Monday to Thursday (61%) than casual members (50%). Also, for both groups, rush hour is between 4 am – 6 am, and the most popular time is 5 pm. 
+ Therefore, the marketing team should design marketing strategies to promote Cyclistic to casual riders during rush hour 4 pm – 6 pm on weekdays to increase their motivation to ride bikes on weekdays.  
+ Furthermore, Cyclistic should prepare enough bikes at the most popular start and end locations on weekend afternoons and evenings to attract more people to become casual users. Cyclistic should make riding bikes easy for them to get on the bikes in order to increase revenue. It might be a way to make them get into the habit of cycling. 


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
The dataset contains [the Cyclistic's historical trip data](https://divvy-tripdata.s3.amazonaws.com/index.html) from June 1, 2022 to June 30, 2022. 

Based on the data-privacy issues, only some public Cyclistic's historical trip data can be used to explore how annual members and casual riders use Cyclistic bikes differently. Therefore, this project only focuses on answering the first question: how do annual members and casual riders use Cyclistic bikes differently? Then, providing some recommendations based on the findings.

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
+ member_casual: The user types, either annual members or casual riders. 

## Data Cleaning, Data Manipulation, and Data Exploration

This dataset was already very well formatted, and I used SQL to clean the dataset. There was no duplicate data or irrelevant data. However, there were 12 data that start_at was longer than end_at, which should be the opposite. Therefore, I flipped those data and updated the table so that start_at can be shorter than end_at to calculate the correct ride length. Also, 54 users have the same started_at and ended_at, and it might be a red flag. I still keep them in the dataset because it is a small number of users (compared to the 769,204 users).  

For more details, please see [the data cleaning, data manipulation, and data exploration file](https://github.com/jeancwhwang/Portfolio_Cyclistic/blob/main/cyclistic_data_exploration.sql)　

## Data Analysis

I used SQL to conduct descriptive analysis to understand the counts and percentages of the user type, rideable type, popular days to use Cyclistic, popular times, and the top 5 start and end locations. To do that, I created three views to run some calculations. The first view was to understand the ride length, such as the average ride length, and day of the week. The second view was to get a better sense of the locations, such as the top 5 start and end stations. The third view was to extract hours from the start date & time.    

For more details, please see [the data analysis file](https://github.com/jeancwhwang/Portfolio_Cyclistic/blob/main/cyclistic_data_analysis_member_casual.sql)　

### Chi-Squared Goodness-of-Fit Test

Also, I used Python to run the Chi-Squared goodness-of-fit test to evaluate whether a categorical variable is likely to come from a specified distribution or not. In this dataset, the day to use Cyclistic, time to use Cyclistic, and the rideable type are categorical variables. Therefore, I run a Chi-Squared goodness-of-fit test for these categorical variables by different rider types (either casual or member) at a 5% percent significant level. 

The null hypothesis for these categorical variables is that a categorical variable fits a uniform distribution (equal frequencies), and the alternative hypothesis is that a categorical variable does not fit a uniform distribution (unequal frequencies.). After analyzing the data, all results show that the variation is significant to reject the null hypothesis, which means the differences across the counts are meaningful. For example, for casual riders, the count for Sunday is 65,851 and the count for Monday is 37,005. Based on the Chi-Square test, casual riders ride Cyclistic bikes more often on Sunday than Monday.

For more details, please see [the Chi-Squared test file](https://github.com/jeancwhwang/Portfolio_Cyclistic/blob/main/Cyclistic_ChiSquare.ipynb)

## Findings

+ In June 2022, 47% of Cyclistic users are casual riders and 52% of users are annual members. 
+ Not surprisingly, the average ride length of casual riders is much longer than annual members (32 min vs.14 min).   
+ More than half of Cyclistic users (53%) choose to ride classic bikes, and 43% of Cyclistic users ride electric bikes. 
+ However, annual members are more likely to ride classic bikes than casual riders (31% vs. 22%). About 1 in 5 in both groups ride electric bikes. Additionally, docked bikes are the least favorable bike in both groups. Only 4% of casual riders ride docked bikes and none of the annual members ride docked bikes this month.
+ Casual riders love using Cyclistic on weekends, but not for annual members (Sunday: 18% vs.12%, Saturday: 18% vs. 12%). 
+ Annual members do not heavily use Cyclistic on weekends. Instead, Thursday (18%) and Wednesday (17%) are popular days for them.        
+ For both groups, rush hour is between 4 pm – 6 pm, and 5 pm is the best time for Cyclistic users to ride bikes. However, annual members are more likely to ride bikes between 6 am and 8 am than casual riders. 
+ The top 5 start and end locations for causal riders are around the Illinois Coast of Lake Michigan. The top 1 start and end locations for casual riders are Streeter Dr & Grand Ave. 
+ Compared to casual riders, annual members tend to use Cyclistic in the downtown area. The top 1 start and end locations for them are DuSable Lake Shore Dr & North Blvd station. 

## Summary 

+ In general, casual riders and annual members use Cyclistic for different purposes – the former is for leisure purposes and the latter is for commuting purposes. 
+ Specifically, casual riders tend to love riding bikes along the Illinois Coast of Lake Michigan on weekends, and the average riding length is 2x more than annual members (32 min vs. 14 min). Even though casual riders are open to any type of bike, the docked bike is the least favorable type for them.  
+ Compared to casual riders, annual members tend to ride bikes on weekdays, and the most popular days are Thursday (#1) and Wednesday (#2). Unlike casual riders, annual members not only ride bikes along the Illinois Coast of Lake Michigan but also in the downtown area. For commuting purposes, the classic bike (31%) is the most popular bike for annual members, followed by an electric bike (21%). 
+ Rush hour for both groups is between 4 am – 6 am, and the most popular time is 5 pm. Compared to casual users, annual members ride bikes more often between 6 am  –  8 am.
+ The frequency of using Cyclistic is key to defining whether a user wants to become an annual member of Cyclistic. Even though annual members have a shorter ride length than casual members, they ride bikes more frequently from Monday to Thursday (61%) than casual members (50%).
+ Based on the analysis in terms of the top 5 popular locations to use Cyclistic, about 10% of total Cyclistic users ride bikes in the listed stations. It shows that the mobility of Cyclistic is one of the factors in attracting Cyclistic users.

## Recommendations

Therefore, the marketing team should design marketing strategies to promote Cyclistic to casual riders during rush hour 4 pm – 6 pm on weekdays. It may be a good way to increase casual riders’ intention to ride bikes on weekdays. 

Additionally, Cyclistic should prepare enough bikes at the most popular start and end locations on weekend afternoons and evenings. Even though casual riders might not be converted into annual members, Cyclistic could make riding bikes easy for them to get on the bikes to increase revenue. It might be a way to make them get into the habit of cycling.

## Future Exploration 
+ It would be great to trend data in the future to see the monthly changes or yearly changes. For example, casual riders might be increased during the tourist season.
+ If possible, getting more user personal data, such a gender, age, address, the frequency of Cyclistic bike use, and spending history, would be extremely helpful to tailor marketing strategies.
+ Based on the data-privacy issues, the price for annual membership, single-ride pass, and full-day pass is unknown, which is challenging to create the right pricing strategy. Therefore, It would be great to conduct a thorough market pricing analysis, such as the Van Westendrop analysis, to determine a range of acceptable prices and an optimal price point for casual members.


