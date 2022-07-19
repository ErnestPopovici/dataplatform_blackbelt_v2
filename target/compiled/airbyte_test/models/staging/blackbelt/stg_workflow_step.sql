select 
    id as workflow_id,
    status,
    user_belt_id,
    case
        when workflow_step.status = 'VALIDATED' then 8
        when workflow_step.status = 'NEED_VALIDATION' then 7
        when workflow_step.status = 'IN_PROGRESS' then 6
        when workflow_step.status = 'DEFINE_OBJECTIVE' then 5
        when workflow_step.status = 'MENTOR_ASSIGNED' then 4
        when workflow_step.status = 'ACCEPTED' then 3
        when workflow_step.status = 'REFUSED' then 3
        when workflow_step.status = 'DESIRED' then 2
        when workflow_step.status = 'SELF_EVALUATION_REQUIRED' then 1
    end as status_level,
    cast (last_modified_date as date) as last_date,
    cast (created_date as date) as created_date
from "prod"."public"."workflow_step"