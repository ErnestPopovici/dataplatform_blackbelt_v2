

  create view "prod"."dbt_pfarey"."stg_user_belt__dbt_tmp" as (
    select 
    id as user_belt_id,
    color,
    status,
    user_id,
    discipline_id,
    progression, 
    cast(created_date as date),
    cast(last_modified_date as date) as last_date
from "prod"."public"."user_belt"
  ) ;
