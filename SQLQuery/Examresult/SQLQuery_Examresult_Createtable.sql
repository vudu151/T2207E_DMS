create table Classes(
   Code varchar(20) primary key,              --primary key là khóa chính 
   Name varchar(255) not null unique,         --not null giống như requried trong HTML , yêu cầu phải điền 
   Classroom int                              --unique là duy nhất
);
create table Subjects(
   Code varchar(20) primary key,
   Name nvarchar(255) not null unique
);
create table Students(
   Code varchar(20) primary key,
   Name nvarchar(255) not null,
   Birthday date not null check (Birthday <getdate()),                       --check là kiểm tra để thỏa mãn điều kiện. Như ở đây là: Birthday không được là Ngày Mai( Getdaya(): tức trong tương lai)
   ClassCode varchar(20) not null foreign key references Classes(Code)       -- foreign key là khóa ngoại, references chỉ đến bảng Tham chiếu
);
create table Results(
   Id int primary key identity(1,1),
   Scores int not null check(Scores >=0 and Scores <=10) default 0,
   Result varchar(20) not null check(Result in (N'Yếu',N'Trung bình',N'Khá',N'Giỏi')),   --Liệt kê: Người làm chỉ được phép lựa chọn
   SubjectCode varchar(20) not null foreign key references Subjects(Code),
   StudentCode varchar(20) not null foreign key references Students(Code)
);
create table StudentSubjects(
   StudentCode varchar(20) not null foreign key references Students,
   SubjectCode varchar(20) not null foreign key references Subjects
);
