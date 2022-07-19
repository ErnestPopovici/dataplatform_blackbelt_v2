select 
    id,
    category_id,
    discipline_id,
    description,
    evaluation_criteria
from {{ source('blackbelt', 'belt_objective') }}
