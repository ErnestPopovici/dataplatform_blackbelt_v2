

  create view "prod"."dbt_pfarey"."stg_discipline__dbt_tmp" as (
    select 
    id as discipline_id,
    title,
    description,
    activated
from "prod"."public"."discipline"
WHERE
    activated = true
  ) ;
