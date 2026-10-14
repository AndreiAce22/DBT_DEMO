WITH daily_weather as (

    select 
    date(time) as daily_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidity,
    round(avg(clouds),2) as avg_clouds
    from 
    {{ source('demo', 'weather') }}
    group by 
    date(time),
    weather

    qualify  ROW_NUMBER() over (partition by date(time) ORDER by count(weather) desc) = 1


)

select * from daily_weather