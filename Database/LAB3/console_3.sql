select last_name as first_name
from passengers;

select distinct last_name
from passengers;

select * from passengers
where gender='Male'
    and date_of_birth between '1990-01-01' and '2000-01-01';

select price_ticket
from airport
order by price_ticket;


select * from airline
where airline_country='Kazakhstan';

update booking
set price = price -(price * 1.10)
where update_at='12-12-2010';

select * from baggage
where weight_in_kg>25.00
limit 3
;

(SELECT first_name || ' ' || last_name AS full_name,
        gender,
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) AS age
 FROM passengers
 WHERE gender = 'Male'
 ORDER BY date_of_birth DESC
 LIMIT 1)
UNION
(SELECT first_name || ' ' || last_name AS full_name,
        gender,
        EXTRACT(YEAR FROM AGE(CURRENT_DATE, date_of_birth)) AS age
 FROM passengers
 WHERE gender = 'Female'
 ORDER BY date_of_birth DESC
 LIMIT 1);






SELECT booking_platform,price AS cheapest_price
FROM booking
ORDER BY price desc offset 2 limit 3;