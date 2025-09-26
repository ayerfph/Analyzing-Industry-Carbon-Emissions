WITH max_year AS (
	SELECT MAX(year) AS year
	FROM product_emissions
),
query_table AS (
	SELECT 
		industry_group,
		COUNT(DISTINCT company) AS num_companies,
		ROUND(SUM(carbon_footprint_pcf), 1) AS total_industry_footprint 
	FROM product_emissions
	WHERE year IN (SELECT year FROM max_year)
	GROUP BY industry_group
)
-- Show final query output
SELECT *
FROM query_table
ORDER BY total_industry_footprint DESC;
