select 
    id as category_id,
    name,
    jhi_type,
    order_category
from {{ source('blackbelt', 'category') }}