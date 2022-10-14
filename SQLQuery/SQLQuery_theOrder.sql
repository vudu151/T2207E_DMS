create table Clients(
   Id int primary key,
   Name nvarchar(100) not null,
   Tel int not null unique,
   Address varchar(100) not null unique
);
create table Products(
   Id int primary key,
   Ordinalnumbers int unique,
   Name nvarchar(100) not null,
   Describe nvarchar(100) not null,
   Unit nvarchar(20) not null,
   Amount int not null,
   Total int not null
);
create table Orders(
   Code int primary key,
   Date date not null,
   ClientId int not null foreign key references Clients(Id)
);
create table ClientProducts(
   ClientId int not null foreign key references Clients(Id),
   ProductId int not null foreign key references Products(Id)
);
create table OrderProducts(
   OrderCode int not null foreign key references Orders(Code),
   ProductId int not null foreign key references Products(Id)
);