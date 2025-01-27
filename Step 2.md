**Step 2**: **Find number of distinct countries in dataset**

The previous result only showed the amount of debt owed by Afghanistan across the various debt indicatiors. 
We want to know the number of different countries that are present in this dataset.

Find out the number of unique countries present in the table by using the SELECT DISTINCT statement to return only 
distinct(different) values for the country_name column. 

```sql
select * from international_debt_statistics_summary;
select count(distinct(country_name)) as Total_Distinct_Countries 
from international_debt_statistics_summary;
```

![Step 2 Result](/Step_2_result.jpg)
