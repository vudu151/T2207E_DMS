--2. Create table based on the above design.
create table Categories(
CateID char(6) primary key ,
CateName nvarchar(100) not null,
Description nvarchar(200)
);
create table Parts(
PartID int primary key identity(1,1),
PartName nvarchar(100) not null,
CateID char(6) foreign key references Categories(CateID),
Description nvarchar(1000),
Price money not null default 0,
Quantity int default 0,
Warranty int default 1,
Photo nvarchar(200) default 'photo/nophoto.png'
);

--3. Insert into each table at least three records.
insert into Categories(CateName,Description)
values ('RAM','More information about this category'),
       ('CPU','More information about this category'),
	   ('HDD','More information about this category');
select * from Categories;

insert into Parts(PartName,CateID,Description,Price,Quantity,Warranty,Photo)
values (N'A',1,N'New',50,1,10,N'No photo'),
       (N'A',2,N'New',100,2,10,N'No photo'),
	   (N'A',3,N'New',200,3,10,N'No photo');
select * from Parts;

--4. List all parts in the store with price > 100$.
select * from Parts where Price > 100;

--5. List all parts of the category ‘CPU’.
select * from Parts where CateID in
   (select CateID from Categories where CateName like N'CPU');

--6. Create a view v_Parts contains the following information (PartID, PartName, CateName,Price, Quantity) from table Parts and Categories.
create view v_Parts as
select a.PartID, a.PartName, b.CateName,a.Price,a.Quantity from Parts a
left join Categories b on a.CateID = b.CateID;
select * from v_Parts;

--7. Create a view v_TopParts about 5 parts with the most expensive price.
create view v_TopParts as
select top 5 PartName from Parts order by Price desc;
select * from v_TopParts;