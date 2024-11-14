/*
 LAB4
 */
/*1*/select upper(airline_name) from airline  order by airline_name;

/*2*/
UPDATE airline
SET airline_name = REPLACE(airline_name, 'Air', 'Aero');
/*4*/
select * from airport
where air_name like '%Reginal%'
and air_name like '%Air%' order by air_name;
/*5*/
select first_name ||' '|| last_name as full_name,
to_char(date_of_birth,'Month DD, YYYY') as Formated_date
from passengers;
/*7*/
select  EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) AS age,
CASE
    when EXTRACT(year from Age(current_date,date_of_birth)) between 18 and 35 then 'Young'
    when EXTRACT(year from Age(current_date,date_of_birth)) between 36 and 50 then 'Adult'
    else 'Other'
end as level
from passengers;
/*8*/
select price_ticket,
case
    when price_ticket between 500 and 2000 then 'Cheap'
    when price_ticket between 2000 and 4000 then 'Medium'
    when price_ticket between 4000 and 6000 then 'Expencive'
    else 'Other'
end as categorizes
from airport;
/*9*/
select airline_country,count(airline_name) as Count_airline
from airline
group by airline_country;
/*10*/
