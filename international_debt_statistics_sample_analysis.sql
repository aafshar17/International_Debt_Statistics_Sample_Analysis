-- Connect to the international_debt database that contains the table international_debt_statistics_summary.
-- SELECT all of the columns from the international_debt_statistics_summary table and limit the output to first
-- ten rows. 

select * from international_debt_statistics_summary
limit 10;

-- The previous result only showed the amount of debt owed by Afghanistan across the various debt indicatiors. 
-- We want to know the number of different countries that are present in this dataset.
-- Find out the number of unique countries present in the table by using the SELECT DISTINCT statement to return only 
-- distinct(different) values for the country_name column. 

select * from international_debt_statistics_summary;
select count(distinct(country_name)) as Total_Distinct_Countries 
from international_debt_statistics_summary;

- The previous result indicates that there are a total of 124 countries present in this dataset. 

-- Now let's pivot to the column called indicator_name which gives a slight idea of the purpose for the country
-- incurring the debt. Next to it, the column indicator_code represents the category of these incurred debts. 

-- Understanding these different debt indicators can help provide context for the areas in which a country may be indebted.

select distinct(indicator_code) as debt_indicators
from international_debt_statistics_summary
group by debt_indicators
order by debt_indicators;

-- For a moment, let's move away from the different debt indicators and look on a broader, macro scale. 

-- Find the total amount of debt (in USD) that is owed by the different countries to the World Bank. 
-- Provides a baseline into how the overall current state of the world economy.  

select round((sum(debt)/1000000)::numeric, 2) as total_debt
from international_debt_statistics_summary;

-- The previous result provides the total of the debt amounts owed by the 124 countries in this dataset
-- across the different categories. 

-- Find out which country owns the highest amount of this total debt along with the listed debt amount.  

SELECT country_name, round((SUM(debt)/1000000)::numeric, 2) AS total_debt
FROM international_debt_statistics_summary
group by country_name
ORDER BY total_debt DESC
LIMIT 1;

-- The previous result shows that China is the country with the highest amount of total debt owed to the World Bank 
-- in this dataset. To find, a more detailed breakdown of China's debts, visit https://datatopics.worldbank.org/debt/ids/country/CHN

-- At this point, we have a solid quick overview of this dataset and some of its summary statistics. In addition, we have
-- insight into the different debt indicators for the countries debts. 

-- Exploring the average debt amount each country owes to the World Bank will provide a more clear picture regarding the 
-- distribution of debt across the different debt indicators.

SELECT indicator_code AS debt_indicator, round((AVG(debt)/1000000)::numeric, 2) AS average_debt, indicator_name
FROM international_debt_statistics_summary
group by debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 20;

-- The previous result shows that debt indicator DT.AMT.DLXF.CD is the indicator witht he highest average debt amount. 
-- As the indicator_name column points out, this category is comprised of repayments of long-term debts. It would be 
-- interesting to look more into this category for understanding what projects are being funded, etc.

-- One thing that stands out prominently is that the first two indicators have much larger average debt amounts than the
-- indicators thereafter. Perhaps this might mean that these are the most critical categories in which countries owe their
-- external debt. 

-- Let's explore which country owes the World Bank the highest average amount of debt in this category (DT.AMT.DLXF.CD). 


SELECT country_name, round((AVG(debt)/1000000)::numeric, 2) AS average_debt, indicator_name, indicator_code
FROM international_debt_statistics_summary
group by country_name, indicator_name, indicator_code
HAVING indicator_code = 'DT.AMT.DLXF.CD'
ORDER BY average_debt DESC
LIMIT 10;

-- The previous result shows that China has the highest amount of debt in the long-term debt (DT.AMT.DLXF.CD) category 
-- followed closely by Brazil. This result is verified by the World Bank on their site as well. 

-- While we know long-term debt is the category with the highest average debt amount, a natural follow up question
-- to this is to check if long-term debt is the most common indicator in which countries owe their debt. 


SELECT indicator_name, COUNT(indicator_code) AS debt_indicator_count
FROM international_debt_statistics_summary
group by indicator_code, indicator_name
ORDER BY debt_indicator_count DESC
LIMIT 20;

-- The previous result shows that there are 6 debt indicators for which all of the countries in this dataset have
-- incurred debt. This is important since it highlights that these countries are likely suffering from a common economic
--malady. There is more to uncover but this is a great starting point.  

-- Lastly, it would provide further context to find the maximum amount of debt 
-- across the indicators along with the respective country names. This is one possible way to 
-- identify other economic issues in the different countries. 


SELECT country_name, indicator_name, max(debt) AS max_debt
FROM international_debt_statistics_summary
group by country_name, indicator_name
ORDER BY max_debt DESC
LIMIT 20;