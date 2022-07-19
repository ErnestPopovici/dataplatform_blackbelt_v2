with objective_content as(
    SELECT
        objective_id,
        listagg(content, ' || ') within group (order by created_date asc) as comment
    FROM {{ source('blackbelt', 'objective_comment') }}
    GROUP BY objective_id
),

objective_comment_rest as(
    select
        objective_id,
        cast(created_date as date),
        user_id
    from {{ source('blackbelt', 'objective_comment') }} 
),

final as (
    select 
        objective_comment_rest.user_id,
        objective_comment_rest.objective_id,
        objective_content.comment
    from objective_content
    left join objective_comment_rest
        ON objective_content.objective_id = objective_comment_rest.objective_id 
)
select * from final
