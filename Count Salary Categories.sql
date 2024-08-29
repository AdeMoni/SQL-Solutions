/*Select 
    case 
        when income < 20000 then 'Low Salary'
        when income between 20000 and 50000 then 'Average Salary'
        else 'High Salary'
    end as category,
    count(category)
from Accounts
Group by 1*/

Select 
    'Low Salary' as category,
    sum(income<20000) as accounts_count
from accounts

union

Select
    'Average Salary' as category,
    sum(income between 20000 and 50000) as accounts_count
from accounts

union

Select
    'High Salary' as category,
    sum(income>50000) as accounts_count
from accounts