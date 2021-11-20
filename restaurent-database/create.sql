create database restaurant;
drop database restaurant;
create table customers
(
	CustomerId int primary key auto_increment,
    CustomerName varchar(255),
    MobileNum varchar(10) unique key,
    Email varchar(255) unique key,
    Password varchar(255)
);
alter table customers drop constraint Email;

create table foodCategory
(
	CategoryId int primary key auto_increment,
    CategoryName varchar(255)
);

create table menu
(
	DishID int primary key auto_increment,
    DishName varchar(255),
    CategoryId int,
    Price float,
    Veg_NonVeg varchar(1),
    Description char,
    foreign key (CategoryId) references foodCategory(CategoryId) on delete cascade
);

create table orderDetails
(
	DetailsId int auto_increment,
    DishId int,
    Quantity int,
    primary key (DetailsId, DishId),
    foreign key (DishId) references menu(DishId) on delete cascade 
);

create table orders
(
	OrderID int primary key auto_increment,
    Date date,
    Time time,
    CustomerID int,
    DetailsId int,
    BillAmount int,
    foreign key (DetailsId) references orderDetails(DetailsId) on delete cascade,
    foreign key (CustomerId) references customers(CustomerId) on delete cascade
);
drop table orders;
create table cart
(
	CustomerId int,
    DishId int,
    Quantity int,
    primary key (CustomerId, DishId),
    foreign key (DishId) references menu(DishId) on delete cascade,
    foreign key (CustomerId) references customers(CustomerId) on delete cascade
);

create table timeslots
(
	Slot varchar(9) primary key
);

create table tables
(
	TableId int primary key auto_increment,
    Capacity int
);

create table Reservations
(
	ReservationId int not null auto_increment unique key,
	TableId int,
    Slot varchar(9),
    Date date,
    suggestions varchar(1000),
    foreign key (TableId) references tables(TableId),
    foreign key (Slot) references timeslots(Slot),
    primary key (Date,Slot,TableId)
);
drop table Reservations;







