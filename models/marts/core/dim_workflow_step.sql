SELECT * from {{ ref('stg_workflow_step_validated')}} UNION SELECT * from {{ ref('stg_workflow_step_non_validated')}}