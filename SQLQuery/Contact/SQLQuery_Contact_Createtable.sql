--2. Viết các câu lệnh để tạo các bảng như thiết kế câu 1
create table Names(
Id int primary key identity (1,1),
Fullname nvarchar(20) not null,
Address nvarchar (100) not null,
Birthday date not null check(Birthday<getDate())
);

create table Contacts(
Id int primary key identity(1,1),
Tel nvarchar(255) not null,
NameId int foreign key references Names(Id)
);