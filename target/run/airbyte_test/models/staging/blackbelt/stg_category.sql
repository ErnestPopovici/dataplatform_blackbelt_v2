

  create view "prod"."dbt_pfarey"."stg_category__dbt_tmp" as (
    select 
    id as category_id,
    name,
    jhi_type,
    order_category
from "prod"."public"."category"
  ) ;
