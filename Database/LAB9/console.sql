/*1*/
begin;
select booking_id from booking where booking_id = 5;
savepoint Booking;
delete
from booking
where booking_id=99999;
rollback to  Booking;
commit;
/*2*/
begin;
update flights
set scheduled_departure = '2023-04-29'
where flight_id = 99999999;
rollback;
select * from flights
    where flight_id = 99999999;
/*commit; егер усыныс сатти болса */
/*3*/
begin;
update booking
set price = price * 0.9
where booking_id = 5;

select * from booking
where booking_id =5;

rollback;

select * from booking
where booking_id =5;
commit;

/*4*/
begin;
update passengers
set date_of_birth='2005-11-14',
    passport_number = 5353535
where passenger_id = 5;

update booking
set booking_platform='KZ-Air'
where passenger_id=5;

select * from passengers
where passenger_id = 5;
select * from booking
where passenger_id=5;
commit;

/*5*/
begin;
insert into passengers(passenger_id, first_name, date_of_birth, gender, country_of_citizenship, passport_number)
values
(250,'Akon','2005-11-14','Male','Kazakhstan',5550505);

insert into booking(booking_id, passenger_id, booking_platform, created_at, update_at, status, price)
values
(1000,250,'KZ-AIR','2025-05-28','2025-09-01','Delayed',1000);

select * from passengers
where passenger_id=250;
select * from booking
where passenger_id =250;
rollback;
commit;
/*6*/
begin;
update booking
set price = price * 0.9
from booking_flight bf
join public.flights f on bf.flight_id = f.flight_id
where booking.booking_id=bf.booking_id
    and f.flight_id =17;
commit;

rollback;

select  * from booking
where booking_id=7;

/*7*/
begin;
update baggage
set weight_in_kg = baggage.weight_in_kg +1.0
from booking b
join baggage bg on b.booking_id = bg.booking_id
where bg.booking_id=23;
rollback;

commit;

/*8*/
begin;
update booking
set price = 0.5
where booking_id = 15;

update booking
set price = price * booking.price
where booking_id=15;

rollback;

commit;

/*9*/
begin;
update booking_flight
set flight_id = 12
where flight_id=14;

rollback;
select * from booking_flight
    where flight_id=12;

commit;



begin;
insert into passengers(passenger_id, first_name, last_name, date_of_birth, gender, country_of_citizenship, passport_number)
values
(455,'GGG','HHH','2005-11-14','Male','KAZAKHSTAN',545454545);

insert into booking(booking_id, passenger_id, booking_platform, created_at, status, price)
values
(700,455,'KZ-AIR','2023-11-11','Delayed',5000);

rollback;
select * from booking
    where passenger_id = 455;
commit;

begin;
update passengers
set date_of_birth = '2005-01-01'
where last_name = 'HHH';

rollback;
select * from passengers
    where last_name = 'HHH';
commit;










