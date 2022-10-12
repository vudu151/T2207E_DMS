create table Categories(
   Id int primary key,
   Name varchar(25)
);

drop table Categories

create table Publishers(
   Id int primary key,
   Name varchar(255),
   Address varchar(255)
);
create table Authors(
   Id int primary key,
   Name varchar(255)
);

create table Books(
   Code varchar(20) primary key,
   Name varchar(255),
   Description text,
   PublishYear int,
   NumberOfPublish int,
   Price decimal(12,4),
   Qty int, 
   CategoryId int foreign key references Categories(Id),
   PublisherId int foreign key references Publishers(Id)
);
drop table Books

create table BookAuthors(
   BookCode varchar(20) foreign key references Books,
   AuthorId int foreign key references Authors
);
drop table BookAuthors