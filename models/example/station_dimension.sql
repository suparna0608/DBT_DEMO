WITH BIKE AS (
    SELECT distinct
    START_STATION_ID,
    START_STATION_NAME,
    START_LATITUDE,
    START_LONGITUDE

    FROM {{ ref('stage_bike') }}
    WHERE RIDE_ID != 'ride_id'

    limit 10
)
select *
from BIKE