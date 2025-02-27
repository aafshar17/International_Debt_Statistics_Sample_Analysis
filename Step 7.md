**Step 7**: **Country with the highest amount of external debt repayments**

The previous result shows that debt indicator DT.AMT.DLXF.CD is the indicator witht he highest average debt amount. 
As the indicator_name column points out, this category is comprised of repayments of long-term debts. It would be 
interesting to look more into this category for understanding what projects are being funded, etc.

One thing that stands out prominently is that the first two indicators have much larger average debt amounts than the
indicators thereafter. Perhaps this might mean that these are the most critical categories in which countries owe their
external debt. 

Let's explore which country owes the World Bank the highest average amount of debt in this category (DT.AMT.DLXF.CD). 

```sql
SELECT country_name, round((AVG(debt)/1000000)::numeric, 2) AS average_debt, indicator_name, indicator_code
FROM international_debt_statistics_summary
group by country_name, indicator_name, indicator_code
HAVING indicator_code = 'DT.AMT.DLXF.CD'
ORDER BY average_debt DESC
LIMIT 10;
```

![Step 7 Result](/Step_7_result.jpg)
