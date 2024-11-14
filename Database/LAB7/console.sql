/*1*/
create index index_fligths on flights /*using hash*/(actual_departure);
explain analyze
select actual_departure,flight_id
from flights
where actual_departure='2000-11-12';




/*2*/
create unique index index_flight_scheduled on flights (flight_no,scheduled_departure);
delete from flights
where flight_no = 'US-KS' and scheduled_departure='2023-09-04';
select flight_no,count(*)
from flights
group by flight_no
having flight_no>'1';










/*3*/
create index index_airport_id on flights(departure_airport_id,arrival_airport_id);
select indexname as index_name,indexdef as index_def
from pg_indexes
where tablename='flights';
/*4*/
select flight_id,actual_departure,actual_arrival
from flights
where arrival_airport_id =1  and departure_airport_id=2;
/*5*/
explain analyze
select flight_no,departure_airport_id,arrival_airport_id
from flights
where arrival_airport_id = 1 and departure_airport_id=5;



/*6*/
create unique index index_pass_num on passengers(passport_number);
drop index index_pass_num;
select
    indexname as index_name,
    indexdef as index_def
from pg_indexes
where tablename='passengers';

SELECT passport_number,count(*)
from passengers
group by passport_number
having passport_number>'1';

/*delete from passengers
where CTID not in(select min(CTID)from passengers group by passport_number);*/





/*7*/
create index index_passengers on passengers(first_name,last_name,date_of_birth,country_of_citizenship);
/*explain analyze*/
select first_name,last_name,date_of_birth,country_of_citizenship
from passengers
where country_of_citizenship ='France' and date_of_birth>='1984-01-01' and date_of_birth<='1984-12-31';
/*where country_of_citizenship='France' and date_part('year',date_of_birth)=1984;*/

/*8*/
create index people on passengers(first_name,last_name);
drop index people;

select
    indexname as index_name,
    indexdef as index_def
from
    pg_indexes
where
    tablename = 'passengers';


/*<< , &< , >> */