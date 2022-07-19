SELECT
    objectives.comment as comment,
    cast(objectives.created_date as date) as created_date,
    discipline.title AS discipline,
    CASE 
        WHEN user_belt.color = 'ORANGE' THEN '1. ORANGE'
        WHEN user_belt.color = 'BLUE' THEN '3. BLUE'
        WHEN user_belt.color = 'GREEN' THEN '2. GREEN'
        WHEN user_belt.color = 'BROWN' THEN '4. BROWN'
        WHEN user_belt.color = 'BLACK' THEN '5. BLACK'
    END AS color,
    belt_objective.description AS objective_description,
    category.name as category_name,
    category.jhi_type AS skill_type,
    category.order_category,
    user_belt.user_belt_id
FROM {{ ref('stg_objective')}} AS objectives
left join {{ ref('stg_belt_objective')}} AS belt_objective
    ON objectives.belt_objective_id = belt_objective.id
left join {{ ref('stg_user_belt')}} AS user_belt
    ON user_belt.user_belt_id = objectives.user_belt_id
left join {{ ref('stg_discipline')}} AS discipline
    ON user_belt.discipline_id = discipline.discipline_id
left join {{ ref('stg_category')}} AS category
    ON belt_objective.category_id = category.category_id
WHERE
    discipline.activated = TRUE