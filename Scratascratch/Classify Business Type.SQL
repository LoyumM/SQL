select DISTINCT business_name,
    case when business_name Ilike '%restaurant%' then 'restaurant'
    when business_name Ilike '%cafe%'
        or business_name Ilike '%coffee%'
        or business_name Ilike '%café%' then 'cafe'
    when business_name Ilike '%school%' then 'school'
    else 'other' 
    end as business_type
from sf_restaurant_health_violations
order by business_type