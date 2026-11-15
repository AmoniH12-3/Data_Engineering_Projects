SELECT
    sd.skills,
    COUNT(sd.skills) AS skill_count,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary
FROM data_jobs_bonus.job_postings_fact AS jpf
INNER JOIN data_jobs_bonus.skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN data_jobs_bonus.skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND jpf.salary_year_avg IS NOT NULL
    AND jpf.job_work_from_home = TRUE
GROUP BY sd.skills
HAVING COUNT(sd.skills) > 100
ORDER BY median_salary DESC
LIMIT 25;
/*
 skills   │ skill_count │ median_salary │
│  varchar   │    int64    │    double     │
├────────────┼─────────────┼───────────────┤
│ terraform  │         226 │      164000.0 │
│ kubernetes │         189 │      155000.0 │
│ airflow    │         499 │      150000.0 │
│ kafka      │         351 │      145000.0 │
│ pandas     │         114 │      140000.0 │
│ go         │         157 │      140000.0 │
│ spark      │         620 │      140000.0 │
│ looker     │         106 │      139750.0 │
│ pyspark    │         209 │      139000.0 │
│ scala      │         292 │      137500.0 │
│ git        │         255 │      137000.0 │
│ java       │         360 │      135790.0 │
│ mongodb    │         158 │      135000.0 │
│ docker     │         176 │      135000.0 │
│ aws        │         972 │      135000.0 │
│ snowflake  │         566 │      135000.0 │
│ python     │        1385 │      135000.0 │
│ gcp        │         252 │      135000.0 │
│ nosql      │         222 │      134708.0 │
│ hadoop     │         220 │      132603.0 │
│ r          │         145 │      132500.0 │
│ databricks │         383 │      129500.0 │
│ sql        │        1407 │      127962.0 │
│ redshift   │         333 │      127600.0 │
│ bigquery   │         179 │      127500.0 │
└────────────┴─────────────┴───────────────┘
*/
