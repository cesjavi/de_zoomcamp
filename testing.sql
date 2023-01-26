--select * from yellow_taxi_data
--where lpep_pickup_datetime::DATE = '2019-01-15'
--drop table yellow_taxi_data

--select trip_distance,lpep_pickup_datetime  from yellow_taxi_data
--order by trip_distance desc
/*
select count(*), passenger_count from yellow_taxi_data
where lpep_pickup_datetime::DATE = '2019-01-01'
group by passenger_count
*/
--select * from zone_lookup z
--where z."Zone" like '%Astoria%' --7
--select * from zone_lookup
select z."Zone", z2."Zone", y.tip_amount, y."PULocationID" from yellow_taxi_data y 
inner join zone_lookup z on y."PULocationID" = z."LocationID"
inner join zone_lookup z2 on y."DOLocationID" = z."LocationID"
where --."PULocationID" = 7
z."Zone" like '%Astoria%'
order by y.tip_amount desc
limit 10