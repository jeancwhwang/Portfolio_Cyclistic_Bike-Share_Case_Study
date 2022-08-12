/*Member vs. Casual*/

SELECT  rideable_type,
	member_casual,
	count(*),
	count(*)*100/(SELECT count(*) FROM cyclistic) as 'Pct%'
FROM cyclistic
GROUP BY 1,2
ORDER BY 4 DESC;

/* Ride Length Stats (AVG) -  Member vs. Casual*/

SELECT  member_casual,
	AVG(Cast((JulianDay(ended_at) - JulianDay(started_at))*24*60*60 as INTEGER)) as seconds_diff
FROM cyclistic
GROUP BY 1;

/* Ride Length Stats MAX OR MIN  -  Member vs. Casual*/

SELECT  member_casual,
	MAX(Cast((JulianDay(ended_at) - JulianDay(started_at))*24*60*60 as INTEGER)) as MAX_seconds_diff,
	MIN(Cast((JulianDay(ended_at) - JulianDay(started_at))*24*60*60 as INTEGER)) as MIN_seconds_diff
FROM cyclistic
GROUP BY 1;

/* TOP 5 popular start_coordinates - Casual*/

SELECT  member_casual,
	start_coordinates,
	start_lat,
	start_lng,
	start_station_name,
	count(*)
FROM Coordinates
GROUP BY 1,2,3,4
HAVING member_casual = 'casual'
ORDER BY 6 DESC
LIMIT 5;

/* TOP 5 popular start_coordinates - Member*/

SELECT	member_casual,
	start_coordinates,
	start_lat,
	start_lng,
	start_station_name,
	count(*)
FROM Coordinates
GROUP BY 1,2,3,4
HAVING member_casual = 'member'
ORDER BY 6 DESC
LIMIT 5;

/* TOP 5 popular end_coordinates - Casual*/

SELECT	member_casual,
	end_coordinates,
	end_lat,
	end_lng,
	end_station_name,
	count(*)
FROM Coordinates
GROUP BY 1,2,3,4
HAVING member_casual = 'casual'
ORDER BY 6 DESC
LIMIT 5;

/* TOP 5 popular end_coordinates - Member*/

SELECT	member_casual,
	end_coordinates,
	end_lat,
	end_lng,
	end_station_name,
	count(*)
FROM Coordinates
GROUP BY 1,2,3,4
HAVING member_casual = 'member'
ORDER BY 6 DESC
LIMIT 5;

/* Mode of start day_of_week - Member vs. Casual*/

CREATE TEMP TABLE member_casual_dow AS
SELECT	*,
	case when strftime('%w', started_at) = '0' then '7' else strftime('%w', started_at) end as started_at_dow,
	substr('SunMonTueWedThuFriSat', 1 + 3*strftime('%w', started_at), 3) as started_dow_text
FROM cyclistic

SELECT	member_casual,
	started_at_dow,
	started_dow_text,
	COUNT(*)
FROM member_casual_dow
GROUP BY 1,2,3
ORDER BY 4 DESC;

/*Appendix/*  
/*Total Users*/

SELECT  member_casual,
	count(*),
	count(*)*100/(SELECT count(*) FROM cyclistic) as 'Pct%'
FROM cyclistic
GROUP BY 1;

/*Rideable_Type - Total Users*/ 

SELECT  rideable_type,
	count(*),
	count(*)*100/(SELECT count(*) FROM cyclistic) as 'Pct%'
FROM cyclistic
GROUP BY 1
ORDER BY 3 DESC;

/* Ride Length Stats - Total Users*/

SELECT
	AVG(seconds_diff) as AVG_ride_length_seconds,
	Max(seconds_diff) as MAX_ride_length_seconds,
	MIN(seconds_diff) as MIN_ride_length_seconds
FROM ride_length;

/* TOP 5 popular start_coordinates - Total Users*/

SELECT
	start_coordinates,
	count(*)
FROM Coordinates
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

/* TOP 5 popular End_coordinates - Total Users*/

SELECT	end_coordinates,
	count(*)
FROM Coordinates
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

/* Mode of start day_of_week - Total Users*/

SELECT	started_at_dow,
	started_dow_text,
	COUNT(*)
FROM ride_length
GROUP BY 1,2; 

