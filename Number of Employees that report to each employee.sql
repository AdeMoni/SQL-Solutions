with rep_cnt as(
    Select reports_to, count(reports_to) as rc, round(avg(age),0) as aa from Employees
    where reports_to is not null
    Group by 1
)

Select r.reports_to as employee_id, e.name, rc as report_count, aa as average_age from rep_cnt r
left join Employees e on e.employee_id = r.reports_to
order by 1