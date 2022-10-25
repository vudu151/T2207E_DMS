--2. Viết lệnh SQL chèn vào các bảng của CSDL các dữ liệu mẫu

insert into Categories(Name)
values (N'Khoa học xã hội'),
       (N'Văn học nghê thuật'),
	   (N'Khoa học công nghệ');
select * from Categories;

insert into Publishers(Name,Address)
values (N'Tri thức',N'53 Nguyễn Du, Hai Bà Trưng, Hà Nội'),
       (N'NXB Kim Đồng',N'54 Nguyễn Du, Hai Bà Trưng, Hà Nội'),
	   (N'NXB Giáo dục',N'55 Nguyễn Du, Hai Bà Trưng, Hà Nội');
select * from Publishers;

insert into Authors(Name)
values (N'Eran Katz'),
       (N'Nguyễn Du'),
	   (N'Ngô Bảo Châu');
select * from Authors;

insert into Books(Code,Name,Description,PublishYear,NumberOfPublish,Price,Qty,CategoryId,AuthorId,PublisherId)
values ('B001',N'Trí tuệ Do Thái',N'Sách về người Do Thái',2010,1,79000,100,1,1,1),
       ('B002',N'Truyện Kiều',N'Văn học Việt Nam',1814,11,300000,1000,2,2,2),
	   ('B003',N'Tin học đại cương',N'Lập trình cơ bản với C++',2002,3,60000,3200,3,3,3);
select * from Books;

insert into BookAuthors(BookCode,AuthorId)
values ('B001',1),
       ('B002',2),
	   ('B003',3);
select * from BookAuthors;