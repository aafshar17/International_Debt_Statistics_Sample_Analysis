**Step 9**: **See the bigger picture**

The previous result shows that there are 6 debt indicators for which all of the countries in this dataset have
incurred debt. This is important since it highlights that these countries are likely suffering from a common economic
malady. There is more to uncover but this is a great starting point.  

Lastly, it would provide further context to find the maximum amount of debt 
across the indicators along with the respective country names. This is one possible way to 
identify other economic issues in the different countries. 

```sql
SELECT country_name, indicator_name, max(debt) AS max_debt
FROM international_debt_statistics_summary
group by country_name, indicator_name
ORDER BY max_debt DESC
LIMIT 20;
```

![Step 9 Result](/Step_9_result.jpg)
