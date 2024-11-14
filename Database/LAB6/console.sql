/*1*/
select Flights.*,airline.*
from Flights
join airline on Flights.airline_id = airline.airline_id
where airline_name = 'IPC';


/*2*/
select Flights.*,airline.airline_name as Departure_airline_name
from Flights
join airline on Flights.airline_id = airline.airline_id;


/*3*/
select airline.*,flights.*
from airline
full join Flights on airline.airline_id = Flights.flight_id
    and flights.actual_departure > now()
    and flights.actual_departure <= now() + interval '1 month'
where flights.flight_id is null;

/*4*/
select passengers.*
from passengers
join flights on passengers.passenger_id = flights.flight_id
where flights.flight_id = 5;

/*5*/
select
    price,
    avg(price) as average_price,
    sum(price) as total,
    max(price) as max_price,
    min(price) as min_price
from booking
group by price ;

/*6*/
select flights.*,airport.*
from flights
join airport on flights.arrival_airport_id= airport.airport_id
where airport.country = 'France';



/*7*/
SELECT p.first_name, p.last_name, ar.airline_name AS arrival_destination
FROM passengers p
JOIN booking b ON p.passenger_id = b.passenger_id
JOIN booking_flight bf ON b.booking_id = bf.booking_id
JOIN flights f ON bf.flight_id = f.flight_id
JOIN airline ar ON f.arrival_airport_id=ar.airline_id
WHERE DATE_PART('year', AGE(p.date_of_birth)) <18;





/*8*/
SELECT p.first_name ||' '|| p.last_name AS full_name, p.passport_number, f.actual_arrival AS arrival_time
FROM passengers p
JOIN booking b ON p.passenger_id = b.passenger_id
JOIN booking_flight bf ON b.booking_id = bf.booking_id
JOIN flights f ON bf.flight_id = f.flight_id;
/*9*/
