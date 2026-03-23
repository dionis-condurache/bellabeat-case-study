-- ============================================
-- BELLABEAT CASE STUDY - SQL ANALYSIS
-- ============================================


-- ============================================
-- 1. DATA CLEANING
-- ============================================

-- Clean sleep data (remove time component)
CREATE OR REPLACE TABLE `bellabeat-analysis.bellabeat_data.sleep_day_clean` AS
SELECT
  Id,
  DATE(SleepDay) AS Date,
  TotalSleepRecords,
  TotalMinutesAsleep,
  TotalTimeInBed
FROM `bellabeat-analysis.bellabeat_data.sleep_day`;


-- Clean daily activity data (standardize date format)
CREATE OR REPLACE TABLE `bellabeat-analysis.bellabeat_data.daily_activity_clean` AS
SELECT
  Id,
  DATE(ActivityDate) AS Date,
  TotalSteps,
  TotalDistance,
  Calories,
  VeryActiveMinutes,
  FairlyActiveMinutes,
  LightlyActiveMinutes,
  SedentaryMinutes
FROM `bellabeat-analysis.bellabeat_data.daily_activity`;


-- ============================================
-- 2. DATA MERGING
-- ============================================

-- Combine activity and sleep data
CREATE OR REPLACE TABLE `bellabeat-analysis.bellabeat_data.activity_sleep` AS
SELECT
  a.Id,
  a.Date,
  a.TotalSteps,
  a.Calories,
  a.VeryActiveMinutes,
  a.SedentaryMinutes,
  s.TotalMinutesAsleep,
  s.TotalTimeInBed
FROM `bellabeat-analysis.bellabeat_data.daily_activity_clean` a
INNER JOIN `bellabeat-analysis.bellabeat_data.sleep_day_clean` s
ON a.Id = s.Id
AND a.Date = s.Date;


-- ============================================
-- 3. ANALYSIS
-- ============================================

-- Activity vs Calories relationship
SELECT
  TotalSteps,
  Calories
FROM `bellabeat-analysis.bellabeat_data.activity_sleep`
WHERE TotalSteps IS NOT NULL
AND Calories IS NOT NULL;


-- Steps grouped vs average calories
SELECT
  ROUND(TotalSteps, -3) AS Steps_Group,
  AVG(Calories) AS Avg_Calories
FROM `bellabeat-analysis.bellabeat_data.activity_sleep`
GROUP BY Steps_Group
ORDER BY Steps_Group;


-- Daily activity trends
SELECT
  FORMAT_DATE('%A', Date) AS DayOfWeek,
  AVG(TotalSteps) AS AvgSteps,
  AVG(Calories) AS AvgCalories
FROM `bellabeat-analysis.bellabeat_data.daily_activity_clean`
GROUP BY DayOfWeek
ORDER BY AvgSteps DESC;


-- Sedentary behavior by day
SELECT
  FORMAT_DATE('%A', Date) AS DayOfWeek,
  AVG(SedentaryMinutes) AS AvgSedentary
FROM `bellabeat-analysis.bellabeat_data.daily_activity_clean`
GROUP BY DayOfWeek
ORDER BY AvgSedentary DESC;


-- User segmentation by activity level
SELECT
  CASE
    WHEN TotalSteps < 5000 THEN 'Low Activity'
    WHEN TotalSteps BETWEEN 5000 AND 10000 THEN 'Moderate Activity'
    ELSE 'High Activity'
  END AS ActivityLevel,
  COUNT(*) AS UserCount,
  AVG(Calories) AS AvgCalories,
  AVG(SedentaryMinutes) AS AvgSedentary
FROM `bellabeat-analysis.bellabeat_data.daily_activity_clean`
GROUP BY ActivityLevel
ORDER BY UserCount DESC;


-- Activity intensity comparison
SELECT
  CASE
    WHEN TotalSteps < 5000 THEN 'Low Activity'
    WHEN TotalSteps BETWEEN 5000 AND 10000 THEN 'Moderate Activity'
    ELSE 'High Activity'
  END AS ActivityLevel,
  AVG(VeryActiveMinutes) AS AvgVeryActive,
  AVG(SedentaryMinutes) AS AvgSedentary
FROM `bellabeat-analysis.bellabeat_data.daily_activity_clean`
GROUP BY ActivityLevel
ORDER BY AvgVeryActive DESC;


-- Sleep vs activity level
SELECT
  CASE
    WHEN TotalSteps < 5000 THEN 'Low Activity'
    WHEN TotalSteps BETWEEN 5000 AND 10000 THEN 'Moderate Activity'
    ELSE 'High Activity'
  END AS ActivityLevel,
  AVG(TotalMinutesAsleep) AS AvgSleep
FROM `bellabeat-analysis.bellabeat_data.activity_sleep`
GROUP BY ActivityLevel
ORDER BY AvgSleep DESC;
