with workflow_step as (
    select * from "prod"."public"."stg_workflow_step"
),

final as (
    select
        workflow_step.user_belt_id,
        workflow_step.status,
        workflow_step.status_level,
        workflow_step.created_date,
        LAG(workflow_step.created_date) OVER (PARTITION BY user_belt_id ORDER BY workflow_step.status_level) as workflow_created_date_previous_step,
        LAG(workflow_step.status) OVER (PARTITION BY user_belt_id ORDER BY workflow_step.status_level) as workflow_previous_step,
        LAG(workflow_step.status_level) OVER (PARTITION BY user_belt_id ORDER BY workflow_step.status_level) as workflow_previous_step_level,
        datediff(day, LAG(workflow_step.created_date) OVER (PARTITION BY user_belt_id ORDER BY workflow_step.status_level), workflow_step.created_date) as days_from_last_step        
    from workflow_step
)
select * from final