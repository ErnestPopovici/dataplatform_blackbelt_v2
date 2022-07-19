

  create  table
    "prod"."public"."gold_dim_user_belt__dbt_tmp"
    
    
    
  as (
    SELECT
    users.user_id,
    user_belt.user_belt_id,
    users.first_name,
    users.last_name,
    users.first_name+' '+users.last_name AS full_name,
    users.email,
    users.agency,
    CASE 
        WHEN user_belt.color = 'ORANGE' THEN '1. ORANGE'
        WHEN user_belt.color = 'BLUE' THEN '3. BLUE'
        WHEN user_belt.color = 'GREEN' THEN '2. GREEN'
        WHEN user_belt.color = 'BROWN' THEN '4. BROWN'
        WHEN user_belt.color = 'BLACK' THEN '5. BLACK'
    END AS color,
    CASE 
        WHEN user_belt.color = 'ORANGE' THEN 1
        WHEN user_belt.color = 'BLUE' THEN 3
        WHEN user_belt.color = 'GREEN' THEN 2
        WHEN user_belt.color = 'BROWN' THEN 4
        WHEN user_belt.color = 'BLACK' THEN 5
    END AS color_level,
    user_belt.status,
    discipline.title AS discipline,
    user_belt.progression,
    discipline.description,
    user_belt.created_date,
    workflow_step.created_date AS workflow_created_date,
    workflow_step.workflow_created_date_previous_step,
    user_belt.last_date,
    workflow_step.status_level,
    workflow_step.days_from_last_step,
    datediff(day, user_belt.created_date, user_belt.last_date) AS days_from_creation,
    user_belt.color+' | '+discipline.description+' | '+user_belt.created_date AS belt_title,
    discipline.activated
FROM "prod"."public"."stg_jhi_user" AS users
left join "prod"."public"."stg_user_belt" AS user_belt
    ON users.USER_ID = user_belt.USER_ID
left join "prod"."public"."stg_workflow_step_duration" AS workflow_step
    ON user_belt.user_belt_id = workflow_step.user_belt_id AND user_belt.status = workflow_step.status
left join "prod"."public"."stg_discipline" AS discipline
    ON user_belt.discipline_id = discipline.discipline_id 
WHERE 
    user_belt.color is NOT NULL AND discipline.activated = TRUE
  );