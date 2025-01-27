**Step 3**: ** Identify the distinct debt indicators**

The previous result indicates that there are a total of 124 countries present in this dataset. 

Now let's pivot to the column called indicator_name which gives a slight idea of the purpose for the country
incurring the debt. Next to it, the column indicator_code represents the category of these incurred debts. 

Understanding these different debt indicators can help provide context for the areas in which a country may be indebted.

```sql
select distinct(indicator_code) as debt_indicators
from international_debt_statistics_summary
group by debt_indicators
order by debt_indicators;
```

![Step 3 Result](/Step_3_result.jpg)
