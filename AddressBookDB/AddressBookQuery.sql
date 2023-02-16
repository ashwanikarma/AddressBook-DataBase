﻿-- Welcome to the Address Book System-Database
--UC01- Create Address Book database

create database AddressBookDatabase;
use AddressBookDatabase;

----UC 2: Create Table----
create table AddressBookDetails(
firstName varchar(200) not null,
lastName varchar(200) not null,
address varchar(255) not null,
city varchar(255),
state varchar(255),
zip int,
phoneNumber bigint,
email varchar(200) not null
)
