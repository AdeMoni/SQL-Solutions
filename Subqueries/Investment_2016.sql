/*
Table: Insurance
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+

pid is the primary key (column with unique values) for this table.
Each row of this table contains information about one policy where:
pid is the policyholder's policy ID.
tiv_2015 is the total investment value in 2015 and tiv_2016 is the total investment value in 2016.
lat is the latitude of the policy holder's city. It's guaranteed that lat is not NULL.
lon is the longitude of the policy holder's city. It's guaranteed that lon is not NULL.
 

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.
*/

Select
    Round(Sum(tiv_2016),2) as tiv_2016
From Insurance
Where tiv_2015 in (
    Select
        tiv_2015
    From Insurance
    Group by 1
    Having count(*) > 1
)
and (lat, lon) In (
    Select
        lat,
        lon
    From Insurance
    Group by lat, lon
    Having count(*) = 1
)

/*
with same_tiv as (
    select
        In1.pid,
        In1.tiv_2015,
        In1.tiv_2016,
        In1.lat,
        In1.lon
    from Insurance In1 
    cross Join Insurance In2 on In1.pid = In2.pid
    where 
        abs(In1.pid - In2.pid) > 0
        and In1.tiv_2015 = In2.tiv_2015
)
*/