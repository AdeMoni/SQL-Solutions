/*
Table: Customer
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.
*/

with total_spend as (
    Select
        visited_on,
        sum(amount) as sum_spend
    From Customer
    Group by visited_on
),

rolling_avg as(
    Select
        visited_on,
        sum(sum_spend) OVER (order by visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) as amount,
        round(avg(sum_spend) OVER (order by visited_on ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) as average_amount,
        Row_number() OVER (order by visited_on) as week_count
    From total_spend
)

Select
    visited_on,
    amount,
    average_amount
From rolling_avg
where week_count > 6
