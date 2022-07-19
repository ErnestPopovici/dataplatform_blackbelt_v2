

  create view "prod"."public"."stg_objective_comments__dbt_tmp" as (
    select 
    id as objective_comment_id,
    cast(created_date as date),
    user_id,
    objective_id,
    content as objective_comment
from "prod"."public"."objective_comment"
  ) ;
