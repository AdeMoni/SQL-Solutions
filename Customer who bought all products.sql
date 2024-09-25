Select customer_id from Customer
Group by 1
having count(distinct product_key) = (Select count(product_key) from Product)