alter table public.security_check
add constraint fk_passengers
foreign key (passenger_id)
references public.passengers(passenger_id)
on delete cascade ;
/*2*/
alter table booking
add constraint fk_passengers
foreign key (passenger_id)
references passengers(passenger_id)
on delete cascade;
/*3*/
alter table public.baggage_check
add constraint fk_passengers
foreign key (passenger_id)
references public.passengers(passenger_id)
on delete cascade;
/*4*/
alter table public.flights
add constraint fk_airlain1
foreign key (airline_id)
references public.airlain1(airline_id)
on delete cascade;







/*5*/
alter table public.baggage
add constraint fk_boarding_pass
foreign key (baggage_id)
references public.boarding_pass(boarding_pass_id)
on delete cascade
/*6*/
alter table baggage_check
add constraint fk_booking
foreign key (booking_id)
references booking(booking_id)
on delete cascade;
/*7*/
alter table public.baggage
add constraint fk_booking
foreign key (booking_id)
references public.booking(booking_id)
on delete cascade;




/*8*/
alter table boarding_pass
add constraint fk_booking
foreign key (booking_id)
references booking(booking_id)
on delete cascade ;
/*9*/
alter table booking_flight
add constraint fk_booking
foreign key (booking_id)
references booking(booking_id)
on delete cascade ;

/*10*/
alter table booking_flight
add constraint fk_flight
foreign key (flight_id)
references flights(flight_id)
on delete cascade

