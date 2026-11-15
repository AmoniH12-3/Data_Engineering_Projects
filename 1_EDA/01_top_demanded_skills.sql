SELECT
    sd.skills,
    COUNT(jpf.*) AS demand_count
FROM data_jobs_bonus.job_postings_fact AS jpf
INNER JOIN data_jobs_bonus.skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN data_jobs_bonus.skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
ORDER BY demand_count DESC
LIMIT 10;

/*
skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        33448 │
│ python     │        32746 │
│ aws        │        20228 │
│ azure      │        16392 │
│ spark      │        14167 │
│ airflow    │        11282 │
│ snowflake  │        10105 │
│ databricks │         9504 │
│ java       │         7955 │
│ gcp        │         7675 │
*/

