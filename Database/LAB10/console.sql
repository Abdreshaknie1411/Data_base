/*Create a stored procedure to insert a new flight into the flights table.*//*1*/
create or replace procedure new_flight (flight_id int,scheduled_dep date,status Text)
language plpgsql as
$$
begin
    insert into flights(flight_id,scheduled_departure,status)
    values (new_flight.flight_id,scheduled_dep,new_flight.status);

    if not FOUND then
        raise exception 'ERROR %',flight_id;
    end if;


end;
$$;
select * from flights
where flight_id =10005;


/*Create a stored procedure to update the status of a flight.*//*2*/
create or replace procedure update_status(flights_id int,new_status text)
language plpgsql as
$$
begin
    update flights
    set status = new_status
    where flight_id = flights_id;

    if not FOUND then
        raise exception 'There is not id % ',flights_id;
    end if;

end;
$$;
select * from flights
where flight_id =1;

/*Create a stored procedure that returns a list of flights departing from a specific airport.*//*3*/
create procedure air_flights (airID int)
language plpgsql as
$$
    declare
        rec record;
begin
    for rec in
        select f.flight_id ,f.scheduled_departure,ar.airline_name
        from flights f
        join airline ar on f.airline_id = ar.airline_id
        where flight_id = airID
    loop
        raise notice 'FLight_id:%, scheduled_dep:%,airline name: %',rec.flight_id,rec.scheduled_departure,rec.airline_name;
    end loop;
end;
$$;
call air_flights(4);

/*Create a stored procedure to calculate the average delay time of flights arriving at a specific airport.*//*4*/
create procedure avgFlights(airId int)
language plpgsql as
$$
declare avg_DELAY interval;
begin
    select avg(actual_arrival - scheduled_arrival)
    into avg_DELAY
    from flights
    where flight_id = airId;

    if avg_DELAY is null then
        raise exception 'ERROR';
    else
        raise notice 'average delay: %',avg_DELAY;
    end if;

end;
$$;
call avgFlights(4);

/*Create a stored procedure that lists all passengers for a given flight number.*//*5*/
create procedure flight_passenger(flightsID int)
language plpgsql as
$$
declare rec record;
begin
    for rec in
        select p.first_name,p.last_name
        from passengers p
        join booking b on p.passenger_id = b.passenger_id
        join booking_flight bf on b.booking_id = bf.booking_id
        join flights f on bf.flight_id = f.flight_id
        where f.flight_id = flightsID
    loop
        raise notice 'First name:%,last name:%',rec.first_name,rec.last_name;
        end loop;
end;
$$;
call flight_passenger(5);
drop procedure flight_passenger(flightsID int);

/*Create a stored procedure to find the passenger who has taken the greatest number of flights.*/
create procedure problem6 ()
language plpgsql as
$$
    declare rec RECORD;
begin
    select p.first_name, p.last_name ,  count(bf.flight_id) as Flight_total
    into rec
        from passengers p
        join booking b on b.passenger_id = p.passenger_id
        join booking_flight bf on b.booking_id = bf.booking_id
        group by p.passenger_id
        order by Flight_total
        limit 1;
    raise notice 'first name: %, last name:%',rec.first_name,rec.last_name;
end;
$$;
call problem6();

/*7.Create a stored procedure to find all flights that are delayed by more than 24 hours.*/


/*8.Create a stored procedure that counts the number of flights for each airline*/
create procedure Count_number_flight(airName text)
language plpgsql as
$$
declare rec record;
begin
    for rec in
    select count(f.flight_id) as total_flight,ar.airline_name
    from flights f
    join airline ar on f.airline_id = ar.airline_id
    where ar.airline_name = airName
    group by ar.airline_name
    loop
        raise notice 'Total flight:%,airline name:%',rec.total_flight,rec.airline_name;
        end loop;
end;
$$;
call Count_number_flight('IPC');
drop procedure Count_number_flight(airName text);

/*9.Create a stored procedure to calculate the average ticket price for a specific flight.*/
create or replace procedure avgPriceTicket(flightsID int)
language plpgsql as
$$
    declare rec record;
begin
    for rec in
    select avg(b.price) as avgPrice, f.flight_id
        from booking b
        join booking_flight bf on b.booking_id = bf.booking_id
        join flights f on bf.flight_id = f.flight_id
        group by f.flight_id
        having f.flight_id = flightsID
    loop
        raise notice 'average price of ticket:%,flight id:%',rec.avgPrice,rec.flight_id;
        end loop;
end;
$$;
call avgPriceTicket(6);

/*10.Create a stored procedure to find the flight with the highest ticket price.
The procedure should return the flight number, the departure and arrival airports,
and the ticket price for the most expensive flight.*/
create or replace procedure Result_FLights()
language plpgsql as
$$
declare rec record;
begin
    for rec in
    SELECT b.price,f.flight_id,f.scheduled_departure,f.scheduled_arrival
    from flights f
    join booking_flight bf on f.flight_id = bf.flight_id
    join booking b on bf.booking_id = b.booking_id
    group by f.flight_id, f.scheduled_departure, f.scheduled_arrival,b.price
    order by b.price desc
        limit 2
    loop
        raise notice 'Most expencive:%,flight id:%,scheduled departure:%,scheduled arrival:%',rec.price,rec.flight_id,rec.scheduled_departure,rec.scheduled_arrival;
        end loop;

end;
$$;
call Result_FLights();
