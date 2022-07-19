SELECT
    users.user_id,
    user_belt.user_belt_id,
    users.first_name,
    users.last_name,
    users.first_name+' '+users.last_name as full_name,
    users.email,
    users.agency,
    CASE 
        WHEN user_belt.color = 'ORANGE' then '1. ORANGE'
        WHEN user_belt.color = 'BLUE' then '3. BLUE'
        WHEN user_belt.color = 'GREEN' then '2. GREEN'
        WHEN user_belt.color = 'BROWN' then '4. BROWN'
        WHEN user_belt.color = 'BLACK' then '5. BLACK'
    END AS color,
    CASE 
        WHEN user_belt.color = 'ORANGE' then 1
        WHEN user_belt.color = 'BLUE' then 3
        WHEN user_belt.color = 'GREEN' then 2
        WHEN user_belt.color = 'BROWN' then 4
        WHEN user_belt.color = 'BLACK' then 5
    END AS color_level,
    workflow_step.status AS workflow_step,
    workflow_step.status_level,
    cast(workflow_step.status_level AS char) + '. ' + workflow_step.status AS status_level_and_name,
    workflow_step.workflow_previous_step,
    workflow_step.workflow_previous_step_level,
    cast(workflow_step.workflow_previous_step_level AS char) + '. ' + workflow_step.workflow_previous_step AS previous_step_level_and_name,
    discipline.title AS discipline,
    user_belt.progression,
    discipline.description,
    user_belt.created_date,
    workflow_step.created_date AS workflow_created_date,
    workflow_step.workflow_created_date_previous_step,
    user_belt.last_date,
    workflow_step.days_from_last_step,
    discipline.activated,
    user_belt.color+' | '+discipline.description+' | '+user_belt.created_date AS belt_title
FROM {{ ref('stg_workflow_step_duration')}} AS workflow_step
left join {{ ref('stg_user_belt')}} AS user_belt
    ON workflow_step.user_belt_id = user_belt.user_belt_id
left join {{ ref('stg_jhi_user')}} AS users
    ON users.USER_ID = user_belt.USER_ID
left join {{ ref('stg_discipline')}} AS discipline
    ON user_belt.discipline_id = discipline.discipline_id
WHERE 
    user_belt.color is NOT NULL AND discipline.activated = true AND user_belt.status = 'VALIDATED'