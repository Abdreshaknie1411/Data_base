/*1*/
create view flights_view as
    select * from flights
where actual_departure ='2023-10-30';
drop view flights_view;
/*2*/
create view bookingFlights as
select  booking.*,scheduled_departure
from booking
join flights  on booking.booking_id = flights.flight_id
where scheduled_departure between '2023-01-01' and '2023-01-08';
drop view bookingFlights;

/*3*/
create view must_Flight as
select f.flight_id,f.departing_gate, count(b.booking_id) as booking_total,ar.airline_name
from booking b
join booking_flight bf on b.booking_id =bf.booking_flight_id
join flights f on bf.booking_id=f.flight_id
join airline ar on f.airline_id = ar.airline_id
group by f.flight_id, f.departing_gate,ar.airline_name
order by booking_total desc
limit 5;
drop view
    must_Flight;
select * from must_Flight;

/*5*/
create or replace view airline_fligtht1 as
    select *
    from flights
where airline_id = random() and scheduled_departure =now()
                            and scheduled_departure = now() + interval '7 days';
/*4*/
create or replace view airline_fligtht as
    select *
    from flights
where airline_id = 5;

/*6*/
create view delayed_flight as
    select flights.*, ar.airline_name,scheduled_departure,actual_departure,(scheduled_departure-actual_departure) as Delayed
from flights
join airline ar on flights.airline_id = ar.airline_id
where (scheduled_departure-actual_departure) > interval '1 day';



/*7*/
create view Passsengers_view as
    select first_name ||' '|| last_name as full_name,country_of_citizenship
from passengers
join booking b on passengers.passenger_id = b.passenger_id
where b.booking_platform = 'Sauer-Breitenberg';


select * from Passsengers_view;
/*8*/
create or replace view topTenCount as
    select   ar.airline_name ,count(ar.airline_country) as must_country
        from flights f
join airline ar on f.airline_id = ar.airline_id
group by airline_name
order by must_country desc
limit 10;
drop view topTenCount;


/*9*/
update flights_view
set status = 'Delayed'
where actual_departure = '2023-10-30';

/*10*/
/*drop view */