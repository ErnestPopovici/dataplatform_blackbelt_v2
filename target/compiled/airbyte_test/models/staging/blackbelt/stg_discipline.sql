select 
    id as discipline_id,
    title,
    description,
    activated
from "prod"."public"."discipline"
WHERE
    activated = true