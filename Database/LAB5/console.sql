/*1*/
alter table passengers
add constraint check_age check (extract(year from AGE(current_date,date_of_birth))>10);

/*2*/

alter table airport
add constraint check_price1 check ( price_ticket>100 and price_ticket<2000) ;
alter table airport
drop constraint check_price1;

SELECT * FROM airport WHERE price_ticket >  2000 and price_ticket < 100;
update airport set price_ticket =2250 where price_ticket<2000;
update airport set price_ticket =101 where price_ticket100;
delete from airport where price_ticket not between 100 and 2000;


/*3*/
alter table baggage
add constraint check_w check(weight_in_kg between 1.00 and 23.00);
SELECT * FROM baggage WHERE weight_in_kg NOT BETWEEN 1 AND 23;
UPDATE baggage SET weight_in_kg = 23 WHERE weight_in_kg > 23;
UPDATE baggage SET weight_in_kg = 1 WHERE weight_in_kg < 1;
DELETE FROM baggage WHERE weight_in_kg NOT BETWEEN 1 AND 23;

/*4*/

alter table airport
add constraint check_name_char check(length(air_name)>=10);
delete from airport where length(air_name)<10;


/*5*/

alter table airline
add constraint unique_code unique(airline_code);

alter table airport
add constraint unique_country unique(air_country);
DELETE FROM airport
    WHERE ctid NOT IN (SELECT MIN(ctid) FROM airport GROUP BY air_country);

alter index unique_name rename to unique_country;

alter table airport
drop constraint unique_name;

alter table baggage
add constraint unique_id unique(baggage_id);

alter table baggage_check
add constraint unique_check_result unique(check_result,createdat);

alter table boarding_pass
add constraint unique_seat unique(seat);

alter table booking
add constraint unique_status unique(status);
SELECT status, COUNT(*)
FROM booking
GROUP BY status
HAVING COUNT(*) > 1;

/*6*/
alter table passengers
add constraint male_female_check_age
    check(
        (gender ='Male' and extract(year from age(current_date,date_of_birth))>19 or
        (gender='Female'and extract(year from age(current_date,date_of_birth))>18
    )));
delete from passengers
where(
    (gender ='Male' and extract(year from age(current_date,date_of_birth))<=19 or
    (gender='Female'and extract(year from age(current_date,date_of_birth))<18
         )));
UPDATE passengers
SET date_of_birth = current_date - INTERVAL '20 years'
WHERE gender = 'Male' AND EXTRACT(YEAR FROM age(current_date, date_of_birth)) <= 19;


UPDATE passengers
SET date_of_birth = current_date - INTERVAL '20 years'
WHERE gender = 'Female' AND EXTRACT(YEAR FROM age(current_date, date_of_birth)) <= 18;

/*7*/
alter table passengers
add constraint check_country_year1
check (
    (country_of_citizenship='Kazakhstan' and extract(year from age(current_date,date_of_birth))>18) or
    (country_of_citizenship='France' and extract(year from age(current_date,date_of_birth))>17) or
    (country_of_citizenship not in ('Kazakhstan','France')or extract(year from age(current_date,date_of_birth))>19)
    );
alter table passengers
drop constraint check_country_year;

/*8*/
alter table booking
add column price1 decimal(5,2);
alter table booking
add constraint ticket_discount
check (
    (created_at > '2024-01-01' and price1=(price*5)/100) or
    (created_at<='2024-01-01'and price1=(price*10)/100)
    );

alter table passengers
add constraint check_nameLength
check (
    (gender='Male' and extract(year from age(current_date,date_of_birth))>19) or
    (gender='Male' and length(last_name)>10)
    );