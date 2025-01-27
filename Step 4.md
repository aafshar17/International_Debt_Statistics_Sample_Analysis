**Step 4**: **Total Amount of Debt Owed to World Bank by Countries**

For a moment, let's move away from the different debt indicators and look on a broader, macro scale. 

Find the total amount of debt (in USD) that is owed by the different countries to the World Bank. 
Provides a baseline into how the overall current state of the world economy.  

```sql
select round((sum(debt)/1000000)::numeric, 2) as total_debt
from international_debt_statistics_summary;
```

![Step 4 Result](/Step_4_result.jpg)
