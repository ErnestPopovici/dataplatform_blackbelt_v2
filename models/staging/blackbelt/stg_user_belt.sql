select 
    id as user_belt_id,
    color,
    status,
    user_id,
    discipline_id,
    progression, 
    cast(created_date as date),
    cast(last_modified_date as date) as last_date
from {{ source('blackbelt', 'user_belt') }}