/*
Question: 
What skills are required for the top-paying Data Engineer jobs?

Objective: 
- Use the top 10 highest-paying remote Data Engineer jobs from the first query. 
- Identify the specific skills required for these roles. 
- Connect high-paying job opportunities with the skills they demand.

Why this matters: 
This query helps job seekers understand which skills are commonly required for 
the highest-paying remote Data Engineer roles.
*/

WITH top_paying_jobs AS (
    SELECT
        job_postings.job_id,
        job_postings.job_title,
        job_postings.salary_year_avg,
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
    LIMIT 10
)

SELECT
    top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg,
    top_paying_jobs.company_name,
    skills.skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim AS skills_to_job 
    ON top_paying_jobs.job_id = skills_to_job.job_id
INNER JOIN skills_dim AS skills 
    ON skills_to_job.skill_id = skills.skill_id
ORDER BY
    top_paying_jobs.salary_year_avg DESC;

/*
Among the top 10 highest-paying Data Engineer roles, Python appeared in 70% of postings, 
making it the most common skill. Spark was the second most frequent skill, appearing in 50% of roles. 
The strongest pattern among high-paying roles was not just programming knowledge, but experience 
with large-scale data processing tools such as Spark, Hadoop, Kafka, PySpark, and Databricks. 
This suggests that high-paying Data Engineer positions tend to prioritize distributed data 
infrastructure skills over basic database querying alone.

[
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "Durlston Partners",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "Durlston Partners",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "pytorch"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "azure"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "gcp"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "245000.0",
    "company_name": "Handshake",
    "skills": "go"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "perl"
  }
]
*/