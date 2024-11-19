-- 1. What is the gender distribution of respondents from India?
SELECT gender, COUNT(*) AS count
FROM respondents
WHERE country = 'India'
GROUP BY gender;
---------------------------------------------------------------------
-- 2.What percentage of respondents from India are interested in education abroad and sponsorship?
SELECT
(SUM(CASE WHEN interested_in_education_abroad THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_interested_in_education_abroad,
(SUM(CASE WHEN interested_in_sponsorship THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_interested_in_sponsorship
FROM respondents
WHERE country = 'India';
----------------------------------------------------------------------------------------
-- 3. What are the 6 top influences on career aspirations for respondents in India?
SELECT influence, COUNT(*) AS count
FROM (
SELECT UNNEST(string_to_array(career_aspires, ',')) AS influence
FROM respondents
WHERE country = 'India'
) AS influences
GROUP BY influence
ORDER BY count DESC
LIMIT 6;
-----------------------------------------------------------------------------------------------
-- 4. How do career aspiration influences vary by gender in India?
SELECT gender, influence, COUNT(*) AS count
FROM (
SELECT gender, UNNEST(string_to_array(career_aspires, ',')) AS influence
FROM respondents
WHERE country = 'India'
) AS influences
GROUP BY gender, influence
ORDER BY gender, count DESC;
--------------------------------------------------------------------------------------------------
-- 5.Percentage of respondents willing to work for a company for at least 3 years
SELECT
(SUM(CASE WHEN willing_to_work_3_years THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_willing_to_work_3_years
FROM respondents;
------------------------------------------------------------------------------------------------------------------------
-- 6.Number of respondents who prefer to work for socially impactful companies
SELECT COUNT(*)
FROM respondents
WHERE company_preference = 'socially_impactful';
-----------------------------------------------------------------------------------------------------------------
-- 7.How does the preference for socially impactful companies vary by gender?
SELECT gender, COUNT(*) AS count
FROM respondents
WHERE company_preference = 'socially_impactful'
GROUP BY gender;
---------------------------------------------------------------------------------------------------
-- 8.What is the distribution of minimum expected salary in the first three years among respondents?
SELECT minimum_salary_3_years, COUNT(*) AS count
FROM respondents
GROUP BY minimum_salary_3_years
ORDER BY minimum_salary_3_years;
----------------------------------------------------------------------------------------------------------
-- 9.What is the expected minimum monthly salary in hand?
SELECT expected_monthly_salary, COUNT(*) AS count
FROM respondents
GROUP BY expected_monthly_salary
ORDER BY expected_monthly_salary;
-------------------------------------------------------------------------------------------------------------
-- 10.What percentage of respondents prefer remote working?
SELECT
(SUM(CASE WHEN remote_work_preference THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_remote_work_preference
FROM respondents;
---------------------------------------------------------------------------------------------------------------
-- 11.What is the preferred number of daily work hours?
SELECT preferred_work_hours, COUNT(*) AS count
FROM respondents
GROUP BY preferred_work_hours
ORDER BY preferred_work_hours;
-------------------------------------------------------------------------------------------------------------------
-- 12. What are the common work frustrations among respondents?
SELECT frustration, COUNT(*) AS count
FROM (
SELECT UNNEST(string_to_array(work_frustrations, ',')) AS frustration
FROM respondents
) AS frustrations
GROUP BY frustration
ORDER BY count DESC;
----------------------------------------------------------------------------------------------------------------------
-- 13. How does the need for work-life balance interventions vary by gender?
SELECT gender, COUNT(*) AS count
FROM respondents
WHERE need_work_life_balance_interventions
GROUP BY gender;
---------------------------------------------------------------------------------------------------------------------------
-- 14. How many respondents are willing to work under an abusive manager?
SELECT COUNT(*)
FROM respondents
WHERE willing_to_work_abusive_manager;
------------------------------------------------------------------------------------------------------------------------------
-- 15. What is the distribution of minimum expected salary after five years?
SELECT minimum_salary_5_years, COUNT(*) AS count
FROM respondents
GROUP BY minimum_salary_5_years
ORDER BY minimum_salary_5_years;
---------------------------------------------------------------------------------------------------------------------------
-- 16. What are the remote working preferences by gender?
SELECT gender,
SUM(CASE WHEN remote_work_preference THEN 1 ELSE 0 END) AS remote_preference_count,
COUNT(*) AS total_count
FROM respondents
GROUP BY gender;
---------------------------------------------------------------------------------------------------
-- 17. What are the top work frustrations for each gender?
SELECT gender, frustration, COUNT(*) AS count
FROM (
SELECT gender, UNNEST(string_to_array(work_frustrations, ',')) AS frustration
FROM respondents
) AS frustrations
GROUP BY gender, frustration
ORDER BY gender, count DESC;
---------------------------------------------------------------------------------------------------
-- 18.What factors boost work happiness and productivity for respondents?
SELECT factor, COUNT(*) AS count
FROM (
SELECT UNNEST(string_to_array(work_happiness_factors, ',')) AS factor
FROM respondents
) AS factors
GROUP BY factor
ORDER BY count DESC;
-------------------------------------------------------------------------------------------------------------------------
-- 19. What percentage of respondents need sponsorship for education abroad? sql queries
SELECT
(SUM(CASE WHEN education_abroad_sponsorship_needed THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS percent_sponsorship_needed
FROM respondents;