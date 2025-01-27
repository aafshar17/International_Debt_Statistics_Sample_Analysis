**Step 5**: **Find the Country with the Highest Debt**

The previous result provides the total of the debt amounts owed by the 124 countries in this dataset
across the different categories. 

Find out which country owns the highest amount of this total debt along with the listed debt amount.  

```sql
SELECT country_name, round((SUM(debt)/1000000)::numeric, 2) AS total_debt
FROM international_debt_statistics_summary
group by country_name
ORDER BY total_debt DESC
LIMIT 1;
```

![Step 5 Result](/Step_5_result.jpg)
