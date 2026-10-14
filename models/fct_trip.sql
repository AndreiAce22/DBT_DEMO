with trip as (

    select 
    ride_id,
    -- rideable_type,
    DATE(to_TIMESTAMP(STARTED_AT)) as trip_date,
    start_statio_id as start_station_id,
    end_station_id,
    member_csual as member_casual,
    to_TIMESTAMP(ENDED_AT) - to_TIMESTAMP(STARTED_AT),
    datediff(second, to_TIMESTAMP(STARTED_AT),  to_TIMESTAMP(ENDED_AT)) as TRIP_DURATION_SECONDS
    
    from 
    {{ source('demo', 'bike') }} 
    

)


select * from trip