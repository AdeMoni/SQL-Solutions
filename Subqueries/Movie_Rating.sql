/*
Table: Movies
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.
Each movie has a unique title.

Table: Users
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
The column 'name' has unique values.

Table: MovieRating
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 
 

Write a solution to:

Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

*/

With rated_movies as (
    Select 
        u.name,
        m.user_id,
        count(*) as num_ratings
    From MovieRating m
    Left join Users u ON m.user_id = u.user_id
    Group by m.user_id
    Order by 3 desc, 1 asc
    Limit 1
),

highest_avg as (
    Select
        mv.title,
        avg(rating) as avg_rating
    From MovieRating m
    Left join Movies mv ON m.movie_id = mv.movie_id
    where m.created_at between '2020-02-01' and '2020-02-29'
    Group by m.movie_id
    order by 2 desc, 1 asc
    limit 1
)

Select name  as results from rated_movies
union all
select title from highest_avg
