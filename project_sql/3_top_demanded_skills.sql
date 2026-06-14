/*
Question: 
What are the most in-demand skills for remote Data Engineer jobs?

Objective: 
- Identify the top 5 skills most frequently required in remote Data Engineer job postings. 
- Count how many remote Data Engineer jobs mention each skill. 
- Calculate the percentage of remote Data Engineer jobs that require each skill.

Why this matters: 
This query highlights the most commonly requested skills in the remote Data Engineer 
job market, helping job seekers understand which skills are worth prioritizing.
*/

WITH remote_data_engineer_jobs AS (
    SELECT
        job_id
    FROM 
        job_postings_fact
    WHERE
        job_title_short = 'Data Engineer'
        AND job_work_from_home = TRUE
),

skill_demand AS (
    SELECT
        skills.skills,
        COUNT(remote_jobs.job_id) AS demand_count
    FROM 
        remote_data_engineer_jobs AS remote_jobs
    INNER JOIN skills_job_dim AS skills_to_job
        ON remote_jobs.job_id = skills_to_job.job_id
    INNER JOIN skills_dim AS skills
        ON skills_to_job.skill_id = skills.skill_id
    GROUP BY
        skills.skills
),

total_remote_jobs AS (
    SELECT
        COUNT(*) AS total_jobs
    FROM
        remote_data_engineer_jobs
)

SELECT
    skill_demand.skills,
    skill_demand.demand_count,
    ROUND(
        skill_demand.demand_count::NUMERIC / total_remote_jobs.total_jobs * 100, 2
    ) AS demand_percentage
FROM
    skill_demand
CROSS JOIN total_remote_jobs
ORDER BY
    skill_demand.demand_count DESC
LIMIT 5;