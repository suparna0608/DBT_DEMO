WITH CTE AS (
    SELECT
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,


   {{day_type('STARTED_AT')}} AS Day_Type,


    {{get_season('STARTED_AT')}} AS Station_of_Year ,

    {{function1('STARTED_AT')}} AS Time



    FROM {{ ref('stage_bike') }}
    where STARTED_AT != 'started_at'
)
SELECT * FROM CTE