create table Customers(
   Id int primary key identity(1,1),
   Name nvarchar(255) not null,
   Address nvarchar(255) not null,
   Tel nvarchar(15) not null unique check(Tel like '0%')
);
create table Products(
   Id int primary key identity(1,1),
   Name nvarchar(100) not null unique,
   Description ntext,
   Unit nvarchar(50) not null check(Unit in(N'Chiếc',N'Cặp',N'Bộ')),
   Price decimal(12,4) not null check(Price >=0) default 0
);
create table Orders(
   Id int primary key identity(1,1),
   OrderDate date not null check(OrderDate<=GetDate()),
   GrandTotal decimal(12,4) not null check(GrandTotal >=0),
   CustomerId int not null foreign key references Customers(Id)
);
create table OrderItems(
   Qty int not null check(Qty>0),
   Total decimal(12,4) not null check(Total>=0),
   ProductId int not null foreign key references Products(Id),
   OrderId int not null foreign key references Orders(Id)
);