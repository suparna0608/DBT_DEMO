{% macro day_type(x) %}
 CASE 
    WHEN DAYNAME(TO_TIMESTAMP({{x}})) IN ('Sat','Sun')
    Then 'Weekend'
    else 'Businessday'
    End
{% endmacro %}