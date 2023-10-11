select count(case when customers.address is not null then orders.id end)*100/count(orders.id)
from orders
    left join customers
    on orders.cust_id = customers.id