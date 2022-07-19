select 
    id as user_id,
    end_date,
    {{anonymose_if_null('email','end_date')}},
    {{anonymose_if_null('first_name','end_date')}},
    {{anonymose_if_null('last_name','end_date')}},
    {{anonymose_if_null('agency','end_date')}}
from {{ source('blackbelt', 'jhi_user') }}