select name, sum(review_count) as total_count
from yelp_business
group by name
order by total_count DESC
limit 5;