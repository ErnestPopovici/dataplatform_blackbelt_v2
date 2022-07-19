{% macro anonymose_if_null(column_name,null_refference) %}
    CASE
        WHEN {{null_refference}} < {{ dbt_date.now("America/New_York") }} AND {{null_refference}} IS NOT NULL THEN 'N/A'
        WHEN {{null_refference}} IS NULL THEN {{column_name}}
        WHEN {{null_refference}} >= {{ dbt_date.now("America/New_York") }} AND {{null_refference}} IS NOT NULL THEN {{column_name}}
    END AS {{column_name}}
{% endmacro %}