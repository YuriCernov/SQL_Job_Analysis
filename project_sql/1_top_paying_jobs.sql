/*
Question:
What are the top-paying remote Data Engineer jobs?

Objective:
- Identify the top 10 highest-paying Data Engineer roles.
- Focus only on remote positions.
- Exclude job postings without salary data.

Why this matters:
This query highlights the highest-paying remote opportunities for Data Engineers
and helps understand which companies offer the most competitive salaries.
*/

SELECT
    job_postings.job_id,
    job_postings.job_title,
    job_postings.job_location,
    job_postings.job_schedule_type,
    job_postings.salary_year_avg,
    job_postings.job_posted_date,
    company.name AS company_name
FROM
    job_postings_fact AS job_postings
LEFT JOIN company_dim AS company
    ON job_postings.company_id = company.company_id
WHERE
    job_postings.job_title_short = 'Data Engineer' 
    AND job_postings.job_location = 'Anywhere' 
    AND job_postings.salary_year_avg IS NOT NULL
ORDER BY
    job_postings.salary_year_avg DESC
LIMIT 10;