-- Welcome to the Address Book System-Database
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

------ UC 3: Insert Values to Table ------
insert into  AddressBookDetails
values('Ashwani', 'Karma', '54 backstreet', 'NY', 'America', 123654, 09131715292, 'ashwani@email.com'),
('geetika', 'nag', '12 SM nagar', 'banglore', 'Karnataka', 100004, 70223865421, 'geetika@email.com'),
('gungun', 'karrma', '3 AB nagar', 'Noida', 'UP', 543201, 07869296597, 'karma@email.com'),
('khushi', 'nag', '84 MJ nagar', 'Chennai', 'Tamil Nadu', 129123, 09425594992, 'khushi@email.com')

--display table
select * from AddressBookDetails


----UC4 ability to edit existing contact using their name---
update AddressBookDetails set phoneNumber=62686548424 where firstName='gungun'

--UC5 ability to delete existing contact using their name--
delete from AddressBookDetails where firstName='gungun'

--UC6 -- ability to retrieve person using city or state from the table
select * from AddressBookDetails where city = 'Chennai' or state = 'karnataka'

------ UC 7: Ability to Retrieve Count of address book by city and state---
select Count(city) from AddressBookDetails
select count(state) from AddressBookDetails

--UC8 Sort Contacts By Name in a City
select * from AddressBookDetails 
WHERE city = 'banglore'
ORDER BY firstName

------ UC 9: Identify each Address Book with name andType ------
alter table AddressBookDetails 
add Book_Name VARCHAR(20),
Contact_Type VARCHAR(20)