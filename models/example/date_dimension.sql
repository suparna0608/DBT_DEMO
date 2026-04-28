WITH CTE AS (
    SELECT
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,


    CASE 
    WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('Sat','Sun')
    Then 'Weekend'
    else 'Businessday'
    End AS DAY,


    CASE WHEN MONTH(TO_TIMESTAMP(STARTED_AT)) IN ('12','1','2')
    THEN 'Winter'
    WHEN  MONTH(TO_TIMESTAMP(STARTED_AT)) IN ('3','4','5')
    THEN 'Spring'
    WHEN  MONTH(TO_TIMESTAMP(STARTED_AT)) IN ('6','7','8')
    THEN 'Summer'
    ELSE 'Autumn'
    End AS Station_of_Year
    FROM {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'
)
SELECT * FROM CTE