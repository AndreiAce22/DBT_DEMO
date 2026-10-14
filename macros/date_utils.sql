{% macro function1(x) %}

CASE WHEN TO_TIMESTAMP({{x}}) < CURRENT_DATE THEN 'PAST' ELSE 'FUTURE' END

{% endmacro %}


{% macro function2(x) %}

CASE
    WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
    THEN 'WEEKEND' ELSE 'BUSINESSDAY' END

{% endmacro %}