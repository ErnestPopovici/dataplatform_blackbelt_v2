

  create view "prod"."dbt_pfarey"."stg_belt_objective__dbt_tmp" as (
    select 
    id,
    category_id,
    discipline_id,
    description,
    evaluation_criteria
from "prod"."public"."belt_objective"
  ) ;
