select * from foodCategory;
select * from customers;
select * from menu;
select * from timeslots;
select * from tables;
select * from orderDetails;
select * from orders;
select * from Reservations;
SELECT current_date();
SELECT tables.TableId, timeslots.Slot
FROM (tables cross join timeslots)
WHERE (tables.TableId, timeslots.Slot) not in
(SELECT * FROM dailyReservation);

SELECT DATE_ADD( CURRENT_DATE(), interval 1 day);