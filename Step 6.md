**Step 6**: **Find average debt amount across debt indicators**

The previous result shows that China is the country with the highest amount of total debt owed to the World Bank 
in this dataset. To find, a more detailed breakdown of China's debts, visit https://datatopics.worldbank.org/debt/ids/country/CHN

At this point, we have a solid quick overview of this dataset and some of its summary statistics. In addition, we have
insight into the different debt indicators for the countries debts. 

Exploring the average debt amount each country owes to the World Bank will provide a more clear picture regarding the 
distribution of debt across the different debt indicators.

```sql
SELECT indicator_code AS debt_indicator, round((AVG(debt)/1000000)::numeric, 2) AS average_debt, indicator_name
FROM international_debt_statistics_summary
group by debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 20;
```

![Step 6 Result](/Step_6_result.jpg)
