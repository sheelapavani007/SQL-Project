SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High'
        WHEN salary_year_avg >= 70000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_bucket
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


SELECT
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High'
        WHEN salary_year_avg >= 70000 THEN 'Standard'
        ELSE 'Low'
    END AS salary_bucket,
    AVG(salary_year_avg) AS avg_salary
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
GROUP BY salary_bucket
ORDER BY avg_salary DESC;