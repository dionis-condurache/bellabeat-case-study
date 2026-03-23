# Bellabeat Case Study (Google Data Analytics Project)

## 1. Business Task
Analyze smart device usage data to identify trends and provide actionable marketing recommendations for Bellabeat, a wellness-focused technology company.

---

## 2. Data Source
- Fitbit Fitness Tracker dataset (Kaggle)
- ~30 users
- ~1 month of data

**Limitations:**
- Small sample size
- Short time period
- No demographic information available

---

## 3. Tools Used
- Google BigQuery (SQL)
- Google Sheets (data cleaning)

---

## 4. Data Cleaning & Preparation
- Converted date fields to proper DATE format
- Removed inconsistencies in datetime fields
- Created clean tables for analysis
- Merged activity and sleep datasets using INNER JOIN

---

## 5. Analysis & Key Insights

### Activity & Calories
- Strong positive correlation between daily steps and calories burned
- Relationship is not perfectly linear, suggesting activity intensity matters

### Weekly Behavior Patterns
- Highest activity observed on Saturday
- Lowest activity observed on Sunday
- Peak sedentary behavior occurs on Thursday (midweek fatigue pattern)

### User Segmentation
- Majority of users fall into the moderate activity group
- High activity users show significantly higher intensity levels (~3x vs average, ~20x vs low activity)

### Sleep & Activity
- Higher activity levels do not necessarily correlate with longer sleep duration
- Suggests sleep quality and lifestyle factors play a significant role

---

## 6. Recommendations

- Target moderate activity users to increase engagement and move them toward higher activity levels
- Introduce weekend challenges to maintain engagement consistency
- Implement Thursday-based reminders or light activity suggestions to reduce sedentary behavior
- Promote intensity-based activities rather than focusing only on step count
- Encourage balanced routines combining activity and recovery

---

## 7. Conclusion
This analysis highlights key behavioral trends in user activity and sleep patterns, providing actionable insights that can help Bellabeat improve user engagement and marketing strategy.
