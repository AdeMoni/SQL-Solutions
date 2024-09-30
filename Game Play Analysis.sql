With Minimum_date as (
    Select player_id, min(event_date) as first_login from Activity
    Group by player_id
)

Select Round(sum(if(datediff(a1.event_date, m.first_login) = 1,1,0)) / count(distinct a1.player_id), 2) as fraction from Activity a1
Join Minimum_date m on a1.player_id = m.player_id