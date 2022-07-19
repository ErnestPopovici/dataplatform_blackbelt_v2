select 
    id as discipline_id,
    title,
    description,
    activated
from {{ source('blackbelt', 'discipline') }}
WHERE
    activated = true