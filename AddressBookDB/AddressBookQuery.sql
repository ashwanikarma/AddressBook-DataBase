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

--Update values for Type=Friends--
update AddressBookDetails
set Book_Name='FriendName',Contact_Type='family'
where firstName='geetika' 

--Update values for Type=Family--
update AddressBookDetails
set Book_Name='FamilyName',Contact_Type='family'
where firstName='Ashwani'

--Update values for Type=Profession--
update AddressBookDetails
set Book_Name='Manager',Contact_Type='friend'
where firstName='khushi'
select * from AddressBookDetails

------ UC 10: Ability to get number of contact persons by Type------
select Count(*) as NumberOfContacts,Contact_Type
from  AddressBookDetails
Group by Contact_Type

-------- Creating Tables Based on ER Diagrams  --------
create table Address_Book
(
Address_BookID int identity(1,1) primary key,
Address_BookName varchar(200)
)
insert into Address_Book values ('Karma Book'),('Khushi Book')
select * from Address_Book

---- Create Contact_Person Table
create table Contact_Person(
AddressBook_ID int,
Contact_ID int identity(1,1) primary key,
FirstName varchar(100),
SecondName varchar(100),
Address varchar(250),
City varchar(100),
State varchar(100),
zip BigInt,
PhoneNumber BigInt,
Email varchar(200),
foreign key (AddressBook_ID) references Address_Book(Address_BookID))

   --- insert value in Contact_Person table

insert into  Contact_Person
values(1,'Ashwani', 'Karma', '54 backstreet', 'NY', 'America', 123654, 09131715292, 'ashwani@email.com'),
(2,'geetika', 'nag', '12 SM nagar', 'banglore', 'Karnataka', 100004, 70223865421, 'geetika@email.com'),
(2,'gungun', 'karrma', '3 AB nagar', 'Noida', 'UP', 543201, 07869296597, 'karma@email.com'),
(1,'khushi', 'nag', '84 MJ nagar', 'Chennai', 'Tamil Nadu', 129123, 09425594992, 'khushi@email.com')

select * from Contact_Person

 --- Create table for ContactType
create table ContactType
(ContactType_ID int identity(1,1) primary key,
ContactType_Name varchar(200)
)
--insert values in  ContactType table
insert into ContactType values
('Family'),('Friends'),('Profession')
select * from ContactType

  --- Create table for TypeManager 
create Table TypeManager(
ContactType_Identity int,
Contact_Identity int,
foreign key (ContactType_Identity) references ContactType(ContactType_ID),
foreign key (Contact_Identity) references Contact_Person(Contact_ID)
)
-- insert values in  TypeManager table
insert into TypeManager values
(1,3),
(2,3),
(3,1),
(1,2),
(2,4)
select * from TypeManager
