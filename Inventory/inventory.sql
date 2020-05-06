show databases;
create database inventory;
show databases;
use inventory;

show tables;
#making databases tables with 1.no constrain to them later with alter table,
#                      2.mistake in declare datatype length so that we can modify it later alter
create table salesman(
SALESMAN_ID int,
NAME varchar(30),
CITY varchar(15),
commision decimal(5.2)
);
alter table salesman
#modify the mistake datatype of column
modify commision decimal(5,2);
#view the semantics of database table 
desc salesman;

#adding constraints
alter table salesman add constraint primary key(salesman_id);
#*changing type of salesman_id so that later foreign key dont giver error as referenced table is going to have datatype numeric;
alter table salesman modify salesman_id numeric not null;


#Creating database table Customer with constraint within CREATE
create table customer(
customer_id int primary key not null,
city varchar(15),
cust_name varchar(25),
grade numeric(5),
salesman_id numeric(5)
);

##Creating referenced table orders With refrence from customer ,salesman table
create table orders (
ord_no int primary key not null,
purch_amt decimal(8,2),
ord_date date,
customer_id int ,
salesman_id numeric(5),
foreign key (customer_id) references customer(customer_id),
foreign key (salesman_id) references salesman(salesman_id)
);

#Describing orders
desc orders