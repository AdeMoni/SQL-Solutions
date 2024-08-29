With ca as (
    Select product_id, max(change_date) as datee from Products
    where change_date <= '2019-08-16'
    Group by 1
)

Select p.product_id, new_price as price from Products p
Join ca on p.product_id = ca.product_id and p.change_date = ca.datee
union
select distinct product_id, 10 as price from Products
Group by 1
Having min(change_date) > '2019-08-16'