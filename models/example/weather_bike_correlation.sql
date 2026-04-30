WITH CTE AS (
    SELECT
    t.*,
    w.*
  
    FROM {{ ref('trip_fact') }} t
    LEFT JOIN {{ ref('daily_weather') }} w
    on t.TRIP_DATE=w.DAILY_WEATHER
)

select *
from CTE