Select q1.person_name from Queue q1
Join Queue q2 on q1.turn >= q2.turn
group by q1.turn
Having sum(q2.weight) <= 1000
order by sum(q2.weight) desc
limit 1