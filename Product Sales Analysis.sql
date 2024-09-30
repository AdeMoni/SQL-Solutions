With product_first as (
    Select s.product_id, product_name, min(year) as min_year from Sales s
    Inner Join Product p on s.product_id = p.product_id
    Group by 1
)

Select s.product_id, year as first_year, quantity, price from Sales s
Join product_first pf on s.product_id = pf.product_id and s.year = pf.min_year