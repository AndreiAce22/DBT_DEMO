with CTE as (

    select * from 
    {{ ref('fct_trip') }} limit 10

)

select * from CTE