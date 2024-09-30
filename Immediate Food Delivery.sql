Select round(sum(if(order_date = customer_pref_date, 1, 0)) * 100 / count(distinct customer_id), 2) as immediate_percentage from Delivery
where (customer_id, order_date) in (
    Select customer_id, min(order_date) from Delivery
    Group by customer_id
)