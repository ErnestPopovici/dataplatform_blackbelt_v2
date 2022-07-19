

  create  table
    "prod"."public"."dim_workflow_step__dbt_tmp"
    
    
    
  as (
    SELECT * from "prod"."public"."stg_workflow_step_validated" UNION SELECT * from "prod"."public"."stg_workflow_step_non_validated"
  );