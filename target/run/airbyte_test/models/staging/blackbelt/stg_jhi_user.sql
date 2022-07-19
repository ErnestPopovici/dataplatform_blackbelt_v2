

  create view "prod"."public"."stg_jhi_user__dbt_tmp" as (
    select 
    id as user_id,
    end_date,
    
    CASE
        WHEN end_date < cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN 'N/A'
        WHEN end_date IS NULL THEN email
        WHEN end_date >= cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN email
    END AS email
,
    
    CASE
        WHEN end_date < cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN 'N/A'
        WHEN end_date IS NULL THEN first_name
        WHEN end_date >= cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN first_name
    END AS first_name
,
    
    CASE
        WHEN end_date < cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN 'N/A'
        WHEN end_date IS NULL THEN last_name
        WHEN end_date >= cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN last_name
    END AS last_name
,
    
    CASE
        WHEN end_date < cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN 'N/A'
        WHEN end_date IS NULL THEN agency
        WHEN end_date >= cast(convert_timezone('UTC', 'America/New_York', 
    getdate()
) as 
    timestamp without time zone
) AND end_date IS NOT NULL THEN agency
    END AS agency

from "prod"."public"."jhi_user"
  ) ;
