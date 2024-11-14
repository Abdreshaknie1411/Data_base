

/*Add a new airline named "KazAir" based in "Kazakhstan" to the airline table*/
insert into airport(air_name, air_country)
values('KazAir','Kazakhstan');

/*Update the airline country "KazAir" to "Turkey"*/
update airport
set air_country='Turkey'
where air_name='KazAir';
/*Remove the airline named "SIT" from the airline table*/
delete from airport
where air_code = 'SIT';
/*Add three airlines at once: "AirEasy" in "France", "FlyHigh" in "Brazil" and "FlyFly" in 	"Poland".*/
insert into airport(air_name,air_country)
values
('AirEasy','France'),
('FlyHigth','Brazil'),
('FlyFly','Poland');
/*Delete all flights whose arrival in 2024 year*/
delete from airport
where flight_year='2024';
/*Delete all tickets whose price is less than 1000 units*/
delete from airport
where price_ticket<1000;
/*Increase the price of all tickets in booking table for flights by 10%*/
update airport
set booking=booking * 1.10
where booking<2000;


/*Example*/
update airport
set air_code='KZ'
where air_name='KazAir';

update airport
set air_code=case
    when air_name=''



alter table airport
drop column departing_airport_id;

alter table airport
drop column arriving_airport_id;

select * from airport
where price_ticket>2000;

update airport
set price_ticket=3000
where air_country = 'United States';

select * from airport;
delete from airport where air_country='United States';

alter table baggage_check
add constraint fk_booking
foreign key (booking_id)
references booking(booking_id)
on delete cascade;

