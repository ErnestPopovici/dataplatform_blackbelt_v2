with objective_comment as (
    SELECT 
        objective_id,
        listagg(content, ' || ') within group (order by created_date asc) as comment
    FROM {{ source('blackbelt', 'objective_comment') }} 
    WHERE LEN(content) > 6
    GROUP BY 1
)

SELECT 
    id,
    belt_objective_id,
    category_id,
    user_belt_id,
    created_date,
    objective_comment.comment
FROM {{ source('blackbelt', 'objective') }} left join objective_comment ON objective_id=id
WHERE objective_comment.comment is not NULL