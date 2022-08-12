-- Create table for SQLite

CREATE TABLE "cyclistic" (
	"ride_id"	TEXT,
	"rideable_type"	TEXT,
	"started_at"	TEXT,
	"ended_at"	TEXT,
	"start_station_name"	TEXT,
	"start_station_id"	TEXT,
	"end_station_name"	TEXT,
	"end_station_id"	TEXT,
	"start_lat"	REAL,
	"start_lng"	REAL,
	"end_lat"	REAL,
	"end_lng"	REAL,
	"member_casual"	TEXT
);

-- Total counts = 769204

SELECT COUNT(*)
FROM cyclistic;

-- Check ride_id length --  All length(ride_id) = 16
SELECT length(ride_id),
	   COUNT(*)
FROM cyclistic
GROUP BY 1;

-- ALL ride_id is unique
SELECT
	  ride_id,
	 COUNT(*)
FROM cyclistic
GROUP BY 1
HAVING COUNT(*)> 0;

-- No duplicates
WITH Row_num_cte AS (
SELECT *,
		ROW_NUMBER() OVER(PARTITION BY ride_id,
									rideable_type,
									started_at,
									ended_at
						   ORDER BY ride_id) AS RowNum
FROM cyclistic
)
SELECT RowNum
FROM row_num_cte
WHERE RowNum > 1;


-- 12 reversed data for started_at & ended_at
SELECT
		julianday(ended_at)-julianday(started_at) as julianday_diff
FROM cyclistic
WHERE julianday(ended_at)-julianday(started_at) < 0;


-- Flip started_at & ended_at and update table

UPDATE cyclistic
SET	started_at = replace(started_at,started_at,ended_at),
	  ended_at = replace(ended_at,ended_at,started_at)
WHERE started_at > ended_at;

-- FLAG: 54 people have the same started_at and ended_at. Might need to delete from the dataset
SELECT
		distinct member_casual,
		COUNT(julianday(ended_at)-julianday(started_at)) as julianday_diff
FROM cyclistic
WHERE julianday(ended_at)-julianday(started_at) = 0
GROUP BY 1;



-- rideable_type: no nulls, 3 variables
-- Get percentages of each rideable_type

SELECT
	  DISTINCT rideable_type,
	  count(*),
	  (select count(*) from cyclistic) as total,
	  count(*)*100/ (select count(*) from cyclistic) as 'pct%'
FROM cyclistic
GROUP BY 1
ORDER BY 4 DESC;

-- Create View Ride_Time for future analysis for ride length

CREATE VIEW Ride_Length
AS
SELECT
	ended_at,
	started_at,
	julianday(ended_at)-julianday(started_at) as julianday_diff,
	Cast((JulianDay(ended_at) - JulianDay(started_at)) as INTEGER) as days_diff,
	Cast((JulianDay(ended_at) - JulianDay(started_at))*24 as INTEGER) as hours_diff,
	Cast((JulianDay(ended_at) - JulianDay(started_at))*24*60 as INTEGER) as minutes_diff,
	Cast((JulianDay(ended_at) - JulianDay(started_at))*24*60*60 as INTEGER) as seconds_diff,
	case when strftime('%w', started_at) = '0' then '7' else strftime('%w', started_at) end as started_at_dow,
	substr('SunMonTueWedThuFriSat', 1 + 3*strftime('%w', started_at), 3) as started_dow_text
FROM cyclistic;

-- Get counts of day_of_week
SELECT
		distinct day_of_week,
		count(*)
FROM Ride_Time
GROUP BY 1;

-- Start_coordinates counts (most popular start location)
SELECT
		start_lat||' '|| start_lng AS start_coordinates,
		COUNT(*),
		(SELECT COUNT(*) FROM cyclistic) AS Total,
		COUNT(*)*100/(SELECT COUNT(*) FROM cyclistic) AS Pct_start_coordinates
FROM cyclistic
GROUP BY 1
ORDER BY 2 DESC;

-- End_coordinates counts (most popular end location)
SELECT
		end_lat||' '|| end_lng AS end_coordinates,
		COUNT(*),
		(SELECT COUNT(*) FROM cyclistic) AS Total,
		COUNT(*)*100/(SELECT COUNT(*) FROM cyclistic) AS Pct_start_coordinates
FROM cyclistic
GROUP BY 1
ORDER BY 2 DESC;


-- Create View for Coordinates
CREATE VIEW Coordinates
AS
SELECT *,
		start_lat||' '|| start_lng AS start_coordinates,
		end_lat||' '|| end_lng AS end_coordinates
FROM cyclistic;
