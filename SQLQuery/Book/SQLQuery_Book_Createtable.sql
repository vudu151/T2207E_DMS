create table Categories(               --identity chứa các giá trị tự động phát sinh tuần tự để nhận dạng duy nhất mỗi hàng trong một bảng
   Id int primary key identity(1,1),   --Chỉ kiểu dữ liệu int thì mới để được identity(1,1) thôi, còn kiểu khác thì ko
   Name nvarchar(25) not null          --nvarchar, ntext : là kiểu dữ liệu Chữ Mĩ Latinh có dấu    ( Có tiền tố "n" đứng trước kiểu dữ liệu
);
drop table Categories                  -- Lệnh xóa bảng đi thì mới tạo bảng được ( Bảng chỉ ấn chạy được một lần thôi , ấn lần thứ 2 sẽ bị lỗi => Dùng lệnh này)

create table Publishers(
   Id int primary key identity(1,1),
   Name nvarchar(255) not null unique,
   Address varchar(255) not null
);
drop table Publishers

create table Authors(
   Id int primary key identity(1,1),
   Name nvarchar(255) not null
);

create table Books(
   Code varchar(20) primary key,
   Name nvarchar(255) not null,
   Description text,
   PublishYear int not null,
   NumberOfPublish int not null check(NumberOfPublish>0) default 0,
   Price decimal(12,4) not null check (Price >=0) default 0,
   Qty int not null check(Qty>0), 
   CategoryId int foreign key references Categories(Id),
   PublisherId int foreign key references Publishers(Id)
);
drop table Books

create table BookAuthors(
   BookCode varchar(20) foreign key references Books(Code),
   AuthorId int foreign key references Authors(Id)
);
drop table BookAuthors