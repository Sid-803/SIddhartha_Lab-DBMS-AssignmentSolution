drop database if exists Lab4;
create database Lab4;
use Lab4;
drop table if exists supplier;
create table supplier(
SUPP_ID int primary key,
SUPP_NAME varchar(50) NOT null,
SUPP_CITY varchar(50) NOT null,
SUPP_PHONE varchar(50) NOT null
);

drop table if exists customer;
create table customer(
CUS_ID int Primary key,
CUS_NAME varchar(20) NOT null,
CUS_PHONE varchar(10) NOT null,
CUS_CITY varchar(10) NOT null,
CUS_GENDER char
);

drop table if exists category;
create table category(
CAT_ID int primary key,
CAT_NAME varchar(20) NOT null
);

drop table if exists product;
create table product(
PRO_ID int primary key,
PRO_NAME varchar(20) NOT null default "Dummy",
PRO_DESC varchar(60) Not null,
CAT_ID int,
Foreign Key(CAT_ID) References category(CAT_ID)
);

drop table if exists supplier_pricing;
create table supplier_pricing(
PRICING_ID int primary key,
PRO_ID int,
SUPP_ID int,
SUPP_PRICE int default 0,
Foreign key(PRO_ID)references product(PRO_ID),
Foreign key(SUPP_ID) references supplier(SUPP_ID)
);

drop table if exists orderr;
create table orderr(
ORD_ID int primary key,
ORD_AMOUNT int NOT null,
ORD_DATE date NOT Null,
CUS_ID int NOT null,
PRICING_ID int NOT null,
Foreign key(CUS_ID) references customer(CUS_ID),
Foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

drop table if exists rating;
create table rating(
RAT_ID int primary key,
ORD_ID int Not null,
RAT_RATSTARS int Not null,
Foreign key(ORD_ID) references orderr(ORD_ID)
);

insert into supplier values(1,"Rajesh Retails","Delhi", 1234567890);
insert into supplier values(2,"Appario Ltd","Mumbai", 2589631470);
insert into supplier values(3,"Knome products","Bangalore", 9785462315);
insert into supplier values(4,"Bansal Retails","Kochi", 8975463285);
insert into supplier values(5,"Mittal Ltd","Lucknow", 7898456532);

insert into customer values(1,"AAKASH",999999999,"Delhi", 'M');
insert into customer values(2,"AMAN",9785463215,"Noida", 'M');
insert into customer values(3,"NEHA",999999999,"Mumbai", 'F');
insert into customer values(4,"MEGHA",9994562399,"Kolkata", 'F');
insert into customer values(5,"PULKIT",7895999999,"Lucknow", 'M');

insert into category values(1,"BOOKS");
insert into category values(2,"GAMES");
insert into category values(3,"GROCERIES");
insert into category values(4,"ELECTRONICS");
insert into category values(5,"CLOTHES");

insert into product values(1,"GTA V","Windows 7 and above with i5 processor and 8 GB",2);
insert into product values(2,"T SHIRT","SIZE-L with Black, BLUE and WHITE variations",5);
insert into product values(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
insert into product values(4,"OATS","Highly Nutritious from Nestle",3);
insert into product values(5,"HARRY POOTER","Best Collection of all time by JK Rowling",1);
insert into product values(6,"MILK","1L Toned Milk",3);
insert into product values(7,"Boat Earphones","1.5 Meter long Dolby Atmos",4);
insert into product values(8,"JEANS","Stretchable Denim Jeans with Various sizes and color",5);
insert into product values(9,"PROJECT IGI","compatible with windows 7 and above",2);
insert into product values(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
insert into product values(11,"Rich Dad Poor Dad","Written by Robert Kiyosaki",1);
insert into product values(12,"Train Your Brain","By SHireen Stephen",1);

insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);

insert into orderr values(101,1500,"2021-09-17",2,1);
insert into orderr values(102,1000,"2021-10-16",3,5);
insert into orderr values(103,30000,"2021-10-16",5,2);
insert into orderr values(104,1500,"2021-10-16",1,1);
insert into orderr values(105,3000,"2021-10-16",4,3);
insert into orderr values(106,1450,"2021-09-18",1,4);
insert into orderr values(107,789,"2021-09-10",3,3);
insert into orderr values(108,780,"2021-09-10",5,5);
insert into orderr values(109,3000,"2021-09-07",5,3);
insert into orderr values(110,2500,"2021-09-01",2,4);
insert into orderr values(111,1000,"2021-08-18",4,5);
insert into orderr values(112,789,"2021-08-16",4,2);
insert into orderr values(113,31000,"2021-10-05",1,1);
insert into orderr values(114,1000,"2021-10-16",3,5);
insert into orderr values(115,3000,"2021-10-12",5,3);
insert into orderr values(116,99,"2021-10-06",2,4);

insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);

/*Queries*/
/*3*/
/*Gives  customers with order amount >=3000*/
Select * from customer join orderr on customer.CUS_ID = orderr.CUS_ID and ORD_AMOUNT>=3000 and customer.CUS_GENDER = "M" ;
/*Gives  count of customers with customer names customers with order amount >=3000*/
Select  customer.CUS_NAME,count(customer.CUS_GENDER) from customer join orderr on customer.CUS_ID = orderr.CUS_ID and ORD_AMOUNT>=3000  group by customer.CUS_NAME;