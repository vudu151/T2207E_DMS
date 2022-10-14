create table Categories(
   Id int primary key,
   Name nvarchar(25)          --nvarchar, ntext : là kiểu dữ liệu Chữ Mĩ Latinh có dấu    ( Có tiền tố "n" đứng trước kiểu dữ liệu
);
drop table Categories         -- Lệnh xóa bảng đi thì mới tạo bảng được ( Bảng chỉ ấn chạy được một lần thôi , ấn lần thứ 2 sẽ bị lỗi => Dùng lệnh này)

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

create table BookAuthors(
   BookCode varchar(20) foreign key references Books,
   AuthorId int foreign key references Authors
);
drop table BookAuthors