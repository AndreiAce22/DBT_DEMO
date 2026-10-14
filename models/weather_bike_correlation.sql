with CTE as (

    select 
    f.*, 
    w.*

    from 
    {{ ref('fct_trip') }} f
    left join {{ ref('daily_weather') }}  w
    on f.trip_date = w.daily_weather

    order by f.TRIP_DATE desc

)

select * from CTE