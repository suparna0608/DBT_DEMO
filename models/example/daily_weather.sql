WITH daily_weather as (
    select 
    DATE(TIME) AS daily_weather,
    weather,
    temp,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
),

daily_weather_agg as(
select 
daily_weather,
weather,
round(avg(temp),2) as Avg_temp,
round(avg(pressure),2) as Avg_pressure,
round(avg(humidity),2) as Avg_humidity,
round(avg(clouds),2) as Avg_clouds

from daily_weather

group by daily_weather,weather

qualify ROW_NUMBER() OVER (PARTITION BY daily_weather order by count(weather) desc) =1

)

select *
from daily_weather_agg