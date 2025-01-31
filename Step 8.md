**Step 8**: **Most common debt indicator**

The previous result shows that China has the highest amount of debt in the long-term debt (DT.AMT.DLXF.CD) category 
followed closely by Brazil. This result is verified by the World Bank on their site as well. 

While we know long-term debt is the category with the highest average debt amount, a natural follow up question
to this is to check if long-term debt is the most common indicator in which countries owe their debt. 

```sql
SELECT indicator_name, COUNT(indicator_code) AS debt_indicator_count
FROM international_debt_statistics_summary
group by indicator_code, indicator_name
ORDER BY debt_indicator_count DESC
LIMIT 20;
```

![Step 8 Result](/Step_8_result.jpg)
